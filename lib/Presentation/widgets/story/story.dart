import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../../Data/Models/story/story.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 79.height(),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return Story(story: story);
          }),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 21.width(),
      ),
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ProfileStoryNotViewed(story: story),
              ],
            ),
            SizedBox(
              height: 4.height(),
            ),
            Text(story.name, style: Inter.font400),
          ],
        ),
      ),
    );
  }
}

class ProfileStoryNotViewed extends StatelessWidget {
  const ProfileStoryNotViewed({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.width(),
      height: 54.height(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xFFD91A46),
            Color(0xFFFBAA47),
            Color(0xFFA60F93),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 0.50)),
        child: ProfileImage(story: story),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        story.imageFileName,
        fit: BoxFit.fill,
      ),
    );
  }
}
