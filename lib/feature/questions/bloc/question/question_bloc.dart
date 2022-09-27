import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../repository/question_collection_repository.dart';

part 'question_event.dart';

part 'question_state.dart';

enum QuestionPageStep {
  privacy,
  personalisation,
  investmentSty,
  botRecommendation,
  unknown
}

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(const QuestionState()) {
    on<LoadQuestions>(_onLoadQuestions);
    on<PrivacyQuestionIndexChanged>(_onPrivacyQuestionIndexChanged);
    on<PersonalisationQuestionIndexChanged>(_onPersonalisationIndexChanged);
    on<InvestmentStyleQuestionIndexChanged>(
        _onInvestmentStyleQuestionIndexChanged);
  }

  void _onPrivacyQuestionIndexChanged(
      PrivacyQuestionIndexChanged event, Emitter<QuestionState> emit) {
    emit(state.copyWith(privacyQuestionIndex: event.privacyQuestionIndex));
  }

  void _onPersonalisationIndexChanged(
      PersonalisationQuestionIndexChanged event, Emitter<QuestionState> emit) {
    emit(state.copyWith(
        personalisationQuestionIndex: event.personalisationQuestionIndex));
  }

  void _onInvestmentStyleQuestionIndexChanged(
      InvestmentStyleQuestionIndexChanged event, Emitter<QuestionState> emit) {
    emit(state.copyWith(
        investmentStyleQuestionIndex: event.investmentStyleQuestionIndex));
  }

  void _onLoadQuestions(
      LoadQuestions event, Emitter<QuestionState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    QuestionCollectionRepository repository = QuestionCollectionRepository();

    var data = await repository.fetchQuestions();
    emit(state.copyWith(response: BaseResponse.complete(data)));
  }
}
