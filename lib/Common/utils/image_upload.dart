import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(BuildContext context, ImageSource imageSource) async {
  ImagePicker picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: imageSource);
  XFile? image;
  File? file;
  if (pickedFile != null) {
    image = XFile(pickedFile.path);
    file = File(image.path);
    // int sizeInBytes = file.lengthSync();
    // double sizeInMb = sizeInBytes / (1024 * 1024);
    return file;
  } else {
    debugPrint('No Image uploaded');
  }
  return null;
}
