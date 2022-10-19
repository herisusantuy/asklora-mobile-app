import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/ppi_user_response.dart';
import 'package:asklora_mobile_app/feature/ppi/presentation/bot_recommendation/bloc/bot_recommendation_bloc.dart';
import 'package:asklora_mobile_app/feature/ppi/repository/bot_recommendation_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bot_recommendation_bloc_test.mocks.dart';

@GenerateMocks([BotRecommendationRepository])
void main() async {
  group('User Response Bloc Tests', () {
    late BotRecommendationRepository botRecommendationRepository;
    late BotRecommendationBloc botRecommendationBloc;
    final BaseResponse<List<RecommendedBot>> response =
        BaseResponse.complete([]);
    final RecommendedBot recommendedBot =
        RecommendedBot('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j');

    setUpAll(() async {
      botRecommendationRepository = MockBotRecommendationRepository();
    });

    setUp(() async {
      botRecommendationBloc = BotRecommendationBloc(
          botRecommendationRepository: botRecommendationRepository,
          defaultBotsSelected: []);
    });

    test('Bot Recommendation Bloc init response is should be BaseResponse()',
        () {
      expect(botRecommendationBloc.state,
          const BotRecommendationState(response: BaseResponse()));
    });

    blocTest<BotRecommendationBloc, BotRecommendationState>(
        'emits bot selected with list contain recommendedBot WHEN '
        'load the bots',
        build: () => botRecommendationBloc,
        act: (bloc) => bloc.add(BotSelected(recommendedBot)),
        expect: () => {
              BotRecommendationState(botsSelected: [recommendedBot]),
            });

    blocTest<BotRecommendationBloc, BotRecommendationState>(
        'emits response BaseResponse.complete() WHEN '
        'load the bots',
        build: () {
          when(botRecommendationRepository.fetchBots())
              .thenAnswer((_) => Future.value(response));
          return botRecommendationBloc;
        },
        act: (bloc) => bloc.add(LoadBots()),
        expect: () => {
              BotRecommendationState(response: BaseResponse.loading()),
              BotRecommendationState(response: response)
            });

    tearDown(() => {botRecommendationBloc.close()});
  });
}
