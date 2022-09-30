import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../repository/question_collection_repository.dart';

part 'question_event.dart';

part 'question_state.dart';

enum QuestionPageStep {
  privacy,
  personalisation,
  investmentStyle,
  botRecommendation,
  unknown
}

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(
      {required QuestionCollectionRepository questionCollectionRepository})
      : _questionCollectionRepository = questionCollectionRepository,
        super(const QuestionState()) {
    on<LoadQuestions>(_onLoadQuestions);
    on<PrivacyQuestionIndexChanged>(_onPrivacyQuestionIndexChanged);
    on<InvestmentStyleQuestionIndexChanged>(
        _onInvestmentStyleQuestionIndexChanged);
  }

  final QuestionCollectionRepository _questionCollectionRepository;

  void _onPrivacyQuestionIndexChanged(
      PrivacyQuestionIndexChanged event, Emitter<QuestionState> emit) {
    emit(state.copyWith(privacyQuestionIndex: event.privacyQuestionIndex));
  }

  void _onInvestmentStyleQuestionIndexChanged(
      InvestmentStyleQuestionIndexChanged event, Emitter<QuestionState> emit) {
    emit(state.copyWith(
        investmentStyleQuestionIndex: event.investmentStyleQuestionIndex));
  }

  void _onLoadQuestions(
      LoadQuestions event, Emitter<QuestionState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var data = await _questionCollectionRepository.fetchQuestions();
    emit(state.copyWith(response: BaseResponse.complete(data)));
  }
}
