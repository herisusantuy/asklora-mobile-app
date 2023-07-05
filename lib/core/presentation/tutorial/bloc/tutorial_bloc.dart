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
    on<InitBotTradeSummaryTutorial>(_onInitBotTradeSummaryTutorial);
    on<TradeSummaryTutorialFinished>(_onTradeSummaryTutorialFinished);
  }
  _onInitBotTradeSummaryTutorial(
      InitBotTradeSummaryTutorial event, Emitter<TutorialState> emit) async {
    final bool isTradeSummaryTutorial =
        await _tutorialRepository.isTradeSummaryTutorial();
    emit(state.copyWith(isTradeSummaryTutorial: isTradeSummaryTutorial));
  }

  _onTradeSummaryTutorialFinished(
      TradeSummaryTutorialFinished event, Emitter<TutorialState> emit) async {
    final bool tradeSummaryTutorialFinished =
        await _tutorialRepository.setTradeSummaryTutorial();
    emit(state.copyWith(isTradeSummaryTutorial: tradeSummaryTutorialFinished));
  }
}
