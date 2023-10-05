import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {
  final bool refresh;

  LoadPosts({this.refresh = false});

  @override
  List<Object> get props => [refresh];
}