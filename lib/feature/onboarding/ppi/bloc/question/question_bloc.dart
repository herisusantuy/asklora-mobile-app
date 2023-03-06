import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../core/utils/storage/storage_keys.dart';
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
  investmentStyle,
  investmentStyleResultEnd,
  unknown
}

enum QuestionPageType { privacy, personalisation, investmentStyle }

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc({
    required PpiQuestionRepository ppiQuestionRepository,
    required QuestionPageType questionPageType,
    required SharedPreference sharedPreference,
  })  : _questionCollectionRepository = ppiQuestionRepository,
        _questionPageType = questionPageType,
        _sharedPreference = sharedPreference,
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
  final SharedPreference _sharedPreference;

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
    try {
      late final Fixture fixture;
      if (_questionPageType == QuestionPageType.privacy) {
        fixture = await _questionCollectionRepository
            .fetchPersonalAndPrivacyQuestions();
      } else {
        final accountId = await _sharedPreference.readData(sfKeyPpiAccountId);

        fixture = await _questionCollectionRepository
            .fetchInvestmentStyleQuestions(accountId ?? '');
      }

      emit(state.copyWith(response: BaseResponse.complete(fixture)));
      //+1 for privacy result
      int totalPrivacyPages = fixture.getPrivacyQuestions.length + 1;
      emit(state.copyWith(
          response: BaseResponse.complete(fixture),
          currentPrivacyPages: _questionPageType == QuestionPageType.privacy
              ? 1
              : totalPrivacyPages,
          currentInvestmentStylePages:
              _questionPageType == QuestionPageType.investmentStyle ? 1 : 0,
          currentPersonalisationPages:
              _questionPageType == QuestionPageType.personalisation ? 1 : 0,
          totalPrivacyPages: totalPrivacyPages,
          //+1 for personalisation result
          totalPersonalisationPages: fixture.getPersonalisedQuestion.length + 1,
          //+1 for investmentStyle result
          totalInvestmentStylePages:
              fixture.getInvestmentStyleQuestion.length + 1));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
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
