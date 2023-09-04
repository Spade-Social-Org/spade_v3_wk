import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Feed extends Equatable {
  Feed({
    this.url,
    this.urlImage,

  });

  String? url;
  String? urlImage;



  @override
  List<Object?> get props => [
    url,
    urlImage,
  ];
}
