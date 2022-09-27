import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/fixture.dart';
import '../../../domain/question.dart';

part 'personalisation_question_state.dart';
part 'personalisation_question_event.dart';

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
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.choices, question,
            personalizationQuestionIndex: _personalizationIndex));
      } else if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            personalizationQuestionIndex: _personalizationIndex));
      } else if (question.questions!.types == QuestionType.descriptive.value) {
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            personalizationQuestionIndex: _personalizationIndex));
      } else if (question.questions!.types == QuestionType.slider.value) {
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.slider, question,
            personalizationQuestionIndex: _personalizationIndex));
      }
    } else {
      emit(OnNextToInvestmentStyleQuestionScreen());
      debugPrint('there is no data');
    }
  }

  void _onNavigationPop(PreviousPersonalisationQuestion event,
      Emitter<PersonalisationQuestionState> emit) {
    --_personalizationIndex;
    if (_personalizationIndex >= 0) {
      QuestionCollection question =
          personalizationQuestions[_personalizationIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.choices, question,
            personalizationQuestionIndex: _personalizationIndex));
      } else if (question.questions!.types == QuestionType.descriptive.value) {
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            personalizationQuestionIndex: _personalizationIndex));
      } else {
        emit(OnNextPersonalizationQuestion<QuestionCollection>(
            QuestionType.slider, question,
            personalizationQuestionIndex: _personalizationIndex));
      }
    } else if (_personalizationIndex < 0) {
      emit(OnPerviousToPrivacyQuestionScreen());
    }
  }
}
