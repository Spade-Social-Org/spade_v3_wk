import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import 'add_story.dart';
import 'story.dart';


class StoryMode extends StatefulWidget {
  const StoryMode({super.key});

  @override
  State<StoryMode> createState() => _StoryModeState();
}

class _StoryModeState extends State<StoryMode> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 26.width()
        ),
        const AddStoryMain(),
        SizedBox(
          width: 13.5.width()
        ),
        const StoryList(),
      ],
    );
  }
}
