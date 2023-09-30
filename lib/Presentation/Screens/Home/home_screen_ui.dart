import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Data/cubit/posts_cubit.dart';
import 'package:spade_v4/Presentation/widgets/home_screen_app_bar.dart';

import '../../widgets/post_controller.dart';
import '../../widgets/posts.dart';
import '../../widgets/story_controller.dart';
import '../../widgets/story_mode.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({Key? key}) : super(key: key);

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  // final postBloc = BlocProvider.of<PostsCubit>(context);

  Future<void> _loadResources(bool reload) async {
    // PostBloc().loadedPosts;
    StoryBloc().allStorysStream;
    PostsCubit().fetchPosts();
  }

  @override
  void initState() {
    super.initState();
    _loadResources(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: () async {
            await _loadResources(true);
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeScreenAppBar(),
                SizedBox(height: 25.height()),
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    StoryMode(),
                    SizedBox(height: 46),
                    PostUi(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
