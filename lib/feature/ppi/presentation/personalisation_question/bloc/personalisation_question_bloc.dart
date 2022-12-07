import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/fixture.dart';
import '../../../domain/question.dart';

part 'personalisation_question_event.dart';

part 'personalisation_question_state.dart';

class PersonalisationQuestionBloc
    extends Bloc<PersonalisationQuestionEvent, PersonalisationQuestionState> {
  PersonalisationQuestionBloc({int initialIndex = 0})
      : _personalizationIndex = initialIndex - 1,
        super(const PersonalisationQuestionState()) {
    on<NextPersonalisationQuestion>(_onNavigationStepChanged);
    on<PreviousPersonalisationQuestion>(_onNavigationPop);
  }

  int _personalizationIndex;
  List<QuestionCollection> personalizationQuestions =
      Fixture().personalisedQuestion;

  void _onNavigationStepChanged(NextPersonalisationQuestion event,
      Emitter<PersonalisationQuestionState> emit) {
    ++_personalizationIndex;
    if (_personalizationIndex < personalizationQuestions.length) {
      QuestionCollection question =
          personalizationQuestions[_personalizationIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        List<QuestionCollection> questionCollection = [question];
        emit(OnNextPersonalisationGetTwoQuestion<QuestionCollection>(
            QuestionType.choices, questionCollection,
            personalisationQuestionLastIndex: _personalizationIndex - 1));
      }
    } else {
      emit(OnNextToInvestmentStyleQuestionScreen());
    }
  }

  void _onNavigationPop(PreviousPersonalisationQuestion event,
      Emitter<PersonalisationQuestionState> emit) {
    --_personalizationIndex;
    if (_personalizationIndex > 0) {
      --_personalizationIndex;
      QuestionCollection question =
          personalizationQuestions[--_personalizationIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        List<QuestionCollection> questionCollection = [question];
        emit(OnNextPersonalisationGetTwoQuestion<QuestionCollection>(
            QuestionType.choices, questionCollection,
            personalisationQuestionLastIndex: _personalizationIndex));
      }
    } else if (_personalizationIndex <= 0) {
      emit(OnPerviousToPrivacyQuestionScreen());
    }
  }
}
