import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../domain/fixture.dart';
import '../../repository/ppi_question_repository.dart';

part 'question_event.dart';

part 'question_state.dart';

enum QuestionPageStep {
  privacy,
  privacyResultSuccess,
  privacyResultFailed,
  personalisation,
  personalisationResultEnd,
  investmentStyleWelcome,
  investmentStyle,
  investmentStyleResultEnd,
  unknown
}

enum QuestionPageType { privacyAndPersonalisation, investmentStyle }

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(
      {required PpiQuestionRepository ppiQuestionRepository,
      required QuestionPageType questionPageType})
      : _questionCollectionRepository = ppiQuestionRepository,
        _questionPageType = questionPageType,
        super(const QuestionState()) {
    on<LoadQuestions>(_onLoadQuestions);
    on<PrivacyQuestionIndexChanged>(_onPrivacyQuestionIndexChanged);
    on<PersonalisationQuestionIndexChanged>(_onPersonalisationIndexChanged);
    on<InvestmentStyleQuestionIndexChanged>(
        _onInvestmentStyleQuestionIndexChanged);
    on<CurrentPageIncremented>(_onCurrentPageIncremented);
    on<CurrentPageDecremented>(_onCurrentPageDecremented);
  }

  final PpiQuestionRepository _questionCollectionRepository;
  final QuestionPageType _questionPageType;

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
    var data = await _questionCollectionRepository.fetchQuestions();
    emit(state.copyWith(
        response: BaseResponse.complete(data),
        totalPages: _getTotalPages(data)));
  }

  void _onCurrentPageIncremented(
      CurrentPageIncremented event, Emitter<QuestionState> emit) async {
    emit(state.copyWith(currentPages: state.currentPages + 1));
  }

  void _onCurrentPageDecremented(
      CurrentPageDecremented event, Emitter<QuestionState> emit) async {
    emit(state.copyWith(currentPages: state.currentPages - 1));
  }

  int _getTotalPages(Fixture fixture) {
    switch (_questionPageType) {
      case QuestionPageType.privacyAndPersonalisation:
        //+2 for privacy and personalisation result screen
        return fixture.privacyQuestions.length +
            fixture.personalisedQuestion.length +2;
      case QuestionPageType.investmentStyle:
        //+2 for investment style welcome and result screen
        return fixture.investmentStyleQuestion.length+2;
    }
  }
}
