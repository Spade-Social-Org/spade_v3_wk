import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../logic_holder/bloc/camera_bloc/camera_bloc.dart';

// Import your camera and BLoC files here

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraBloc _cameraBloc;

  @override
  void initState() {
    super.initState();
    _cameraBloc = BlocProvider.of<CameraBloc>(context);
    _cameraBloc.add(CameraEvent.initializeCamera);
  }

  @override
  void dispose() {
    _cameraBloc.disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      builder: (context, state) {
        if (state is CameraCompletedState) {
          // Handle the media file captured or picked from the gallery
          // For example, you can show a preview of the media file here
          return Center(
            child: state.mediaFile != null
                ? Image.file(File(state.mediaFile!.path))
                : Text('No media captured'),
          );
        } else {
          return _buildCameraPreview();
        }
      },
    );
  }

  Widget _buildCameraPreview() {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: BlocBuilder<CameraBloc, CameraState>(
              builder: (context, state) {
                if (state is CameraCapturingState) {
                  return CameraPreview(_cameraBloc.cameraController);
                } else {
                  return Center(child: Text('Camera not initialized'));
                }
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.switch_camera),
              onPressed: () {
                _cameraBloc.add(CameraEvent.switchCamera);
              },
            ),
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () {
                _cameraBloc.add(CameraEvent.capturePhoto);
              },
            ),
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                _cameraBloc.add(CameraEvent.captureVideo);
              },
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                _cameraBloc.add(CameraEvent.pickImage);
              },
            ),
          ],
        ),
        BlocListener<CameraBloc, CameraState>(
          listenWhen: (previous, current) =>
              previous is CameraCompletedState &&
              current is CameraCapturingState,
          listener: (context, state) {
            // Show the animated slider when capturing begins
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Posting in progress...'),
              duration: Duration(seconds: 3),
              action: SnackBarAction(
                label: 'Cancel',
                onPressed: () {
                  _cameraBloc.add(CameraEvent.initializeCamera);
                },
              ),
            ));
          },
          child: Container(),
        ),
      ],
    );
  }
}
