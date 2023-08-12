import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import 'package:spade_v4/Common/managers/barrel_manager.dart';
import 'package:spade_v4/Data/data_source/remote_data_sorce/api2.dart';


import '../../Common/managers/font_style_manager/font_style_manager.dart.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {


  
  List<File> _selectedFiles = [];

  void _selectMedia() async {
    final pickedMedia = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedMedia != null) {
      setState(() {
        _selectedFiles.add(File(pickedMedia.path));
      });
    }
  }

  createPost()async {
final payload = FormData.fromMap({"description":"" "is_story": false, "files": [for (var item in _selectedFiles) await MultipartFile.fromFile(item.path)]});
   await ApiService.createPost(payload);
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