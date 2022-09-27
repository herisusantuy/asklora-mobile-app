part of 'slider_question_widget_bloc.dart';

class SliderQuestionWidgetState extends Equatable {
  final int defaultChoiceIndex;

  const SliderQuestionWidgetState({required this.defaultChoiceIndex}) : super();

  SliderQuestionWidgetState copyWith({int? defaultChoiceIndex}) {
    return SliderQuestionWidgetState(
        defaultChoiceIndex: defaultChoiceIndex ?? this.defaultChoiceIndex);
  }

  @override
  List<Object> get props => [defaultChoiceIndex];
}
