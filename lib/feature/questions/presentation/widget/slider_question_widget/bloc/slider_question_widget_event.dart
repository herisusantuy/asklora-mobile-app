part of 'slider_question_widget_bloc.dart';

abstract class SliderQuestionWidgetEvent extends Equatable {
  SliderQuestionWidgetEvent() : super();

  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [timeStamp];
}

class AnswerSliderQuestionChanged extends SliderQuestionWidgetEvent {
  final int defaultChoiceIndex;

  AnswerSliderQuestionChanged(this.defaultChoiceIndex);
}
