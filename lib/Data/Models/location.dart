import 'package:equatable/equatable.dart';

class Locations extends Equatable {
  final String name;
  final String address;
  final String urlImage;

  const Locations( {required this.name, required this.address, required this.urlImage});

  @override
  List<Object?> get props => [name, address,urlImage];
}
