import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/bloc/bot_stock_bloc.dart';
import 'package:asklora_mobile_app/feature/bot_stock/repository/bot_stock_repository.dart';
import 'package:asklora_mobile_app/feature/bot_stock/utils/bot_stock_utils.dart';
import 'package:asklora_mobile_app/feature/chart/domain/chart_models.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bot_stock_bloc_test.mocks.dart';

@GenerateMocks([BotStockRepository])
void main() async {
  group('Bot Stock Bloc Tests', () {
    late MockBotStockRepository botStockRepository;
    late BotStockBloc botStockBloc;

    final BaseResponse<List<RecommendedBot>> botStockResponse =
        BaseResponse.complete(defaultRecommendedBots);

    final BaseResponse<List<RecommendedBot>> freeBotStockResponse =
        BaseResponse.complete(defaultRecommendedBots);

    final BaseResponse<List<ChartDataSet>> chartResponse =
        BaseResponse.complete([]);

    final BaseResponse<bool> boolResponse = BaseResponse.complete(true);

    final BaseResponse<List<RecommendedBot>> errorResponse =
        BaseResponse.error('Something went wrong');

    final BaseResponse<List<ChartDataSet>> chartErrorResponse =
        BaseResponse.error('Something went wrong');

    final BaseResponse<bool> boolErrorResponse =
        BaseResponse.error('Something went wrong');

    final RecommendedBot recommendedBot = RecommendedBot(
        '1',
        'TSLA',
        'Tesla TSLA',
        '4',
        'pull_up',
        'For stocks that holds a stable position. ',
        'Tesla Inc',
        '303.75',
        '9',
        '10',
        DateTime.now().add(const Duration(days: 5)));

    setUpAll(() async {
      botStockRepository = MockBotStockRepository();
    });

    setUp(() async {
      botStockBloc = BotStockBloc(botStockRepository: botStockRepository);
    });

    test('Bot Stock Bloc init state response should be default one', () {
      expect(botStockBloc.state, const BotStockState());
    });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching bot recommendation',
        build: () {
          when(botStockRepository.fetchBotRecommendation())
              .thenAnswer((_) => Future.value(botStockResponse));
          return botStockBloc;
        },
        act: (bloc) => bloc.add(FetchBotRecommendation()),
        expect: () => {
              BotStockState(botRecommendationResponse: BaseResponse.loading()),
              BotStockState(botRecommendationResponse: botStockResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching bot recommendation',
        build: () {
          when(botStockRepository.fetchBotRecommendation())
              .thenThrow(errorResponse);
          return botStockBloc;
        },
        act: (bloc) => bloc.add(FetchBotRecommendation()),
        expect: () => {
              BotStockState(botRecommendationResponse: BaseResponse.loading()),
              BotStockState(botRecommendationResponse: errorResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching free bot recommendation',
        build: () {
          when(botStockRepository.fetchFreeBotRecommendation())
              .thenAnswer((_) => Future.value(freeBotStockResponse));
          return botStockBloc;
        },
        act: (bloc) => bloc.add(FetchFreeBotRecommendation()),
        expect: () => {
              BotStockState(botRecommendationResponse: BaseResponse.loading()),
              BotStockState(botRecommendationResponse: freeBotStockResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching free bot recommendation',
        build: () {
          when(botStockRepository.fetchFreeBotRecommendation())
              .thenThrow(errorResponse);
          return botStockBloc;
        },
        act: (bloc) => bloc.add(FetchBotRecommendation()),
        expect: () => {
              BotStockState(botRecommendationResponse: BaseResponse.loading()),
              BotStockState(botRecommendationResponse: errorResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.complete` WHEN '
        'getting free bot stock',
        build: () {
          when(botStockRepository.tradeBotStock(
                  recommendedBot: recommendedBot, tradeBotStockAmount: 0))
              .thenAnswer((_) => Future.value(boolResponse));
          return botStockBloc;
        },
        act: (bloc) => bloc.add(TradeBotStock(
            recommendedBot: recommendedBot, tradeBotStockAmount: 0)),
        expect: () => {
              BotStockState(tradeBotStockResponse: BaseResponse.loading()),
              BotStockState(tradeBotStockResponse: boolResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.error` WHEN '
        'failed getting free bot stock',
        build: () {
          when(botStockRepository.tradeBotStock(
                  recommendedBot: recommendedBot, tradeBotStockAmount: 0))
              .thenThrow(boolErrorResponse);
          return botStockBloc;
        },
        act: (bloc) => bloc.add(TradeBotStock(
            recommendedBot: recommendedBot, tradeBotStockAmount: 0)),
        expect: () => {
              BotStockState(tradeBotStockResponse: BaseResponse.loading()),
              BotStockState(tradeBotStockResponse: boolErrorResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.complete` WHEN '
        'ending bot stock',
        build: () {
          when(botStockRepository.endBotStock(recommendedBot))
              .thenAnswer((_) => Future.value(boolResponse));
          return botStockBloc;
        },
        act: (bloc) => bloc.add(EndBotStock(recommendedBot)),
        expect: () => {
              BotStockState(endBotStockResponse: BaseResponse.loading()),
              BotStockState(endBotStockResponse: boolResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.error` WHEN '
        'failed ending bot stock',
        build: () {
          when(botStockRepository.endBotStock(recommendedBot))
              .thenThrow(boolErrorResponse);
          return botStockBloc;
        },
        act: (bloc) => bloc.add(EndBotStock(recommendedBot)),
        expect: () => {
              BotStockState(endBotStockResponse: BaseResponse.loading()),
              BotStockState(endBotStockResponse: boolErrorResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `faq active index = 1` WHEN '
        'tap faq on index 1',
        build: () => botStockBloc,
        act: (bloc) => bloc.add(const FaqActiveIndexChanged(1)),
        expect: () => {
              const BotStockState(faqActiveIndex: 1),
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching chart data',
        build: () {
          when(botStockRepository.fetchChartDataJson())
              .thenAnswer((_) => Future.value(chartResponse));
          return botStockBloc;
        },
        act: (bloc) => bloc.add(FetchChartData()),
        expect: () => {BotStockState(chartDataResponse: chartResponse)});

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching chart data',
        build: () {
          when(botStockRepository.fetchChartDataJson())
              .thenThrow(chartErrorResponse);
          return botStockBloc;
        },
        act: (bloc) => bloc.add(FetchChartData()),
        expect: () => {BotStockState(chartDataResponse: chartErrorResponse)});

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching bot recommendation',
        build: () => botStockBloc,
        act: (bloc) => bloc.add(const TradeBotStockAmountChanged(200)),
        expect: () => {
              const BotStockState(botStockTradeAmount: 200),
            });

    tearDown(() => {botStockBloc.close()});
  });
}
