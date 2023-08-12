import 'package:flutter/material.dart';

import '../../extensions/color_extention/color_extension.dart';



class ColorManager {
  static final white = HexColor.fromHex("#FFFFFF");
  static final grey = HexColor.fromHex("#8A8A8A");

  static final gradient1 = LinearGradient(
    begin: Alignment.topLeft,
    colors: [
      Color(0xFFD91A46),
      Color(0xFFFBAA47),
      Color(0xFFA60F93),
    ],
  );
}
