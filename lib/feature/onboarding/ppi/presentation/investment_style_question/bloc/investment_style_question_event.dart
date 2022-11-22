part of 'investment_style_question_bloc.dart';

abstract class InvestmentStyleQuestionEvent extends Equatable {
  InvestmentStyleQuestionEvent() : super();

  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [timeStamp];
}

class NextQuestion extends InvestmentStyleQuestionEvent {}

class PreviousQuestion extends InvestmentStyleQuestionEvent {}
