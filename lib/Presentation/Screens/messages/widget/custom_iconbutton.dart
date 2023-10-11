import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String imageValue;
  final VoidCallback onTap;
  final double size;
  final Color? color;

  const CustomIconButton({
    super.key,
    required this.imageValue,
    required this.onTap,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: size,
          width: size,
          child: Image.asset(
            'assets/images/$imageValue.png',
            height: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
