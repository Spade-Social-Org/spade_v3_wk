import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? postId;
  final String? creatorId;
  final String? username;
  final String? description;
  final String? postImageUrl;
  final List<String>? likes;
  //final Timestamp? createAt;
  final String? userProfeilUrl;

  PostEntity({
    this.postId,
    this.creatorId,
    this.username,
    this.description,
    this.postImageUrl,
    this.likes,
    this.userProfeilUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    postId,
    creatorId,
    username,
    description,
    postImageUrl,
    likes,
    userProfeilUrl,
  ];
}
