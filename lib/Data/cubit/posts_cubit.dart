import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart';

import 'package:spade_v4/Data/repositories/posts_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostState> {
  final PostsRepository repository = PostsRepository();
  List<Post> posts = [];
  int page = 1;
  bool isLoading = false;
  int lastLoadedPostId = 0;

  PostsCubit() : super(PostInitial());

  Future<void> fetchPosts({bool refresh = false}) async {
    if (refresh) {
      page = 1;
      posts.clear();
      lastLoadedPostId = 0;

    }
    if(page == 1){
      emit(PostLoading());
    }
    if (isLoading) {
      return;
    }
    isLoading = true;


    try {
      final newPosts = await repository.fetchPosts(page, lastPostId: lastLoadedPostId);
      if (newPosts.isNotEmpty) {
        lastLoadedPostId = newPosts.last.id;

      }
      posts = posts + newPosts;
      page++;
      isLoading = false;
      emit(PostLoaded(posts));
    } catch (e) {
      isLoading = false;
      emit(PostError('Failed to fetch posts: $e'));
    }
  }
}