
import 'package:spade_v4/Data/Models/user_model.dart';

class Story {
final String id;
final User postby;
  final String imageurl;
Story(this.id,this.postby, this.imageurl);
 }

 class StoryModel {
  int id;
  String type; // image, video, text
  String media;
  String time;
  final User postby;

  StoryModel({
    required this.id,
    required this.type,
    required this.media,
    required this.time,
    required this.postby,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      type: json['story_type'],
      media: json['story_media'],
      time: json['story_time'],
      postby: json['story_postby'],
    );
  }
}
