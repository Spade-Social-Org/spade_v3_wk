import 'package:story_view/story_view.dart';

class StoryViewData {
  final int id;
  final String name;
  final String imageFileName;
  final bool isViewed;
  final bool isLive;

  StoryViewData({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.isViewed,
    required this.isLive,
  });
}