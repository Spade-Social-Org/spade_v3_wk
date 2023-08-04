import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Presentation/logic_holder/bloc/camera_bloc/camera_bloc.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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

  Widget build(BuildContext context) {
    return Container();
  }
}
