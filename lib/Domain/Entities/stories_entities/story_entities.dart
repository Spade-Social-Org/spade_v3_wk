import 'package:equatable/equatable.dart';

class StoriesEntity extends Equatable {
  final String? storiesId;
  final String? creatorId;
  final String? username;
  final String? commentId;
  final String? storiesImageUrl;
  final List<String>? likes;
  //final Timestamp? createAt;
  final String? userProfeilUrl;

  StoriesEntity({
    this.commentId,
    this.storiesId,
    this.creatorId,
    this.username,
    this.storiesImageUrl,
    this.likes,
    this.userProfeilUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    commentId,
    storiesId,
    creatorId,
    username,
    storiesImageUrl,
    likes,
    userProfeilUrl,
  ];
}
