// // import 'package:flutter/material.dart';
// // import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
// // import 'package:spade_v4/Presentation/widgets/home_screen_app_bar.dart';

// // import '../../widgets/posts/posts.dart';
// // import '../../widgets/story/story.dart';

// // class HomeScreenUi extends StatefulWidget {
// //   const HomeScreenUi({super.key, required this.story});
// //   final StoryList story;

// //   @override
// //   State<HomeScreenUi> createState() => _HomeScreenUiState();
// // }

// // class _HomeScreenUiState extends State<HomeScreenUi> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: Colors.black,
// //         body: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               const HomeScreenAppBar(),
// //               SizedBox(height: 25.height()),
// //              StoryList(story: ),
// //               SizedBox(height: 46.height()),
// //               const PostUi(),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
// import 'package:spade_v4/Data/data_source/remote_data_sorce/api2.dart';
// import 'package:spade_v4/Presentation/widgets/home_screen_app_bar.dart';

// import '../../widgets/posts/posts.dart';
// import '../../widgets/story/story_mode.dart';

// class HomeScreenUi extends StatefulWidget {
//   const HomeScreenUi({Key? key}) : super(key: key);

//   @override
//   State<HomeScreenUi> createState() => _HomeScreenUiState();
// }

// class _HomeScreenUiState extends State<HomeScreenUi> {
//   Future<void> _loadResources(bool reload) async {
//     // PostController().allPosts;
//     // StoryController().allStorys;
//     await ApiService.getAllPost();
//     await ApiService.getAllStories();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadResources(true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: SingleChildScrollView(
//           child: RefreshIndicator(
//             onRefresh: () async {
//               await _loadResources(true);
//             },
//             child: Column(
//               children: [
//                 const HomeScreenAppBar(),
//                 SizedBox(height: 25.height()),
//                 const StoryMode(),
//                 SizedBox(height: 46.height()),
//                 const PostUi(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Data/data_source/remote_data_sorce/api2.dart';
import 'package:spade_v4/Presentation/widgets/home_screen_app_bar.dart';
import 'package:spade_v4/Presentation/widgets/posts/post_controller.dart';

import '../../widgets/posts/posts.dart';
import '../../widgets/story/story_controller.dart';
import '../../widgets/story/story_mode.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({Key? key}) : super(key: key);

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  Future<void> _loadResources(bool reload) async {
    PostBloc().allPostsStream;
    StoryController().allStorys;
    // await getAllPost();
    await ApiService.getAllStories();
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
