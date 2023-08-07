import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Data/repository/camera_repository.dart';

// Camera BLoc event
enum CameraEvent { capturePhoto, captureVideo, switchCamera, pickImage, initializeCamera }

// Camera BLoc state
abstract class CameraState {}

class CameraIdleState extends CameraState {}

class CameraCapturingState extends CameraState {}

class CameraRecordingState extends CameraState {}

class CameraCompletedState extends CameraState {
  final XFile? mediaFile;

  CameraCompletedState(this.mediaFile);
}

// Camera BLoc
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraRepository cameraRepository;

  CameraBloc(this.cameraRepository) : super(CameraIdleState()) {
    // ignore: void_checks
    on<CameraEvent>((event, emit) async* {
      yield CameraCapturingState();
      switch (event) {
        case CameraEvent.capturePhoto:
          final photoFile = await cameraRepository.takePhoto();
          yield CameraCompletedState(photoFile);
          break;
        case CameraEvent.captureVideo:
          final videoFile = await cameraRepository.takeVideo();
          yield CameraCompletedState(videoFile);
          break;
        case CameraEvent.switchCamera:
          cameraRepository.switchCamera();
          yield CameraIdleState();
          break;
        case CameraEvent.pickImage:
          final imageFile = await cameraRepository.pickImageFromGallery();
          yield CameraCompletedState(imageFile);
          break;
          case CameraEvent.initializeCamera:
          
          break;
      }
    });
  }


  CameraController get cameraController => cameraController;

  void disposeCamera() {}
}
