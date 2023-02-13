import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/domain/token/repository/token_repository.dart';
import '../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';
import '../repository/user_journey_repository.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final TokenRepository _tokenRepository;
  final UserJourneyRepository _userJourneyRepository;

  AppBloc({
    required TokenRepository tokenRepository,
    required UserJourneyRepository userJourneyRepository,
  })  : _tokenRepository = tokenRepository,
        _userJourneyRepository = userJourneyRepository,
        super(const AppState.unknown()) {
    on<AppLaunched>(_onAppLaunched);
    on<AppLanguageChangeEvent>(_onAppLanguageChangeEvent);
    on<SaveUserJourney>(_onSaveUserJourney);
  }

  void _onAppLaunched(AppLaunched event, Emitter<AppState> emit) async {
    await _userJourneyRepository.saveUserJourney(UserJourney.freeBotStock);
    bool isTokenValid = await _tokenRepository.isTokenValid();
    UserJourney userJourney = await _userJourneyRepository.getUserJourney();
    if (isTokenValid) {
      emit(AppState.authenticated(userJourney: userJourney));
    } else {
      emit(AppState.unauthenticated(
          localeType: LocaleType.defaultFont(), userJourney: userJourney));
    }
  }

  void _onAppLanguageChangeEvent(
      AppLanguageChangeEvent event, Emitter<AppState> emit) {
    emit(AppState.unauthenticated(
        localeType: event.language, userJourney: state.userJourney));
  }

  void _onSaveUserJourney(SaveUserJourney event, Emitter<AppState> emit) async {
    await _userJourneyRepository.saveUserJourney(event.userJourney);
    emit(state.copyWith(userJourney: event.userJourney));
  }
}
