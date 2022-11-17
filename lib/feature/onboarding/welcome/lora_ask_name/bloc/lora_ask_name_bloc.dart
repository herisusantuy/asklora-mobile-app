import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lora_ask_name_event.dart';

part 'lora_ask_name_state.dart';

class LoraAskNameBloc extends Bloc<LoraAskNameEvent, LoraAskNameState> {
  LoraAskNameBloc() : super(const LoraAskNameState()) {
    on<NameChanged>(_onUsernameChanged);
  }

  void _onUsernameChanged(
    NameChanged event,
    Emitter<LoraAskNameState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }
}
