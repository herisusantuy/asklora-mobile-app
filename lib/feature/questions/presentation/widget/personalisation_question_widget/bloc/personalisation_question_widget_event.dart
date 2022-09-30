part of 'personalisation_question_widget_bloc.dart';

abstract class PersonalisationQuestionWidgetEvent extends Equatable {
  PersonalisationQuestionWidgetEvent() : super();

  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [timeStamp];
}

class AnswerOfPersonalisationQuestionChanged
    extends PersonalisationQuestionWidgetEvent {
  final List<int> defaultChoiceIndex;

  AnswerOfPersonalisationQuestionChanged(this.defaultChoiceIndex);
}
