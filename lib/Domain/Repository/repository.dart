import '../Entities/post_entities/post_entities.dart';
import '../Entities/stories_entities/story_entities.dart';

abstract class DatabaseRepository {
// Post Features
  Future<void> createPost(PostEntity post);
  Stream<List<PostEntity>> readPost(PostEntity post);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(PostEntity post);
  Future<void> likePost(PostEntity post);

  // Stories Features
  Future<void> createStories(StoriesEntity stories);
  Stream<List<StoriesEntity>> readStories(StoriesEntity stories);
  Future<void> updateStories(StoriesEntity stories);
  Future<void> deleteStories(StoriesEntity stories);
  Future<void> likeStories(StoriesEntity stories);
}
