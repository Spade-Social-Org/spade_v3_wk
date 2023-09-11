import 'package:flutter/material.dart';

import '../../Common/theme.dart';

class JHScheduleButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const JHScheduleButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed;
      },
      child: Container(
          height: 25,
          width: 50 * 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 15,
              ),
            ),
          )),
    );
  }
}
