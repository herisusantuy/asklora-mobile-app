part of 'slider_question_widget_bloc.dart';

abstract class SliderQuestionWidgetEvent extends Equatable {
  SliderQuestionWidgetEvent() : super();

  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [timeStamp];
}

class AnswerChanged extends SliderQuestionWidgetEvent {
  final int defaultChoiceIndex;

  AnswerChanged(this.defaultChoiceIndex);
}
