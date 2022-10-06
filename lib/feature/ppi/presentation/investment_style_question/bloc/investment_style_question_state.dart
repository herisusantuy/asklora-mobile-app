part of 'investment_style_question_bloc.dart';

class InvestmentStyleQuestionState extends Equatable {
  const InvestmentStyleQuestionState() : super();

  InvestmentStyleQuestionState copyWith() {
    return const InvestmentStyleQuestionState();
  }

  @override
  List<Object> get props => [];
}

class OnNextQuestion<T> extends InvestmentStyleQuestionState {
  final QuestionType questionType;
  final int investmentStyleQuestionIndex;
  final T question;
  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  OnNextQuestion(this.questionType, this.question,
      {required this.investmentStyleQuestionIndex});

  @override
  List<Object> get props => [questionType, timeStamp];
}

class OnNextBotRecommendationScreen extends InvestmentStyleQuestionState {}

class OnPreviousPersonalisationScreen extends InvestmentStyleQuestionState {}
