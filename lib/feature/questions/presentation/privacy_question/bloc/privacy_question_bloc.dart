import 'package:equatable/equatable.dart';
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
  List<QuestionCollection> privacyQuestions = Fixture().privacyQuestions;

  void _onNavigationStepChanged(
      NextQuestion event, Emitter<PrivacyQuestionState> emit) {
    ++_privacyQuestionIndex;
    print('privacy length: ${privacyQuestions.length}');
    if (_privacyQuestionIndex < privacyQuestions.length) {
      QuestionCollection question = privacyQuestions[_privacyQuestionIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.choices, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questions!.types == QuestionType.descriptive.value) {
        emit(OnNextQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questions!.types == QuestionType.slider.value) {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.slider, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      }
    } else {
      emit(OnNextPersonalisationQuestionScreen());
    }
  }

  void _onNavigationPop(
      PreviousQuestion event, Emitter<PrivacyQuestionState> emit) {
    --_privacyQuestionIndex;
    if (_privacyQuestionIndex >= 0) {
      QuestionCollection question = privacyQuestions[_privacyQuestionIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.choices, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else if (question.questions!.types == QuestionType.descriptive.value) {
        emit(OnNextQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      } else {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.slider, question,
            privacyQuestionIndex: _privacyQuestionIndex));
      }
    } else if (_privacyQuestionIndex < 0) {
      emit(OnPreviousSignInSuccessScreen());
    }
  }
}
