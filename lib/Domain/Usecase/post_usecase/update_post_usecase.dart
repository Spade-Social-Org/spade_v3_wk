

import '../../Entities/post_entities/post_entities.dart';
import '../../repositories/repository.dart';

class UpdatePostUseCase {
  final DatabaseRepository repository;

  UpdatePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.updatePost(post);
  }
}