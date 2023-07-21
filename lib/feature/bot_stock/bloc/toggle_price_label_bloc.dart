import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'toggle_price_label_event.dart';
part 'toggle_price_label_state.dart';


class ToggleTextBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleTextBloc() : super(ShowPriceDifferenceState(false)) {
    // Register the event handler
    on<TogglePriceDifferenceEvent>(
        (event, emit) => _mapTogglePriceDifferenceEventToState(emit));

    // Load the user's saved choice on Bloc initialization
    _loadUserChoice();
  }

  void _mapTogglePriceDifferenceEventToState(Emitter<ToggleState> emit) {
    final currentState = state;
    final newState = ShowPriceDifferenceState(!currentState.showPriceDifference);
    emit(newState);

    // Save the user's choice
    saveUserChoice(newState.showPriceDifference);
  }

  // Load and emit the user's choice
  Future<void> _loadUserChoice() async {
    final choice = await getUserChoice();
    add(TogglePriceDifferenceEvent(showPriceDifference: choice));
  }
}

// Save the user's choice
Future<void> saveUserChoice(bool showPriceDifference) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('showPriceDifference', showPriceDifference);
}

// Retrieve the user's choice
Future<bool> getUserChoice() async {
  final prefs = await SharedPreferences.getInstance();
  // Return the user's saved choice, or false as default
  return prefs.getBool('showPriceDifference') ?? false;
}
