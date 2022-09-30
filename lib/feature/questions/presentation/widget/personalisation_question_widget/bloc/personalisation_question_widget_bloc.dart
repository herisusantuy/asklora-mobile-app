import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personalisation_question_widget_state.dart';
part 'personalisation_question_widget_event.dart';

class PersonalisationQuestionWidgetBloc extends Bloc<
    PersonalisationQuestionWidgetEvent, PersonalisationQuestionWidgetState> {
  PersonalisationQuestionWidgetBloc(
      {List<int> defaultChoiceIndex = const [-1, -1]})
      : super(PersonalisationQuestionWidgetState(
            defaultChoiceIndex: defaultChoiceIndex)) {
    on<AnswerOfPersonalisationQuestionChanged>(_onAnswerSliderQuestionChanged);
  }

  void _onAnswerSliderQuestionChanged(
      AnswerOfPersonalisationQuestionChanged event,
      Emitter<PersonalisationQuestionWidgetState> emit) {
    emit(state.copyWith(defaultChoiceIndex: event.defaultChoiceIndex));
  }
}
