// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageUrlPath {
  final String url;
  final String path;

  ImageUrlPath(this.url, this.path);
}

class Camera {
  Camera();

  final ImagePicker _picker = ImagePicker();

  static var videoFiles = <ImageUrlPath>[];
  static var imageFiles = <ImageUrlPath>[];

  void _onPermissionsDenied(PlatformException e) async {
    final settingString = e.code == 'photo_access_denied'
        ? 'photo library'
        : e.code == 'camera_access_denied'
            ? 'camera'
            : null;

    if (settingString != null) {
      openAppSettings();
      return;
    }
  }

  Future<String?> takeImage({ImageSource source = ImageSource.gallery}) async {
    /// Take image and return path

    try {
      final image = await _picker.pickImage(source: source);
      if (image == null) return null;
      return image.path;
    } on PlatformException catch (e) {
      _onPermissionsDenied(e);
      return null;
    }
  }

  Future<String?> takeVideo({ImageSource source = ImageSource.camera}) async {
    /// Take video and return path

    try {
      final video = await _picker.pickVideo(
        source: source,
        maxDuration: const Duration(seconds: 20),
      );

      if (video == null) return null;

      return video.path;
    } on PlatformException catch (e) {
      _onPermissionsDenied(e);
      return null;
    }
  }
}

final uploadProgressProvider = StateProvider<double?>((ref) {
  return null;
});
