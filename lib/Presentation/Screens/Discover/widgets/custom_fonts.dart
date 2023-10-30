import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  required String text,
  required double fontSize,
  required Color textColor,
  GlobalKey? key,
  FontWeight? fontWeight,
  TextAlign? textAlignment,
  int? lines,
}) =>
    Text(
      text,
      key: key,
      textAlign: textAlignment ?? TextAlign.left,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: textColor,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize,
        ),
      ),
      maxLines: lines ?? 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
