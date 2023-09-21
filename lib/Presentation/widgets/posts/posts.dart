// import 'package:flutter/material.dart';
// import 'package:spade_v4/Data/Models/posts/post_model.dart';
// import 'package:spade_v4/Presentation/widgets/posts/add_post_card.dart';
// import 'package:spade_v4/Presentation/widgets/posts/post_controller.dart';

// import '../../../Data/data_source/remote_data_sorce/api2.dart';

// class PostUi extends StatefulWidget {
//   const PostUi({super.key});

//   @override
//   State<PostUi> createState() => _PostUiState();
// }

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
//               'Poor internet connection',
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

import 'package:flutter/material.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart';
import 'package:spade_v4/Presentation/widgets/posts/add_post_card.dart';
import 'package:spade_v4/Presentation/widgets/posts/post_controller.dart';

import '../../../Data/data_source/remote_data_sorce/api2.dart';

class PostUi extends StatefulWidget {
  const PostUi({super.key});

  @override
  State<PostUi> createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  final _postBloc = PostBloc(); // Create an instance of your PostBloc

  @override
  void initState() {
    super.initState();
    // Load posts when the widget is first created
    _loadPosts();
  }

  // Helper method to load posts and add them to the bloc
  Future<void> _loadPosts() async {
    try {
      final posts = await ApiService.getAllPost();
      _postBloc.addPosts(posts);
    } catch (error) {
      // Handle any errors here
      print('Error loading posts: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: _postBloc.allPostsStream, // Use the stream from the PostBloc
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
              'No posts available',
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          final posts = snapshot.data; // Get the posts from the snapshot
          return SizedBox(
            height: 700.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts!.length,
              itemBuilder: (context, index) {
                final Post post = posts[index];
                return PostCard(posts: post);
              },
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _postBloc.dispose(); // Don't forget to dispose of the PostBloc
    super.dispose();
  }
}
