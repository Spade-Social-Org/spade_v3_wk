import 'package:flutter/material.dart';

class JHMainButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;
  const JHMainButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        height: 50,
        minWidth: double.infinity,
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ));
  }
}
