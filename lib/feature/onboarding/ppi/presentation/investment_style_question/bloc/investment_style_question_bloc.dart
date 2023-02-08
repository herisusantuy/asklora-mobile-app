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
  List<Question> investmentStyleQuestions = Fixture().investmentStyleQuestion;

  void _onNavigationStepChanged(
      NextQuestion event, Emitter<InvestmentStyleQuestionState> emit) {
    ++_investmentStyleQuestionIndex;
    if (_investmentStyleQuestionIndex < investmentStyleQuestions.length) {
      Question question =
          investmentStyleQuestions[_investmentStyleQuestionIndex];
      if (question.questionType == QuestionType.choices.value) {
        emit(OnNextQuestion<Question>(QuestionType.choices, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questionType == QuestionType.choices.value) {
        emit(OnNextQuestion<Question>(QuestionType.descriptive, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questionType == QuestionType.omniSearch.value) {
        emit(OnNextQuestion<Question>(QuestionType.omniSearch, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questionType == QuestionType.slider.value) {
        emit(OnNextQuestion<Question>(QuestionType.slider, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      }
    } else {
      emit(OnNextResultScreen());
    }
  }

  void _onNavigationPop(
      PreviousQuestion event, Emitter<InvestmentStyleQuestionState> emit) {
    --_investmentStyleQuestionIndex;
    if (_investmentStyleQuestionIndex >= 0) {
      Question question =
          investmentStyleQuestions[_investmentStyleQuestionIndex];
      if (question.questionType == QuestionType.choices.value) {
        emit(OnNextQuestion<Question>(QuestionType.choices, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questionType == QuestionType.descriptive.value) {
        emit(OnNextQuestion<Question>(QuestionType.descriptive, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else if (question.questionType == QuestionType.omniSearch.value) {
        emit(OnNextQuestion<Question>(QuestionType.omniSearch, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      } else {
        emit(OnNextQuestion<Question>(QuestionType.slider, question,
            investmentStyleQuestionIndex: _investmentStyleQuestionIndex));
      }
    } else if (_investmentStyleQuestionIndex < 0) {
      emit(OnPreviousPage());
    }
  }
}
