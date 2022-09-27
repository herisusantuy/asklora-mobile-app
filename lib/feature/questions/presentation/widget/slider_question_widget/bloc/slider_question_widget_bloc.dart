import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_question_widget_state.dart';
part 'slider_question_widget_event.dart';

class SliderQuestionWidgetBloc
    extends Bloc<SliderQuestionWidgetEvent, SliderQuestionWidgetState> {
  SliderQuestionWidgetBloc({int defaultChoiceIndex = -1})
      : super(
            SliderQuestionWidgetState(defaultChoiceIndex: defaultChoiceIndex)) {
    on<AnswerSliderQuestionChanged>(_onAnswerSliderQuestionChanged);
  }

  void _onAnswerSliderQuestionChanged(AnswerSliderQuestionChanged event,
      Emitter<SliderQuestionWidgetState> emit) {
    emit(state.copyWith(defaultChoiceIndex: event.defaultChoiceIndex));
  }
}
