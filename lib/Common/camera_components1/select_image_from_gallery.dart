import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Presentation/widgets/image_ filter_screen.dart';
import '../image_properties.dart';
import '../navigator.dart';
import '../routes/routes.dart';

class SelectImageFromGalleryButton extends StatelessWidget {
  const SelectImageFromGalleryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectMedia(context);
      },
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black38,
        child: Icon(
          Icons.photo,
          size: 30,
        ),
      ),
    );
  }

  void selectImageFromGallery(BuildContext context) async {
    File? image = await pickImageFromGallery(context);
    //if (!mounted) return;
    if (image != null) {
      // ignore: use_build_context_synchronously
      navigateTo(
        context,
        Routes.imageSendingScreen,
      );
    }
  }
}

void _selectMedia(context) async {
  final pickedMedia =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedMedia != null) {
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SendImageScreen2(image: File(pickedMedia.path)),
      ),
    );
  }
}
