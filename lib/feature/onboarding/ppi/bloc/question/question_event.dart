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
  final int personalisationQuestionIndex;

  const PersonalisationQuestionIndexChanged(this.personalisationQuestionIndex)
      : super();

  @override
  List<Object> get props => [personalisationQuestionIndex];
}

class InvestmentStyleQuestionIndexChanged extends QuestionEvent {
  const InvestmentStyleQuestionIndexChanged(this.investmentStyleQuestionIndex)
      : super();

  final int investmentStyleQuestionIndex;

  @override
  List<Object> get props => [investmentStyleQuestionIndex];
}

class CurrentPersonalisationPageIncremented extends QuestionEvent {
  const CurrentPersonalisationPageIncremented() : super();

  @override
  List<Object> get props => [];
}

class CurrentPrivacyPageIncremented extends QuestionEvent {
  const CurrentPrivacyPageIncremented() : super();

  @override
  List<Object> get props => [];
}

class CurrentInvestmentStylePageIncremented extends QuestionEvent {
  const CurrentInvestmentStylePageIncremented() : super();

  @override
  List<Object> get props => [];
}

class CurrentPrivacyPageDecremented extends QuestionEvent {
  const CurrentPrivacyPageDecremented() : super();

  @override
  List<Object> get props => [];
}

class CurrentPersonalisationPageDecremented extends QuestionEvent {
  const CurrentPersonalisationPageDecremented() : super();

  @override
  List<Object> get props => [];
}

class CurrentInvestmentStylePageDecremented extends QuestionEvent {
  const CurrentInvestmentStylePageDecremented() : super();

  @override
  List<Object> get props => [];
}
