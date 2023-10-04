// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/questions_enum.dart';

class RadioTileWidget extends StatefulWidget {
  final Text title;
  final dynamic value;
  final dynamic groupValue;
  final Function(Question1Enum?)? onChanged;
  const RadioTileWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RadioTileWidget> createState() => _RadioTileWidgetState();
}

class _RadioTileWidgetState extends State<RadioTileWidget> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<Question1Enum>(
      activeColor: Colors.white,
      title: widget.title,
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: widget.onChanged,
    );
  }
}
