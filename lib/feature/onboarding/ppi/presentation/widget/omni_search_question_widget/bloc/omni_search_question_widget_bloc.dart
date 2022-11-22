import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'omni_search_question_widget_event.dart';

part 'omni_search_question_widget_state.dart';

class OmniSearchQuestionWidgetBloc
    extends Bloc<OmniSearchQuestionWidgetEvent, OmniSearchQuestionWidgetState> {
  OmniSearchQuestionWidgetBloc({List<String> defaultAnswer = const []})
      : super(OmniSearchQuestionWidgetState(
            keywordAnswers: defaultAnswer)) {
    on<KeywordAdded>(_onKeywordAdded);
    on<KeywordRemoved>(_onKeywordRemoved);
    on<KeywordSelected>(_onKeywordSelected);
  }

  void _onKeywordAdded(
      KeywordAdded event, Emitter<OmniSearchQuestionWidgetState> emit) {
    List<String> keywords = List.from(state.keywords);
    emit(state.copyWith(addKeywordError: false));
    if (!keywords.contains(event.keywordInput)) {
      keywords.add(event.keywordInput);
      emit(state.copyWith(keywords: keywords));
    }
    else{
      emit(state.copyWith(addKeywordError: true));
    }
  }

  void _onKeywordRemoved(
      KeywordRemoved event, Emitter<OmniSearchQuestionWidgetState> emit) {
    List<String> keywords = state.keywords;
    keywords.remove(event.keyword);
    emit(state.copyWith(keywords: keywords));
  }

  void _onKeywordSelected(
      KeywordSelected event, Emitter<OmniSearchQuestionWidgetState> emit) {
    List<String> keywordAnswers = List.from(state.keywordAnswers);
    if (keywordAnswers.contains(event.keyword)) {
      keywordAnswers.remove(event.keyword);
    } else {
      keywordAnswers.add(event.keyword);
    }

    emit(state.copyWith(keywordAnswers: keywordAnswers));
  }
}
