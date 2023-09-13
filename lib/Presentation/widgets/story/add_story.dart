import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import '../../../Common/managers/asset_manager/asset_manager.dart';
import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../Screens/Camera/camera_screen.dart';

class AddStoryMain extends StatefulWidget {
  const AddStoryMain({super.key});

  @override
  State<AddStoryMain> createState() => _AddStoryMainState();
}

class _AddStoryMainState extends State<AddStoryMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child: Stack(
            children: [
              Container(
                height: 54.height(),
                width: 46.width(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.grey,
                  ),
                ),
                child:
                    Image.asset(AssetManager.arrowIcon10, fit: BoxFit.contain),
              ),
              Positioned(
                bottom: 0,
                right: 3,
                child: Container(
                  height: 12.height(),
                  width: 12.width(),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.4, color: Colors.grey),
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      iconSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.height(),
        ),
        const Text(
          'My Story',
          style: Inter.font00,
        ),
      ],
    );
  }
}
