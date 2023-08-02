import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spade_v4/Common/managers/barrel_manager.dart';

import '../../Common/managers/font_style_manager/font_style_manager.dart.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
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
