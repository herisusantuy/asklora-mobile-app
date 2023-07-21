import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/tutorial_repository.dart';

part 'tutorial_event.dart';

part 'tutorial_state.dart';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  TutorialBloc({required TutorialRepository tutorialRepository})
      : _tutorialRepository = tutorialRepository,
        super(const TutorialState()) {
    on<InitiateTutorial>(_onInitiateTutorial);
    on<TutorialFinished>(_onTutorialFinished);
  }

  final TutorialRepository _tutorialRepository;

  _onInitiateTutorial(
      InitiateTutorial event, Emitter<TutorialState> emit) async {
    final bool isBotDetailsTutorial =
        await _tutorialRepository.fetchTutorialState();
    emit(state.copyWith(isBotDetailsTutorial: isBotDetailsTutorial));
  }

  _onTutorialFinished(
      TutorialFinished event, Emitter<TutorialState> emit) async {
    final bool tutorialState =
        await _tutorialRepository.saveTutorialState(false);
    emit(state.copyWith(isBotDetailsTutorial: tutorialState));
  }
}
