import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String formTitle;
  const FormTitle({
    Key? key,
    required this.formTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      formTitle,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
    );
  }
}
