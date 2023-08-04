// HeartBloc
import 'heart_bloc_event.dart';
import 'heart_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartIconBloc extends Bloc<HeartIconEvent, HeartIconState> {
  HeartIconBloc() : super(HeartIconState(isFilled: false));

  @override
  Stream<HeartIconState> mapEventToState(HeartIconEvent event) async* {
    if (event is ToggleHeartIconEvent) {
      yield state.copyWith(isFilled: !state.isFilled);
    }
  }
}