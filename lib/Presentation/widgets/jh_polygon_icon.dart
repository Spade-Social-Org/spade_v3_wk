import 'dart:math';

import 'package:flutter/material.dart';

class JHPolygonIcon extends StatelessWidget {
  const JHPolygonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(30, 30), // Adjust the size of the icon as needed
      painter: _PolygonPainter(),
    );
  }
}

class _PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2.4;

    const int sides = 6; // Number of sides of the polygon
    const double angle = (2 * 3.1416) / sides;

    final path = Path();
    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));

    for (int i = 1; i <= sides; i++) {
      final double x = centerX + radius * cos(angle * i);
      final double y = centerY + radius * sin(angle * i);
      path.lineTo(x, y);
    }

    path.close();

    final paint = Paint()
      ..color = Colors.yellow // Adjust the color of the polygon icon
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PolygonPainter oldDelegate) => false;
}