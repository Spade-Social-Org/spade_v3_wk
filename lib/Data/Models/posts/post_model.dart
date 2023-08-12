import 'package:spade_v4/Domain/Entities/post_entities/post_entities.dart';

class PostModel extends PostEntity {
  final String? postId;
  final String? creatorId;
  final String? username;
  final String? description;
  final String? postImageUrl;
  final List<String>? likes;
  //final Timestamp? createAt;
  final String? userProfeilUrl;

  PostModel({
    this.postId,
    this.creatorId,
    this.username,
    this.description,
    this.postImageUrl,
    this.likes,
    this.userProfeilUrl,
  }) : super(
          postId: postId,
          creatorId: creatorId,
          userProfeilUrl: userProfeilUrl,
          username: username,
          postImageUrl: postImageUrl,
          likes: likes,
          description: description,
        );

  factory PostModel.fromJson(Map<String, dynamic> data) {
    final postId = data['postId'];
    final creatorId = data['creatorId'];
    final username = data['username'];
    final description = data['description'];
    final postImageUrl = data['postImageUrl'];
    final likes = data['likes'];
    final userProfileUrl = data['userProfileUrl'];
    return PostModel(
      postId: postId,
      creatorId: creatorId,
      username: username,
      description: description,
      postImageUrl: postImageUrl,
      likes: likes,
      userProfeilUrl: userProfileUrl,
    );
  }
}
