import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState()) {
    on<LocalizationChanged>(_onLocalizationChanged);
  }

  void _onLocalizationChanged(
      LocalizationChanged event, Emitter<LocalizationState> emit) async {
    emit(state.copyWith(localizationType: event.localizationType));
  }
}
