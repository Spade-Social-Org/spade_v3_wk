import '../../../Data/Models/story/story_view_model.dart';

class StoryController {
  StoryController._internal();
  static final _instance = StoryController._internal();
  factory StoryController() => _instance;

  List<Storyy>? _allStorys;

  // get addPosts => null;

  set addStory(Storyy storyy) {
    _allStorys ??= [];
    _allStorys!.insert(0, storyy);
  }

  set addStorys(List<Storyy> storyy) {
    _allStorys ??= [];
    _allStorys!.addAll(storyy);
  }

  List<Storyy>? get allStorys {
    return _allStorys;
  }

  void dispose() {
    _allStorys = null;
  }
}
