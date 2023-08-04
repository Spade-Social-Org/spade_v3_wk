import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraRepository {
  late CameraController _cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);

    _cameraController = CameraController(backCamera, ResolutionPreset.medium);

    await _cameraController.initialize();
  }

  CameraController get cameraController => _cameraController;

// taking phone
  Future<XFile?> takePhoto() async {
    if (!_cameraController.value.isInitialized) return null;

    try {
      final imageFile = await _cameraController.takePicture();
      return imageFile;
    } catch (e) {
      print("Error capturing photo: $e");
      return null;
    }
  }

  //taking video
  Future<XFile?> takeVideo() async {
    if (!_cameraController.value.isInitialized) return null;

    try {
      final videoFile = await _cameraController.takePicture();
      return videoFile;
    } catch (e) {
      print("Error capturing photo: $e");
      return null;
    }
  }

  //switching between camera
  void switchCamera() async {
    final cameras = await availableCameras();
    final lensDirection = _cameraController.description.lensDirection;
    final newLens = lensDirection == CameraLensDirection.front
        ? CameraLensDirection.back
        : CameraLensDirection.front;

    final newCamera =
        cameras.firstWhere((camera) => camera.lensDirection == newLens);

    _cameraController = CameraController(
      newCamera,
      ResolutionPreset.medium,
    );

    _cameraController.initialize().then((value) {
      _cameraController.setFlashMode(FlashMode.off);
    });
  }

// dispose the camera
  void dispoeCamera() {
    _cameraController.dispose();
  }

  //image picker
  Future<XFile?> pickImageFromGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      return pickedFile;
    } catch (e) {
      print("Error picking image; $e");
      return null;
    }
  }
}
