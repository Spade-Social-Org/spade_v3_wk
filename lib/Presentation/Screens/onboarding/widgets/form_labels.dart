import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String formLabel;
  const FormLabel({
    Key? key,
    required this.formLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        formLabel,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
