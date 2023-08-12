import '../../Entities/post_entities/post_entities.dart';
import '../../Repository/repository.dart';


class CreatePostUseCase {
  final DatabaseRepository repository;

  CreatePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.createPost(post);
  }
}
