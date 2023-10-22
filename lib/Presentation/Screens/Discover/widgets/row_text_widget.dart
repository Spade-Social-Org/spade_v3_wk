import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/custom_fonts.dart';

class Page2RowTextWidget extends StatelessWidget {
  final String? imageString;

  final String? text;
  const Page2RowTextWidget({
    super.key,
    this.imageString,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imageString!,
          height: 20,
        ),
        const SizedBox(width: 15),
        customText(
            text: text!,
            fontSize: 14,
            textColor: Colors.black,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
