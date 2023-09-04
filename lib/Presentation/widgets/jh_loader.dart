import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class JHLoadingSpinner extends StatelessWidget {
  final Color color;
  final double size;

  const JHLoadingSpinner({
    Key? key,
    this.color = Colors.white,
    this.size = 250.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: color,
      size: size,
    );
  }
}
