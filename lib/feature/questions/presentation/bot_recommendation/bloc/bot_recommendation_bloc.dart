import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../domain/endpoint_response.dart';
import '../../../repository/bot_recommendation_repository.dart';

part 'bot_recommendation_event.dart';

part 'bot_recommendation_state.dart';

class BotRecommendationBloc
    extends Bloc<BotRecommendationEvent, BotRecommendationState> {
  BotRecommendationBloc(
      {required List<RecommendedBot> defaultBotsSelected,
      required BotRecommendationRepository botRecommendationRepository})
      : _botRecommendationRepository = botRecommendationRepository,
        super(BotRecommendationState(botsSelected: defaultBotsSelected)) {
    on<SubmitBots>(_onSubmitBots);
    on<LoadBots>(_onLoadBots);
    on<BotSelected>(_onBotSelected);
  }

  final BotRecommendationRepository _botRecommendationRepository;

  void _onBotSelected(BotSelected event, Emitter<BotRecommendationState> emit) {
    List<RecommendedBot> botsSelected = List.from(state.botsSelected);
    if (botsSelected.contains(event.recommendedBot)) {
      botsSelected.remove(event.recommendedBot);
    } else {
      botsSelected.add(event.recommendedBot);
    }
    emit(state.copyWith(botsSelected: botsSelected));
  }

  void _onSubmitBots(SubmitBots event, Emitter<BotRecommendationState> emit) {}

  void _onLoadBots(LoadBots event, Emitter<BotRecommendationState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _botRecommendationRepository.fetchBots();
      emit(state.copyWith(response: data));
    } catch (e) {
      emit(state.copyWith(
          response: BaseResponse.error(
              'Something went wrong, please try again later')));
    }
  }
}
