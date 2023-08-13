import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import 'package:spade_v4/Common/managers/barrel_manager.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart';
import 'package:spade_v4/Data/data_source/remote_data_sorce/api2.dart';

import '../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../Data/Models/post.dart';
import '../../Data/mock_data/mock.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  void _selectMedia() async {
    final pickedMedia =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    // if (pickedMedia != null) {
    //   setState(() {
    //     _selectedFiles.add(File(pickedMedia.path));
    //   });

    // }
    if (pickedMedia != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ImageDisplayScreen(image: File(pickedMedia.path)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.width()),
          child: Text(
            'Feed',
            style: Inter.font600,
          ),
        ),
        SizedBox(
          width: 231.width(),
        ),
        GestureDetector(
            onTap: () {
              _selectMedia();
            },
            child: Icon(Icons.camera_alt_outlined,
                size: 20, color: ColorManager.grey)),
        SizedBox(width: 8.68.width()),
        GestureDetector(
            child: Icon(Icons.people_alt_outlined,
                color: ColorManager.grey, size: 19)),
        SizedBox(width: 8.68.width()),
        GestureDetector(
          child: Icon(Icons.notification_add_outlined,
              color: ColorManager.grey, size: 19),
        )
      ],
    );
  }
}

class ImageDisplayScreen extends StatefulWidget {
  final File? image;

  const ImageDisplayScreen({super.key, required this.image});

  @override
  State<ImageDisplayScreen> createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  final List<File> _selectedFiles = [];

  createPost() async {
    final payload = FormData.fromMap({
      "description": "",
      "is_story": false,
      "files": [
        for (var item in _selectedFiles) await MultipartFile.fromFile(item.path)
      ]
    });
    await ApiService.createPost(payload);
    // posts.add(PostModel.fromJson(data))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            widget.image!,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: Navigator.of(context).pop,
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: createPost,
            ),
          ),
        ],
      ),
    );
  }
}
