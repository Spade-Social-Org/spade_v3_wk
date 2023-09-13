import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Common/managers/barrel_manager.dart';

import '../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../Screens/Camera/camera_screen.dart';
import '../Screens/notworking/notworking.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.height()),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 25.width(),
            ),
            child: const Text(
              'Feed',
              style: Inter.font600,
            ),
          ),
          SizedBox(
            width: 240.width(),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraScreen(
                      receiverId: "",
                    ),
                  ),
                );
              },
              child: Icon(Icons.camera_alt_outlined,
                  size: 20, color: ColorManager.grey)),
          SizedBox(width: 12.width()),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotWorking(),
                  ),
                );
              },
              child: Icon(Icons.people_alt_outlined,
                  color: ColorManager.grey, size: 19)),
          SizedBox(width: 12.width()),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotWorking(),
                ),
              );
            },
            child: Icon(Icons.notification_add_outlined,
                color: ColorManager.grey, size: 19),
          )
        ],
      ),
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
  // final List<File> _selectedFiles = [];

  // createPost() async {
  //   final payload = FormData.fromMap({
  //     "description": "",
  //     "is_story": false,
  //     "files": [
  //       for (var item in _selectedFiles) await MultipartFile.fromFile(item.path)
  //     ]
  //   });
  //   await ApiService.createPost(payload);

  //   // posts.add(PostModel.fromJson(data))
  // }

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
          // Positioned(
          //   bottom: 20.0,
          //   right: 20.0,
          //   child:
          //   IconButton(
          //     icon: const Icon(Icons.send, color: Colors.white),
          //     onPressed: postService.addNewPost(images),
          //   ),
          // ),
        ],
      ),
    );
  }
}
