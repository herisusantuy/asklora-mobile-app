import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../tabs/lora_gpt/domain/conversation.dart';
import '../../../tabs/lora_gpt/repository/lora_gpt_repository.dart';
import '../domain/interaction.dart';
import '../domain/investment_style_question_query_request.dart';

part 'ai_investment_style_question_event.dart';

part 'ai_investment_style_question_state.dart';

class AiInvestmentStyleQuestionBloc extends Bloc<AiInvestmentStyleQuestionEvent,
    AiInvestmentStyleQuestionState> {
  AiInvestmentStyleQuestionBloc(
      {required SharedPreference sharedPreference,
      required LoraGptRepository loraGptRepository})
      : _sharedPreference = sharedPreference,
        _loraGptRepository = loraGptRepository,
        super(const AiInvestmentStyleQuestionState()) {
    on<InitiateAI>(_onInitiateAI);
    on<QueryChanged>(_onQueryChanged);
    on<SubmitQuery>(_onSubmitQuery);
    on<SubmitAnswer>(_onSubmitAnswer);
    on<NextQuestion>(_onNextQuestion);
    on<ResetSession>(_onResetSession);
    on<OnFinishTyping>(_onFinishTyping);
  }

  final SharedPreference _sharedPreference;
  final LoraGptRepository _loraGptRepository;

  void _onInitiateAI(InitiateAI onEditQuery,
      Emitter<AiInvestmentStyleQuestionState> emit) async {
    final userName = await _sharedPreference.readData(sfKeyPpiName) ?? 'Me';
    final askloraId = await _sharedPreference.readIntData(sfKeyAskloraId);

    emit(state.copyWith(
        sessionId: '', userName: userName, userId: askloraId.toString()));

    add(const SubmitQuery(isNewSession: true));
  }

  void _onQueryChanged(
      QueryChanged event, Emitter<AiInvestmentStyleQuestionState> emit) {
    emit(state.copyWith(query: event.query));
  }

  void _onNextQuestion(
      NextQuestion event, Emitter<AiInvestmentStyleQuestionState> emit) {
    final tempList = List<Conversation>.of(state.conversations)
      ..removeLast()
      ..add(Me('Move on'));
    emit(state.copyWith(query: '', conversations: tempList));
    add(const SubmitQuery(answerId: '1'));
  }

  void _onSubmitAnswer(
      SubmitAnswer event, Emitter<AiInvestmentStyleQuestionState> emit) {
    emit(state.copyWith(
        query: '',
        conversations: state.conversations..add(Me(event.answerText))));
    add(SubmitQuery(answerId: event.answerId));
  }

  void _onSubmitQuery(
      SubmitQuery event, Emitter<AiInvestmentStyleQuestionState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);
    if (tempList.isNotEmpty && tempList.last is NextButton) {
      tempList.removeLast();
    }
    if (!event.isNewSession && state.query.isNotEmpty) {
      tempList.add(Me(state.query));
    }

    tempList.add(Loading());

    emit(state.copyWith(
      isTyping: true,
      conversations: tempList,
    ));

    var response = await _loraGptRepository.investmentStyle(
        params: InvestmentStyleQuestionQueryRequest(
            userId: state.userId,
            username: state.userName,
            input: state.query,
            start: event.isNewSession,
            answer: int.parse(event.answerId)));

    tempList.removeLast();
    if (response.state == ResponseState.success) {
      tempList.add(Lora(response.data!.response, '', '', false));
      if (response.data!.investmentStyleQuestionProgress.currentQuestion == 1 &&
          response.data!.choices.isNotEmpty) {
        tempList.add(NextButton());
      }
      emit(state.copyWith(
        interaction: _getInteraction(response.data!.choices,
            response.data!.investmentStyleQuestionProgress.currentQuestion),
      ));
    } else {
      tempList.add(Lora(
          'Sorry I cannot connect to the server right now, please try again',
          '',
          '',
          false));
    }

    emit(state.copyWith(
      query: '',
      isTyping: false,
      conversations: tempList,
    ));
  }

  ISQInteraction _getInteraction(
      Map<String, String> choices, int currentQuestion) {
    if (currentQuestion == 1) {
      return const TextFieldInteraction();
    } else if (currentQuestion == 5) {
      return const SummaryInteraction();
    } else {
      return ChoicesInteraction(choices);
    }
  }

  void _onResetSession(ResetSession onResetSession,
      Emitter<AiInvestmentStyleQuestionState> emit) {
    emit(state.copyWith(
        conversations: [], isTyping: false, sessionId: '', query: ''));
    add(const SubmitQuery(isNewSession: true));
  }

  void _onFinishTyping(OnFinishTyping onFinishTyping,
          Emitter<AiInvestmentStyleQuestionState> emit) =>
      emit(state.copyWith(isTyping: false));
}
