import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/utils/currency_enum.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/bloc/portfolio_bloc.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/domain/portfolio_bot_model.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/domain/portfolio_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/repository/portfolio_repository.dart';
import 'package:asklora_mobile_app/feature/bot_stock/utils/bot_stock_utils.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'portfolio_bloc_test.mocks.dart';

@GenerateMocks([PortfolioRepository])
void main() async {
  group('Portfolio Bloc Tests', () {
    late MockPortfolioRepository portfolioRepository;
    late PortfolioBloc portfolioBloc;

    final BaseResponse<List<PortfolioBotModel>> response =
        BaseResponse.complete(defaultPortfolioBot);

    final BaseResponse<PortfolioResponse> portfolioResponse =
        BaseResponse.complete(PortfolioResponse());

    final BaseResponse<PortfolioResponse> portfolioErrorResponse =
        BaseResponse.error(BaseResponse.errorMessage);

    final BaseResponse<List<PortfolioBotModel>> errorResponse =
        BaseResponse.error(BaseResponse.errorMessage);

    final BaseResponse<bool> boolResponse = BaseResponse.complete(true);

    final BaseResponse<bool> boolErrorResponse =
        BaseResponse.error(BaseResponse.errorMessage);

    const PortfolioBotModel portfolioBotModel = PortfolioBotModel(
        1,
        '',
        '',
        'CLASSIC_classic_003846',
        '',
        '',
        'Pullup',
        'MSFT.O',
        'TESLA',
        '',
        '440',
        2000);

    setUpAll(() async {
      portfolioRepository = MockPortfolioRepository();
    });

    setUp(() async {
      portfolioBloc = PortfolioBloc(portfolioRepository: portfolioRepository);
    });

    test('Portfolio Bloc init state response should be default one', () {
      expect(portfolioBloc.state, const PortfolioState());
    });

    blocTest<PortfolioBloc, PortfolioState>(
        'init HKD to default of the  currency',
        build: () => portfolioBloc,
        act: (bloc) => {bloc.add(const CurrencyChanged(CurrencyType.hkd))},
        expect: () => {const PortfolioState(currency: CurrencyType.hkd)});

    blocTest<PortfolioBloc, PortfolioState>('change currency from HKD to USD',
        build: () => portfolioBloc,
        act: (bloc) => {
              bloc.add(const CurrencyChanged(CurrencyType.hkd)),
              bloc.add(const CurrencyChanged(CurrencyType.usd)),
            },
        expect: () => {
              const PortfolioState(currency: CurrencyType.hkd),
              const PortfolioState(currency: CurrencyType.usd),
            });

    blocTest<PortfolioBloc, PortfolioState>('change currency from USD to HKD',
        build: () => portfolioBloc,
        act: (bloc) => {
              bloc.add(const CurrencyChanged(CurrencyType.usd)),
              bloc.add(const CurrencyChanged(CurrencyType.hkd)),
            },
        expect: () => {
              const PortfolioState(currency: CurrencyType.usd),
              const PortfolioState(currency: CurrencyType.hkd),
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching bot portfolio',
        build: () {
          when(portfolioRepository.fetchBotPortfolio(BotStockFilter.all))
              .thenAnswer((_) => Future.value(response));
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const FetchBotPortfolio()),
        expect: () => {
              PortfolioState(botPortfolioResponse: BaseResponse.loading()),
              PortfolioState(botPortfolioResponse: response)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching bot portfolio',
        build: () {
          when(portfolioRepository.fetchBotPortfolio(BotStockFilter.all))
              .thenThrow(errorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const FetchBotPortfolio()),
        expect: () => {
              PortfolioState(botPortfolioResponse: BaseResponse.loading()),
              PortfolioState(botPortfolioResponse: errorResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching portfolio detail',
        build: () {
          when(portfolioRepository.fetchPortfolio())
              .thenAnswer((_) => Future.value(portfolioResponse));
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(FetchPortfolio()),
        expect: () => {
              PortfolioState(portfolioResponse: BaseResponse.loading()),
              PortfolioState(portfolioResponse: portfolioResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed portfolio detail',
        build: () {
          when(portfolioRepository.fetchPortfolio())
              .thenThrow(portfolioErrorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(FetchPortfolio()),
        expect: () => {
              PortfolioState(portfolioResponse: BaseResponse.loading()),
              PortfolioState(portfolioResponse: portfolioErrorResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.complete` WHEN '
        'ending bot stock',
        build: () {
          when(portfolioRepository.endBotStock(portfolioBotModel))
              .thenAnswer((_) => Future.value(boolResponse));
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const EndBotStock(portfolioBotModel)),
        expect: () => {
              PortfolioState(endBotStockResponse: BaseResponse.loading()),
              PortfolioState(endBotStockResponse: boolResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed ending bot stock',
        build: () {
          when(portfolioRepository.endBotStock(portfolioBotModel))
              .thenThrow(boolErrorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const EndBotStock(portfolioBotModel)),
        expect: () => {
              PortfolioState(endBotStockResponse: BaseResponse.loading()),
              PortfolioState(endBotStockResponse: boolErrorResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.complete` WHEN '
        'rollover bot stock',
        build: () {
          when(portfolioRepository.rolloverBotStock(portfolioBotModel))
              .thenAnswer((_) => Future.value(boolResponse));
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const RolloverBotStock(portfolioBotModel)),
        expect: () => {
              PortfolioState(rolloverBotStockResponse: BaseResponse.loading()),
              PortfolioState(rolloverBotStockResponse: boolResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed rollover bot stock',
        build: () {
          when(portfolioRepository.rolloverBotStock(portfolioBotModel))
              .thenThrow(boolErrorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const RolloverBotStock(portfolioBotModel)),
        expect: () => {
              PortfolioState(rolloverBotStockResponse: BaseResponse.loading()),
              PortfolioState(rolloverBotStockResponse: boolErrorResponse)
            });

    tearDown(() => {portfolioBloc.close()});
  });
}
