import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/tutorial_repository.dart';

part 'tutorial_state.dart';
part 'tutorial_event.dart';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final TutorialRepository _tutorialRepository;
  TutorialBloc({required TutorialRepository tutorialRepository})
      : _tutorialRepository = tutorialRepository,
        super(const TutorialState()) {
    on<InitTutorial>(_onInitTutorial);
    on<BotDetailsTutorialFinished>(_onBotDetailsTutorialFinished);
  }
  _onInitTutorial(InitTutorial event, Emitter<TutorialState> emit) async {
    final response = await _tutorialRepository.isBotDetailsTutorial();
    emit(state.copyWith(isBotDetailsTutorial: response));
  }

  _onBotDetailsTutorialFinished(
      BotDetailsTutorialFinished event, Emitter<TutorialState> emit) async {
    final response = await _tutorialRepository.setBotDetailsTutorial(false);
    emit(state.copyWith(isBotDetailsTutorial: response));
  }
}
