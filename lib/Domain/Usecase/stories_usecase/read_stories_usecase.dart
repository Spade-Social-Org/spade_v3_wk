

import 'package:spade_v4/Domain/Entities/stories_entities/story_entities.dart';
import '../../repositories/repository.dart';

class ReadStoriesUseCase {
  final DatabaseRepository repository;

  ReadStoriesUseCase({required this.repository});

  Stream<List<StoriesEntity>> call(StoriesEntity stories) {
    return repository.readStories(stories);
  }
}