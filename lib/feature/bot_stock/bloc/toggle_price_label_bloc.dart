import 'package:flutter_bloc/flutter_bloc.dart';
import 'toggle_price_label_event.dart';
import 'toggle_price_label_state.dart'; 

class ToggleTextBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleTextBloc() : super(ShowPriceDifferenceState(false)) {
    // Register the event handler
    on<TogglePriceDifferenceEvent>(
        (event, emit) => _mapTogglePriceDifferenceEventToState(emit));
  }

  void _mapTogglePriceDifferenceEventToState(Emitter<ToggleState> emit) {
    final currentState = state;
    final newState = ShowPriceDifferenceState(!currentState.showPriceDifference);
    emit(newState);
  }
}
