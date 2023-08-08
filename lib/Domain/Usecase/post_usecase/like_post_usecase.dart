

import '../../Entities/post_entities/post_entities.dart';
import '../../repositories/repository.dart';

class LikePostUseCase {
  final DatabaseRepository repository;

  LikePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.likePost(post);
  }
}