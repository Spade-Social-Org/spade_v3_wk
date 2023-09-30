import 'package:flutter/material.dart';

class CustomColors {
  static Color pink = Color(0xFFE91E63);
  static Color indigoDark = Color(0xFF1a237e);
  static Color greenPrimary = Color(0xFF00C853);
  static Color indigoLight = Color(0xFF9fa8da);
  static Color indigoLigh = Color(0xFF9fa8da);
  static Color indigoLigt = Color(0xFF9fa8da);
  static Color indigoLiht = Color(0xFF9fa8da);
  static Color black = Colors.black;
}

class AppTheme {
  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}

extension PaddingHelper on Widget {
  Padding get p16 => Padding(padding: EdgeInsets.all(16), child: this);
  Padding get p20 => Padding(padding: EdgeInsets.all(20), child: this);
  Padding get p8 => Padding(padding: EdgeInsets.only(top: 8), child: this);
  Padding get p4 => Padding(padding: EdgeInsets.all(8), child: this);

  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Horizontal Padding 16
  Padding get hP4 =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: this);
  Padding get hP8 =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: this);
  Padding get hP16 =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: this);

  /// Vertical Padding 16
  Padding get vP16 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 16), child: this);

  Padding get vP36 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 36), child: this);
  Padding get vP8 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);
  Padding get vP4 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);
}

/// Other values
/// --------------------------------------------------------------------
Duration kAnimationDuration = Duration(milliseconds: 200);

class FontSizes {
  static double scale = 1.2;
  static double get body => 14 * scale;
  static double get bodySm => 12 * scale;
  static double get title => 16 * scale;
  static double get titleSmall => 16 * scale;
  static double get titleM => 18 * scale;
  static double get sizeXXl => 28 * scale;
  static double get sizeXl => 17 * scale;
  static double get large => 23 * scale;
}

class TextStyles {
  static TextStyle get title => TextStyle(fontSize: FontSizes.title);
  static TextStyle get titleM => TextStyle(fontSize: FontSizes.titleM);
  static TextStyle get titleSize15 =>
      title.copyWith(fontWeight: FontWeight.w500, fontSize: 15);
  static TextStyle get titleNormal => title.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: FontSizes.titleSmall,
      );
  static TextStyle get titleMedium =>
      titleM.copyWith(fontWeight: FontWeight.w300);
  static TextStyle get h1Style =>
      TextStyle(fontSize: FontSizes.sizeXXl, fontWeight: FontWeight.bold);
  static TextStyle get h2Style => TextStyle(
        fontSize: FontSizes.sizeXl,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get h3Large => TextStyle(
        fontSize: FontSizes.large,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get headTitleColored => TextStyle(
        fontSize: FontSizes.sizeXl,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      );
  static TextStyle get body =>
      TextStyle(fontSize: FontSizes.body, fontWeight: FontWeight.w300);
  static TextStyle get bodySm => body.copyWith(fontSize: FontSizes.bodySm);
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
}