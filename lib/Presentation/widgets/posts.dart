// import 'package:flutter/material.dart';
// import 'package:spade_v4/Data/Models/posts/post_model.dart';

// import '../../../Data/data_source/remote_data_sorce/api2.dart';
// import 'add_post_card.dart';
// import 'post_controller.dart';

// class PostUi extends StatefulWidget {
//   const PostUi({super.key});

//   @override
//   State<PostUi> createState() => _PostUiState();
// }

// class _PostUiState extends State<PostUi> {
//   final _postBloc = PostBloc();

//   @override
//   void initState() {
//     super.initState();
//     _loadPosts();
//   }

//   Future<void> _loadPosts() async {
//     try {
//       final posts = await ApiService.getAllPost();
//       _postBloc.addPosts(posts);
//     } catch (error) {
//       print('Error loading posts: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Post>>(
//       stream: _postBloc.allPostsStream,
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
//         } else if (snapshot.data == null || snapshot.data!.isEmpty) {
//           return const Center(
//             child: Text(
//               'No posts available',
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         } else {
//           final posts = snapshot.data; // Get the posts from the snapshot
//           return SizedBox(
//             height: 700.0,
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: posts!.length,
//               itemBuilder: (context, index) {
//                 final Post post = posts[index];
//                 return PostCard(posts: post);
//               },
//             ),
//           );
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _postBloc.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:spade_v4/Data/Models/posts/post_model.dart';

// import '../../Data/data_source/remote_data_sorce/api2.dart';
// import 'add_post_card.dart';
// import 'post_controller.dart';

// class PostUi extends StatefulWidget {
//   const PostUi({super.key});

//   @override
//   State<PostUi> createState() => _PostUiState();
// }

// class _PostUiState extends State<PostUi> {
//   final _postBloc = PostBloc();
//   int postCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadPosts();
//   }

//   Future<void> _loadPosts() async {
//     try {
//       final posts = await ApiService.getAllPost();
//       _postBloc.addPosts(posts);
//     } catch (error) {
//       print('Error loading posts: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Post>>(
//       stream: _postBloc.allPostsStream,
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
//         } else if (snapshot.data == null || snapshot.data!.isEmpty) {
//           return const Center(
//             child: Text(
//               'No posts available',
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         } else {
//           final posts = snapshot.data; // Get the posts from the snapshot
//           return SizedBox(
//             height: 700.0,
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: posts!.length,
//               itemBuilder: (context, index) {
//                 final Post post = posts[index];
//                 postCount++; // Increment the post count

//                 // Check if it's time to display the circular progress indicator
//                 if (postCount % 5 == 0) {
//                   return Column(
//                     children: [
//                       PostCard(posts: post), // Display the post
//                       if (postCount != posts.length) // Don't display at the end
//                         const CircularProgressIndicator(), // Display the circular progress indicator
//                     ],
//                   );
//                 } else {
//                   return PostCard(posts: post); // Display the post
//                 }
//               },
//             ),
//           );
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _postBloc.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart';

import '../../../Data/data_source/remote_data_sorce/api2.dart';
import 'add_post_card.dart';
import 'post_controller.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostUi extends StatefulWidget {
  const PostUi({super.key});

  @override
  State<PostUi> createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  final _postBloc = PostBloc();

  // @override
  // void initState() {
  //   super.initState();
  //   _loadPosts();
  // }

  // Future<void> _loadPosts() async {
  //   try {
  //     final posts = await ApiService.getAllPost();
  //     _postBloc.addPosts(posts);
  //   } catch (error) {
  //     print('Error loading posts: $error');
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);

    return BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial || state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PostLoaded) {
            return buildPostListView(state.posts, postBloc);
          }
          if (state is PostError && postBloc.loadedPosts.isEmpty) {
            return Center(child: Text('Failed to load posts: ${state.error}'));
          }
          return Container();
        }
    );
  }
}
       





//         } else {
//           final posts = snapshot.data;
//           return SizedBox(
//             height: 700.0,
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: posts!.length + (posts.length ~/ 10),
//               // itemCount: posts!.length
              
//               itemBuilder: (context, index) {
//                 if (index % 11 == 10) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   final realIndex = index - (index ~/ 11);
//                   final Post post = posts[realIndex];
//                   return PostCard(posts: post);
//                 }
//               },
//             ),
//           );
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _postBloc.dispose();
//     super.dispose();
//   }
// }
  

  Widget buildPostListView(List<Post> posts, PostBloc postBloc) {
    return ListView.builder(
      itemCount: posts.length + 1,
      itemBuilder: (context, index) {
        if (index < posts.length) {
          final post = posts[index];
          return PostCard(posts: post);
        } else {
          return Center(
            child: TextButton(
              onPressed: () {
                postBloc.add(LoadPosts());
              },
              child: Text('Load More'),
            ),
          );
        }
      },
    );

              
          // return SizedBox(
          //   height: 700.0,
          //   child: ListView.builder(
          //     scrollDirection: Axis.vertical,
          //     itemCount:  posts.length + 1,
          //     // itemCount: posts!.length
              
          //     itemBuilder: (context, index) {
          //       if (index % 11 == 10) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         final realIndex = index - (index ~/ 11);
          //         final Post post = posts[realIndex];
          //         return PostCard(posts: post);
          //       }
          //     },
          //   ),
          // );
  }

