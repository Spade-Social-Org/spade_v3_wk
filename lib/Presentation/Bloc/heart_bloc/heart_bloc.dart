// HeartBloc
import 'heart_bloc_event.dart';
import 'heart_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartIconBloc extends Bloc<HeartIconEvent, HeartIconState> {
  HeartIconBloc() : super(const HeartIconState(isFilled: false)) {
    on<HeartIconEvent>((event, emit) async* {
        if (event is ToggleHeartIconEvent) {
      yield state.copyWith(isFilled: !state.isFilled);
    }
    }   
    );
  }
}
