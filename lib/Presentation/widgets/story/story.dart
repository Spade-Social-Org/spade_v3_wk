import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Presentation/widgets/story/view_story.dart';

import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../../Data/Models/story/story_view_model.dart';
import '../../../Data/data_source/remote_data_sorce/api2.dart';
import '../animated_route/animated_route.dart';
import 'add_story.dart';
import 'story_controller.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    Key? key,
  }) : super(key: key);

  // final Storyy story;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: ApiService.getAllStories(),
    builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return const Center(
          child: Text(
            'Poor internet connection',
            style: TextStyle(color: Colors.white),
          ),
        );
      } else if (StoryController().allStorys!.isEmpty) {
        return const Center(
          child: Text(
            'No story available',
            style: TextStyle(color: Colors.white),
          ),
        );
      } else {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 75.height(),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: StoryController().allStorys!.length,
          itemBuilder: (context, index) {
            return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 21.width(),
                  ),
                  child: Storys(story:StoryController().allStorys![index]),
                ));
          }),
    );
  }
}
    );
  }
}

class Storys extends StatelessWidget {
  const Storys({
    super.key, required this.story,
  });
    final Storyy story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            routeFade(
              page: const ViewStoryPage(),
            ),
          ),
          child: Container(
            width: 46.width(),
            height: 54.height(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.green,
                width: 2.5,
              ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                   story.posterImage,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        // SizedBox(
        //   height: 4.height(),
        // ),
        //  Text(
        //   story.posterName,
        //   style: Inter.font00,
        // ),
      ],
    );
  }
}
    

