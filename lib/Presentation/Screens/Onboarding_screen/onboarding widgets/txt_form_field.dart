// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TxtFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const TxtFormField({
    Key? key,
    required this.hintText, required this.controller,
  }) : super(key: key);

  @override
  State<TxtFormField> createState() => _TxtFormFieldState();
}

class _TxtFormFieldState extends State<TxtFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
