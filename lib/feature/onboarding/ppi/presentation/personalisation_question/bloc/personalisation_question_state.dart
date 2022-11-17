part of 'personalisation_question_bloc.dart';

class PersonalisationQuestionState extends Equatable {
  const PersonalisationQuestionState() : super();

  PersonalisationQuestionState copyWith() {
    return const PersonalisationQuestionState();
  }

  @override
  List<Object> get props => [];
}

class OnNextPersonalizationQuestion<T> extends PersonalisationQuestionState {
  final QuestionType questionType;
  final int personalizationQuestionIndex;
  final T question;
  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  OnNextPersonalizationQuestion(
    this.questionType,
    this.question, {
    required this.personalizationQuestionIndex,
  });

  @override
  List<Object> get props => [questionType, timeStamp];
}

class OnNextPersonalisationGetTwoQuestion<T>
    extends PersonalisationQuestionState {
  final QuestionType questionType;
  final int personalisationQuestionLastIndex;
  final List<T> questions;
  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  OnNextPersonalisationGetTwoQuestion(this.questionType, this.questions,
      {required this.personalisationQuestionLastIndex});

  @override
  List<Object> get props => [questionType, timeStamp, questions];
}

class OnNextToInvestmentStyleQuestionScreen
    extends PersonalisationQuestionState {}

class OnPreviousToPrivacyQuestionScreen extends PersonalisationQuestionState {}

class OnNextResultEndScreen extends PersonalisationQuestionState {}
