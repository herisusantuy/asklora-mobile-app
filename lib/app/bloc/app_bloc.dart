import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/domain/token/repository/token_repository.dart';
import '../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final TokenRepository _tokenRepository;

  AppBloc({
    required TokenRepository tokenRepository,
  })  : _tokenRepository = tokenRepository,
        super(const AppState.unknown()) {
    on<AppLaunched>(_onAppLaunched);
    on<AppLanguageChangeEvent>(_onAppLanguageChangeEvent);
  }

  void _onAppLaunched(AppLaunched event, Emitter<AppState> emit) async {
    bool isTokenValid = await _tokenRepository.isTokenValid();

    if (isTokenValid) {
      emit(const AppState.authenticated());
    } else {
      emit(const AppState.unauthenticated(
          localeType: LocaleType('en', 'US', 'ENG')));
    }
  }

  void _onAppLanguageChangeEvent(
      AppLanguageChangeEvent event, Emitter<AppState> emit) {
    emit(AppState.unauthenticated(localeType: event.language));
  }
}
