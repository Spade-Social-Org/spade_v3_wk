

import '../../Entities/post_entities/post_entities.dart';
import '../../Repository/repository.dart';


class ReadPostUseCase {
  final DatabaseRepository repository;

  ReadPostUseCase({required this.repository});

  Stream<List<PostEntity>> call(PostEntity post) {
    return repository.readPost(post);
  }
}