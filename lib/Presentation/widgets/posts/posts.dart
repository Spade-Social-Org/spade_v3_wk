import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart';
import 'package:spade_v4/Presentation/widgets/posts/add_post_card.dart';
import 'package:spade_v4/Presentation/widgets/posts/post_controller.dart';

import '../../../Data/data_source/remote_data_sorce/api2.dart';

class PostUi extends StatefulWidget {
  const PostUi({super.key});

  @override
  State<PostUi> createState() => _PostUiState();
}

// class _PostUiState extends State<PostUi> {

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiService.getAllPost(),
//       builder: (_, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return const Center(
//             child: Text(
//                'Poor internet connection',
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         } else if (PostController().allPosts!.isEmpty) {
//           return const Center(
//             child: Text(
//               'No posts available',
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         } else {
//           return SizedBox(
//             height: 700.0,
//             child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemCount: PostController().allPosts!.length,
//               itemBuilder: (context, index) {
//                 final Post post = PostController().allPosts![index];
//                 return PostCard(posts: post);
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }

class _PostUiState extends State<PostUi> {
  int _page = 0;
  final int _limit = 10;
  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;
  final bool _isLoadingMoreRunning = false;

  final ScrollController _scrollController = ScrollController();

  void _loadMore() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadingMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      setState(() {
        _isLoadingMoreRunning == false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    _page += 1;

    try {
      final List<Post> loadedPosts = await ApiService.getAllPost();
      if (loadedPosts.isNotEmpty) {
        PostController().addPosts = loadedPosts;
      } else {
        setState(() {
          _hasNextPage = false;
        });
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMoreRunning &&
        _hasNextPage) {
      _loadMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService.getAllPost(),
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
          } else if (PostController().allPosts!.isEmpty) {
            return const Center(
              child: Text(
                'No posts available',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return SizedBox(
              height: 700.height(),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: PostController().allPosts!.length,
                itemBuilder: (context, index) {
                  if (index < PostController().allPosts!.length) {
                    final Post post = PostController().allPosts![index];
                    return PostCard(posts: post);
                  } else if (_isLoadingMoreRunning == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (_hasNextPage == false) {
                    return const Center(
                      child: Text('No more posts to load.'),
                    );
                  }
                  return null;
                },
              ),
            );
          }
        });
  }
}
