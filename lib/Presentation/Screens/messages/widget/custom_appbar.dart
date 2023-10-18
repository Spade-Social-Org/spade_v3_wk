import 'package:flutter/material.dart';

import 'custom_iconbutton.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomAppbar({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          CustomIconButton(
              imageValue: 'Camera', onTap: () {}, size: 25, color: Colors.grey),
          CustomIconButton(
              imageValue: 'person-group', onTap: () {}, size: 23, color: color),
          CustomIconButton(
              imageValue: 'more-vert', onTap: () {}, size: 25, color: color)
        ],
      ),
    );
  }
}
