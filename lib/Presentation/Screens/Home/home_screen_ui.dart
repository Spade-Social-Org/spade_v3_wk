import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Data/mock_data/mock.dart';
import 'package:spade_v4/Presentation/widgets/home_screen_app_bar.dart';

import '../../../Data/Models/story/story.dart';
import '../../widgets/posts/posts.dart';
import '../../widgets/story/story.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  @override
  Widget build(BuildContext context) {
    final stories = StoriesDatabase.stories;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const HomeScreenAppBar(),
            SizedBox(height: 25.height()),
            StoryList(stories: stories),
            SizedBox(height: 46.height()),
            const PostUi(),
          ],
        ),
      ),
    );
  }
}
