
import 'package:spade_v4/Domain/Entities/stories_entities/story_entities.dart';
import '../../repositories/repository.dart';

class DeleteStoriesUseCase {
  final DatabaseRepository repository;

  DeleteStoriesUseCase({required this.repository});

  Future<void> call(StoriesEntity stories) {
    return repository.deleteStories(stories);
  }
}
