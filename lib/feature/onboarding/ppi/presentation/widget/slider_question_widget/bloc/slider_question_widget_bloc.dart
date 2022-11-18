import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_question_widget_event.dart';

part 'slider_question_widget_state.dart';

class SliderQuestionWidgetBloc
    extends Bloc<SliderQuestionWidgetEvent, SliderQuestionWidgetState> {
  SliderQuestionWidgetBloc({int defaultChoiceIndex = -1})
      : super(
            SliderQuestionWidgetState(defaultChoiceIndex: defaultChoiceIndex)) {
    on<AnswerChanged>(_onAnswerChanged);
  }

  void _onAnswerChanged(
      AnswerChanged event, Emitter<SliderQuestionWidgetState> emit) {
    emit(state.copyWith(defaultChoiceIndex: event.defaultChoiceIndex));
  }
}
