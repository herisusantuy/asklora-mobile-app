part of 'personalisation_question_widget_bloc.dart';

class PersonalisationQuestionWidgetState extends Equatable {
  final int defaultChoiceIndex;

  const PersonalisationQuestionWidgetState({required this.defaultChoiceIndex})
      : super();

  PersonalisationQuestionWidgetState copyWith({int? defaultChoiceIndex}) {
    return PersonalisationQuestionWidgetState(
        defaultChoiceIndex: defaultChoiceIndex ?? this.defaultChoiceIndex);
  }

  @override
  List<Object> get props => [defaultChoiceIndex];
}
