import '../../../Data/Models/story/story_view_model.dart';

class NewStoryController {
  NewStoryController._internal();
  static final _instance = NewStoryController._internal();
  factory NewStoryController() => _instance;

  List<NewStory>? _allStorys;

  // get addPosts => null;

  set addStory(NewStory newStory) {
    _allStorys ??= [];
    _allStorys!.insert(0, newStory);
  }

  set addStorys(List<NewStory> newStory) {
    _allStorys ??= [];
    _allStorys!.addAll(newStory);
  }

  List<NewStory>? get allStorys {
    return _allStorys;
  }

  void dispose() {
    _allStorys = null;
  }
}
