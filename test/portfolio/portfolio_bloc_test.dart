import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/domain/orders/bot_active_order_model.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/bloc/portfolio_bloc.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/domain/portfolio_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/repository/portfolio_repository.dart';
import 'package:asklora_mobile_app/feature/bot_stock/repository/bot_stock_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'portfolio_bloc_test.mocks.dart';

@GenerateMocks([PortfolioRepository])
@GenerateMocks([BotStockRepository])
void main() async {
  group('Portfolio Bloc Tests', () {
    late MockPortfolioRepository portfolioRepository;
    late MockBotStockRepository botStockRepository;
    late PortfolioBloc portfolioBloc;

    final BaseResponse<List<BotActiveOrderModel>> response =
        BaseResponse.complete([]);

    final BaseResponse<List<BotActiveOrderModel>> errorResponse =
        BaseResponse.error();

    final BaseResponse<PortfolioResponse> portfolioResponse =
        BaseResponse.complete(PortfolioResponse());

    final BaseResponse<PortfolioResponse> portfolioErrorResponse =
        BaseResponse.error();

    final BaseResponse<bool> boolResponse = BaseResponse.complete(true);

    final BaseResponse<bool> boolErrorResponse = BaseResponse.error();

    setUpAll(() async {
      portfolioRepository = MockPortfolioRepository();
      botStockRepository = MockBotStockRepository();
    });

    setUp(() async {
      portfolioBloc = PortfolioBloc(
          portfolioRepository: portfolioRepository,
          botStockRepository: botStockRepository);
    });
    //
    // test('Portfolio Bloc init state response should be default one', () {
    //   expect(portfolioBloc.state, const PortfolioState());
    // });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'init HKD to default of the  currency',
    //     build: () => portfolioBloc,
    //     act: (bloc) => {bloc.add(const CurrencyChanged(CurrencyType.hkd))},
    //     expect: () => {const PortfolioState(currency: CurrencyType.hkd)});
    //
    // blocTest<PortfolioBloc, PortfolioState>('change currency from HKD to USD',
    //     build: () => portfolioBloc,
    //     act: (bloc) => {
    //           bloc.add(const CurrencyChanged(CurrencyType.hkd)),
    //           bloc.add(const CurrencyChanged(CurrencyType.usd)),
    //         },
    //     expect: () => {
    //           const PortfolioState(currency: CurrencyType.hkd),
    //           const PortfolioState(currency: CurrencyType.usd),
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>('change currency from USD to HKD',
    //     build: () => portfolioBloc,
    //     act: (bloc) => {
    //           bloc.add(const CurrencyChanged(CurrencyType.usd)),
    //           bloc.add(const CurrencyChanged(CurrencyType.hkd)),
    //         },
    //     expect: () => {
    //           const PortfolioState(currency: CurrencyType.usd),
    //           const PortfolioState(currency: CurrencyType.hkd),
    //         });

    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.complete` WHEN '
    //     'fetching bot portfolio',
    //     build: () {
    //       when(botStockRepository.activeOrders(
    //               botStockFilter: BotStockFilter.all))
    //           .thenAnswer((_) => Future.value(response));
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const FetchActiveOrders()),
    //     expect: () => {
    //           PortfolioState(botActiveOrderResponse: BaseResponse.loading()),
    //           PortfolioState(botActiveOrderResponse: response)
    //         });

    /*blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching bot portfolio',
        build: () {
          when(botStockRepository.activeOrders(
                  botStockFilter: BotStockFilter.all))
              .thenThrow(errorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(const FetchActiveOrders(botStockFilter: BotStockFilter.all)),
        expect: () => {
              PortfolioState(botActiveOrderResponse: BaseResponse.loading()),
              PortfolioState(botActiveOrderResponse: errorResponse)
            });*/

    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.complete` WHEN '
    //     'fetching portfolio detail',
    //     build: () {
    //       when(portfolioRepository.fetchPortfolio())
    //           .thenAnswer((_) => Future.value(portfolioResponse));
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(FetchPortfolio()),
    //     expect: () => {
    //           PortfolioState(portfolioResponse: BaseResponse.loading()),
    //           PortfolioState(portfolioResponse: portfolioResponse)
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.error` WHEN '
    //     'failed portfolio detail',
    //     build: () {
    //       when(portfolioRepository.fetchPortfolio())
    //           .thenThrow(portfolioErrorResponse);
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(FetchPortfolio()),
    //     expect: () => {
    //           PortfolioState(portfolioResponse: BaseResponse.loading()),
    //           PortfolioState(portfolioResponse: portfolioErrorResponse)
    //         });

    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.complete` WHEN '
    //     'terminate bot stock',
    //     build: () {
    //       when(botStockRepository.terminateOrder('123'))
    //           .thenAnswer((_) => Future.value(boolResponse));
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const EndBotStock('123')),
    //     expect: () => {
    //           PortfolioState(endBotStockResponse: BaseResponse.loading()),
    //           PortfolioState(endBotStockResponse: boolResponse)
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.error` WHEN '
    //     'failed terminate bot stock',
    //     build: () {
    //       when(botStockRepository.terminateOrder('123'))
    //           .thenThrow(boolErrorResponse);
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const EndBotStock('123')),
    //     expect: () => {
    //           PortfolioState(endBotStockResponse: BaseResponse.loading()),
    //           PortfolioState(endBotStockResponse: boolErrorResponse)
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.complete` WHEN '
    //     'rollover bot stock',
    //     build: () {
    //       when(botStockRepository.rolloverOrder('123'))
    //           .thenAnswer((_) => Future.value(boolResponse));
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const RolloverBotStock('123')),
    //     expect: () => {
    //           PortfolioState(rolloverBotStockResponse: BaseResponse.loading()),
    //           PortfolioState(rolloverBotStockResponse: boolResponse)
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.error` WHEN '
    //     'failed rollover bot stock',
    //     build: () {
    //       when(botStockRepository.rolloverOrder('123'))
    //           .thenThrow(boolErrorResponse);
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const RolloverBotStock('123')),
    //     expect: () => {
    //           PortfolioState(rolloverBotStockResponse: BaseResponse.loading()),
    //           PortfolioState(rolloverBotStockResponse: boolErrorResponse)
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.complete` WHEN '
    //     'cancel bot stock',
    //     build: () {
    //       when(botStockRepository.cancelOrder('123'))
    //           .thenAnswer((_) => Future.value(boolResponse));
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const CancelBotStock('123')),
    //     expect: () => {
    //           PortfolioState(cancelBotStockResponse: BaseResponse.loading()),
    //           PortfolioState(cancelBotStockResponse: boolResponse)
    //         });
    //
    // blocTest<PortfolioBloc, PortfolioState>(
    //     'emits `BaseResponse.error` WHEN '
    //     'cancel bot stock',
    //     build: () {
    //       when(botStockRepository.cancelOrder('123'))
    //           .thenThrow(boolErrorResponse);
    //       return portfolioBloc;
    //     },
    //     act: (bloc) => bloc.add(const CancelBotStock('123')),
    //     expect: () => {
    //           PortfolioState(cancelBotStockResponse: BaseResponse.loading()),
    //           PortfolioState(cancelBotStockResponse: boolErrorResponse)
    //         });

    tearDown(() => {portfolioBloc.close()});
  });
}
