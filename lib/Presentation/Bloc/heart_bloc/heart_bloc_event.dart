// HeartBlocEvents
import 'package:equatable/equatable.dart';

abstract class HeartIconEvent extends Equatable {
  const HeartIconEvent();

  @override
  List<Object?> get props => [];
}

class ToggleHeartIconEvent extends HeartIconEvent {
  
}