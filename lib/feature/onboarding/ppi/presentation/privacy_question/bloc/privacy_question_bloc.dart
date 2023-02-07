import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/fixture.dart';
import '../../../domain/question.dart';

part 'privacy_question_event.dart';

part 'privacy_question_state.dart';

class PrivacyQuestionBloc
    extends Bloc<PrivacyQuestionEvent, PrivacyQuestionState> {
  PrivacyQuestionBloc({int initialIndex = 0})
      : _privacyQuestionIndex = initialIndex - 1,
        super(const PrivacyQuestionState()) {
    on<NextQuestion>(_onNavigationStepChanged);
    on<PreviousQuestion>(_onNavigationPop);
  }

  int _privacyQuestionIndex;
  List<Question> privacyQuestions = Fixture().privacyQuestions;

  void _onNavigationStepChanged(
      NextQuestion event, Emitter<PrivacyQuestionState> emit) async {
    debugPrint(
        'Krishna _onNavigationStepChanged before ${_privacyQuestionIndex}');
    ++_privacyQuestionIndex;
    debugPrint(
        'Krishna _onNavigationStepChanged after ${_privacyQuestionIndex}');

    debugPrint(
        'Krishna _onNavigationStepChanged after length ${privacyQuestions.length}');
    if (_privacyQuestionIndex < privacyQuestions.length) {
      Question question = privacyQuestions[_privacyQuestionIndex];
      debugPrint('Krishna _onNavigationStepChanged');
      // var i = await question.getCachedQuestion();

      // debugPrint('Krishna _onNavigationStepChanged default selected option ${i?.selectedOption}');
      if (question.questionType == QuestionType.choices.value) {
        emit(OnNextQuestion<Question>(
          QuestionType.choices,
          question,
          privacyQuestionIndex: _privacyQuestionIndex,
        ));
      } else if (question.questionType == QuestionType.choices.value) {
        emit(OnNextQuestion<Question>(QuestionType.descriptive, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questionType == QuestionType.descriptive.value) {
        emit(OnNextQuestion<Question>(QuestionType.descriptive, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questionType == QuestionType.slider.value) {
        emit(OnNextQuestion<Question>(QuestionType.slider, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questionType == QuestionType.unique.value) {
        emit(OnNextQuestion<Question>(QuestionType.unique, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      }
    } else {
      emit(OnNextResultSuccessScreen());
    }
  }

  void _onNavigationPop(
      PreviousQuestion event, Emitter<PrivacyQuestionState> emit) async {
    --_privacyQuestionIndex;
    if (_privacyQuestionIndex >= 0) {
      Question question = privacyQuestions[_privacyQuestionIndex];
      // var i = await question.getCachedQuestion();
      debugPrint('Krishna _onNavigationPop');
      if (question.questionType == QuestionType.choices.value) {
        emit(OnNextQuestion<Question>(QuestionType.choices, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questionType == QuestionType.descriptive.value) {
        emit(OnNextQuestion<Question>(QuestionType.descriptive, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questionType == QuestionType.slider.value) {
        emit(OnNextQuestion<Question>(QuestionType.slider, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questionType == QuestionType.unique.value) {
        emit(OnNextQuestion<Question>(QuestionType.unique, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      }
    } else if (_privacyQuestionIndex < 0) {
      emit(OnPreviousSignInSuccessScreen());
    }
  }
}
