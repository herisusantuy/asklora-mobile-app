import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/fixture.dart';
import '../../../domain/question.dart';

part 'investment_style_question_event.dart';

part 'investment_style_question_state.dart';

class InvestmentStyleQuestionBloc
    extends Bloc<InvestmentStyleQuestionEvent, InvestmentStyleQuestionState> {
  InvestmentStyleQuestionBloc({int initialIndex = 0})
      : _investmentStyleQuestionIndex = initialIndex - 1,
        super(const InvestmentStyleQuestionState()) {
    on<NextQuestion>(_onNavigationStepChanged);
    on<PreviousQuestion>(_onNavigationPop);
  }

  int _investmentStyleQuestionIndex;
  List<QuestionCollection> investmentStyleQuestions =
      Fixture().investmentStyleQuestion;

  void _onNavigationStepChanged(
      NextQuestion event, Emitter<InvestmentStyleQuestionState> emit) {
    ++_investmentStyleQuestionIndex;
    if (_investmentStyleQuestionIndex < investmentStyleQuestions.length) {
      QuestionCollection question =
          investmentStyleQuestions[_investmentStyleQuestionIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.choices, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questions!.types == QuestionType.descriptive.value) {
        emit(OnNextQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questions!.types == QuestionType.slider.value) {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.slider, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      }
    } else {
      emit(OnNextBotRecommendationScreen());
    }
  }

  void _onNavigationPop(
      PreviousQuestion event, Emitter<InvestmentStyleQuestionState> emit) {
    --_investmentStyleQuestionIndex;
    if (_investmentStyleQuestionIndex >= 0) {
      QuestionCollection question =
          investmentStyleQuestions[_investmentStyleQuestionIndex];
      if (question.questions!.types == QuestionType.choices.value) {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.choices, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questions!.types == QuestionType.descriptive.value) {
        emit(OnNextQuestion<QuestionCollection>(
            QuestionType.descriptive, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else {
        emit(OnNextQuestion<QuestionCollection>(QuestionType.slider, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      }
    } else if (_investmentStyleQuestionIndex < 0) {
      emit(OnPreviousPersonalisationScreen());
    }
  }
}
