import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../../Data/Models/story/story_view_model.dart';
import '../../../Data/data_source/remote_data_sorce/api2.dart';
import 'animated_route.dart';
import 'story_controller.dart';
import 'view_story.dart';

class StoryList extends StatefulWidget {
  const StoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {

final _storyBloc = StoryBloc(); 

  @override
  void initState() {
    super.initState();
    _loadStorys();
  }

  Future<void> _loadStorys() async {
    try {
      final storys = await ApiService.getAllStories();
      _storyBloc.addStorys(storys);
    } catch (error) {
      print('Error loading posts: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Storyy>>(
      stream: _storyBloc.allStorysStream, 
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
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No story available',
              style: TextStyle(color: Colors.white),
            ),
          );
          } else {
            final story = snapshot.data;
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 75.height(),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: story!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 21.width(),
                          ),
                          child: Storys(
                              story: story[index]),
                        ));
                  }),
            );
          }
        });
  }
}

class Storys extends StatelessWidget {
  const Storys({
    super.key,
    required this.story,
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
              page: ViewStoryPage(storry: story),
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
        SizedBox(
          height: 4.height(),
        ),
        Text(
          story.posterName,
          style: Inter.font00,
        ),
      ],
    );
  }
}
