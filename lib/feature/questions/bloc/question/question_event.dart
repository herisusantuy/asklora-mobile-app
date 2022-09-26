part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent() : super();

  @override
  List<Object?> get props => [];
}

class LoadQuestions extends QuestionEvent {
  const LoadQuestions() : super();

  @override
  List<Object?> get props => [];
}

class PrivacyQuestionIndexChanged extends QuestionEvent {
  const PrivacyQuestionIndexChanged(this.privacyQuestionIndex) : super();

  final int privacyQuestionIndex;

  @override
  List<Object> get props => [privacyQuestionIndex];
}

class PersonalisationQuestionIndexChanged extends QuestionEvent {
  final int personalisationQuestion;
  const PersonalisationQuestionIndexChanged(this.personalisationQuestion)
      : super();

  @override
  List<Object> get props => [personalisationQuestion];
}

class InvestmentStyleQuestionIndexChanged extends QuestionEvent {
  const InvestmentStyleQuestionIndexChanged(this.investmentStyleQuestionIndex)
      : super();

  final int investmentStyleQuestionIndex;

  @override
  List<Object> get props => [investmentStyleQuestionIndex];
}
