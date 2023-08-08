

import '../../Entities/post_entities/post_entities.dart';
import '../../repositories/repository.dart';

class DeletePostUseCase {
  final DatabaseRepository repository;

  DeletePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.deletePost(post);
  }
}