import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
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
    on<CurrentPrivacyPageIncremented>(_onCurrentPrivacyPageIncremented);
    on<CurrentPersonalisationPageIncremented>(
        _onCurrentPersonalisationPageIncremented);
    on<CurrentInvestmentStylePageIncremented>(
        _onCurrentInvestmentStylePageIncremented);
    on<CurrentPrivacyPageDecremented>(_onCurrentPrivacyPageDecremented);
    on<CurrentPersonalisationPageDecremented>(
        _onCurrentPersonalisationPageDecremented);
    on<CurrentInvestmentStylePageDecremented>(
        _onCurrentInvestmentStylePageDecremented);
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
        currentPrivacyPages:
            _questionPageType == QuestionPageType.privacyAndPersonalisation
                ? 1
                : 0,
        currentInvestmentStylePages:
            _questionPageType == QuestionPageType.investmentStyle ? 1 : 0,
        //+1 for privacy result
        totalPrivacyPages: data.privacyQuestions.length + 1,
        //+1 for personalisation result
        totalPersonalisationPages: data.personalisedQuestion.length + 1,
        //+1 for investmentStyle result
        totalInvestmentStylePages: data.investmentStyleQuestion.length + 1));
  }

  void _onCurrentPrivacyPageIncremented(
      CurrentPrivacyPageIncremented event, Emitter<QuestionState> emit) async {
    emit(state.copyWith(currentPrivacyPages: state.currentPrivacyPages + 1));
  }

  void _onCurrentPersonalisationPageIncremented(
      CurrentPersonalisationPageIncremented event,
      Emitter<QuestionState> emit) async {
    emit(state.copyWith(
        currentPersonalisationPages: state.currentPersonalisationPages + 1));
  }

  void _onCurrentInvestmentStylePageIncremented(
      CurrentInvestmentStylePageIncremented event,
      Emitter<QuestionState> emit) async {
    emit(state.copyWith(
        currentInvestmentStylePages: state.currentInvestmentStylePages + 1));
  }

  void _onCurrentPrivacyPageDecremented(
      CurrentPrivacyPageDecremented event, Emitter<QuestionState> emit) async {
    emit(state.copyWith(currentPrivacyPages: state.currentPrivacyPages - 1));
  }

  void _onCurrentPersonalisationPageDecremented(
      CurrentPersonalisationPageDecremented event,
      Emitter<QuestionState> emit) async {
    emit(state.copyWith(
        currentPersonalisationPages: state.currentPersonalisationPages - 1));
  }

  void _onCurrentInvestmentStylePageDecremented(
      CurrentInvestmentStylePageDecremented event,
      Emitter<QuestionState> emit) async {
    emit(state.copyWith(
        currentInvestmentStylePages: state.currentInvestmentStylePages - 1));
  }
}
