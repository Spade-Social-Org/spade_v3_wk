// HeartBlocState
import 'package:equatable/equatable.dart';

class HeartIconState extends Equatable {
  final bool isFilled;

  const HeartIconState({required this.isFilled});

  HeartIconState copyWith({bool? isFilled}) {
    return HeartIconState(isFilled: isFilled ?? this.isFilled);
  }


  @override
  List<Object?> get props => [isFilled];
}