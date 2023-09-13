import "package:flutter/material.dart";
import "package:spade_v4/Common/extensions/barrel_extensions.dart";

import "../../../Common/managers/barrel_manager.dart";

class NotWorking extends StatelessWidget {
  const NotWorking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetManager.notworking,
            width: 450.width(),
            height: 450.height(),
          ),
        ],
      ),
    );
  }
}
