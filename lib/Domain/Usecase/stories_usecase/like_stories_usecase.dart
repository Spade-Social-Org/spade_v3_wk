
import 'package:spade_v4/Domain/Entities/stories_entities/story_entities.dart';

import '../../Repository/repository.dart';


class LikeStoriesUseCase {
  final DatabaseRepository repository;

  LikeStoriesUseCase({required this.repository});

  Future<void> call(StoriesEntity stories) {
    return repository.likeStories(stories);
  }
}
