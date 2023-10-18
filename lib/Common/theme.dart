import 'package:flutter/material.dart';

class CustomColors {
  static const Color pink = Color(0xFFE91E63);
  static const Color indigoDark = Color(0xFF1a237e);
  static const Color greenPrimary = Color(0xFF00C853);
  static const Color indigoLight = Color(0xFF9fa8da);
  static const Color indigoLigh = Color(0xFF9fa8da);
  static const Color indigoLigt = Color(0xFF9fa8da);
  static const Color indigoLiht = Color(0xFF9fa8da);
  static const Color black = Colors.black;
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
  Padding get p16 => Padding(padding: const EdgeInsets.all(16), child: this);
  Padding get p20 => Padding(padding: const EdgeInsets.all(20), child: this);
  Padding get p8 =>
      Padding(padding: const EdgeInsets.only(top: 8), child: this);
  Padding get p4 => Padding(padding: const EdgeInsets.all(8), child: this);

  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Horizontal Padding 16
  Padding get hP4 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: this);
  Padding get hP8 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: this);
  Padding get hP16 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: this);

  /// Vertical Padding 16
  Padding get vP16 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: this);

  Padding get vP36 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 36), child: this);
  Padding get vP8 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: this);
  Padding get vP4 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: this);
}

/// Other values
/// --------------------------------------------------------------------
Duration kAnimationDuration = const Duration(milliseconds: 200);

class FontSizes {
  static const double scale = 1.2;
  static const double extraSmall = 11 * scale;
  static const double small = 12 * scale;
  static const double body = 14 * scale;
  static const double base = 14 * scale;
  static const double bodySm = 12 * scale;
  static const double title = 16 * scale;
  static const double large16 = 16 * scale;
  static const double heading4 = 22 * scale;
  static const double heading3 = 25 * scale;
  static const double heading2 = 28 * scale;
  static const double heading1 = 32 * scale;
  static const double titleSmall = 16 * scale;
  static const double titleM = 18 * scale;
  static const double sizeXXl = 28 * scale;
  static const double sizeXl = 17 * scale;
  static const double large = 23 * scale;
}

class CustomTextStyle {
  static const extraSmall11 = TextStyle(
    fontSize: FontSizes.extraSmall,
    color: Colors.black,
  );

  static const small12 = TextStyle(
    fontSize: FontSizes.small,
    color: Colors.black,
  );

  static const base14 = TextStyle(
    fontSize: FontSizes.base,
    color: Colors.black,
  );

  static const large16 = TextStyle(
    fontSize: FontSizes.large16,
    color: Colors.black,
  );

  static const heading6_18 = TextStyle(
    fontSize: FontSizes.titleM,
    color: Colors.black,
  );

  static const heading5_20 = TextStyle(
    fontSize: FontSizes.titleM,
    color: Colors.black,
  );

  static const heading4_22 = TextStyle(
    fontSize: FontSizes.titleM,
    color: Colors.black,
  );

  static const heading3_25 = TextStyle(
    fontSize: FontSizes.heading3,
    color: Colors.black,
  );

  static const heading2_28 = TextStyle(
    fontSize: FontSizes.heading2,
    color: Colors.black,
  );

  static const heading1_32 = TextStyle(
    fontSize: FontSizes.heading1,
    color: Colors.black,
  );
}

class TextStyles {
  static TextStyle get title => const TextStyle(fontSize: FontSizes.title);
  static TextStyle get titleM => const TextStyle(fontSize: FontSizes.titleM);
  static TextStyle get titleSize15 =>
      title.copyWith(fontWeight: FontWeight.w500, fontSize: 15);
  static TextStyle get titleNormal => title.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: FontSizes.titleSmall,
      );
  static TextStyle get titleMedium =>
      titleM.copyWith(fontWeight: FontWeight.w300);
  static TextStyle get h1Style =>
      const TextStyle(fontSize: FontSizes.sizeXXl, fontWeight: FontWeight.bold);
  static TextStyle get h2Style => const TextStyle(
        fontSize: FontSizes.sizeXl,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get h3Large => const TextStyle(
        fontSize: FontSizes.large,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get headTitleColored => const TextStyle(
        fontSize: FontSizes.sizeXl,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      );
  static TextStyle get body =>
      const TextStyle(fontSize: FontSizes.body, fontWeight: FontWeight.w300);
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

extension TextStyleExtensions on TextStyle {
  /// w700
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  /// w700
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// w400
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  ///w300
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  /// w500
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  /// w600
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get white => withColor(Colors.white);
  TextStyle get black => withColor(Colors.black);

  /// With color
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  /// With size
  TextStyle withSize(double size) {
    return copyWith(fontSize: size);
  }

  /// With weight
  TextStyle withWeight(FontWeight weight) {
    return copyWith(fontWeight: weight);
  }
}
