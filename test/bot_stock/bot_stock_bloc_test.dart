import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/bloc/bot_stock_bloc.dart';
import 'package:asklora_mobile_app/feature/bot_stock/domain/bot_recommendation_model.dart';
import 'package:asklora_mobile_app/feature/bot_stock/repository/bot_stock_repository.dart';
import 'package:asklora_mobile_app/feature/bot_stock/utils/bot_stock_utils.dart';
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

    final BaseResponse<List<BotRecommendationModel>> botStockResponse =
        BaseResponse.complete(defaultBotRecommendation);

    final BaseResponse<List<BotRecommendationModel>> freeBotStockResponse =
        BaseResponse.complete(defaultBotRecommendation);

    final BaseResponse<bool> boolResponse = BaseResponse.complete(true);

    final BaseResponse<List<BotRecommendationModel>> errorResponse =
        BaseResponse.error();

    final BaseResponse<bool> boolErrorResponse = BaseResponse.error();

    const BotRecommendationModel botRecommendationModel =
        BotRecommendationModel(1, '', '', '', '', '', 'Pullup', '', '', '', '');

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
        'trade bot stock',
        build: () {
          when(botStockRepository.tradeBotStock(
                  botRecommendationModel: botRecommendationModel,
                  tradeBotStockAmount: 0))
              .thenAnswer((_) => Future.value(boolResponse));
          return botStockBloc;
        },
        act: (bloc) => bloc.add(const TradeBotStock(
            botRecommendationModel: botRecommendationModel,
            tradeBotStockAmount: 0)),
        expect: () => {
              BotStockState(tradeBotStockResponse: BaseResponse.loading()),
              BotStockState(tradeBotStockResponse: boolResponse)
            });

    blocTest<BotStockBloc, BotStockState>(
        'emits `BaseResponse.error` WHEN '
        'failed trade bot stock',
        build: () {
          when(botStockRepository.tradeBotStock(
                  botRecommendationModel: botRecommendationModel,
                  tradeBotStockAmount: 0))
              .thenThrow(boolErrorResponse);
          return botStockBloc;
        },
        act: (bloc) => bloc.add(const TradeBotStock(
            botRecommendationModel: botRecommendationModel,
            tradeBotStockAmount: 0)),
        expect: () => {
              BotStockState(tradeBotStockResponse: BaseResponse.loading()),
              BotStockState(tradeBotStockResponse: boolErrorResponse)
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
        'fetching bot recommendation',
        build: () => botStockBloc,
        act: (bloc) => bloc.add(const TradeBotStockAmountChanged(200)),
        expect: () => {
              const BotStockState(botStockTradeAmount: 200),
            });

    tearDown(() => {botStockBloc.close()});
  });
}
