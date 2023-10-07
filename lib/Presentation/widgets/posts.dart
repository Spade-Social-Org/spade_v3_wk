

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart';
import 'package:spade_v4/Data/cubit/posts_cubit.dart';

import 'add_post_card.dart';


class PostUi extends StatefulWidget {
  const PostUi({super.key});

  @override
  State<PostUi> createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  
  ScrollController _scrollController = ScrollController();
  // int _currentpage = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostsCubit>(context);
    _scrollController.addListener(() {
      if (_isScrollAtEnd(_scrollController) && !postBloc.isLoading) {
        postBloc.fetchPosts();
      }
    });

    return BlocBuilder<PostsCubit, PostState>(builder: (context, state) {
      if (state is PostLoading) {
        return const Center(
            child: CircularProgressIndicator(color: Colors.white));
      } else if (state is PostLoaded) {
        final List<Post> posts = state.posts;
        // return buildPostListView(posts, postBloc);
        return SizedBox(
          height: 650.0,
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
            controller: _scrollController,
            itemCount: posts.length + 1,
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index < posts.length) {
                final post = posts[index];
                return PostCard(posts: post);
              } else {
                return const Center(child: CircularProgressIndicator(
                  color: Colors.white
                ));
              }

              //
              // return ListTile(
              //   title: Text(post.description),
              //   subtitle: Text(post.posterName),
              // );
            },
          ),
        );
      } else if (state is PostError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return Center(child: Text('No data available.'));
      }
    });
  }
}

bool _isScrollAtEnd(ScrollController controller) {
  return controller.position.pixels >=
      controller.position.maxScrollExtent -
          200; 
}




