import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/bloc/portfolio_bloc.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/domain/portfolio_detail_response.dart';
import 'package:asklora_mobile_app/feature/bot_stock/presentation/portfolio/repository/portfolio_repository.dart';
import 'package:asklora_mobile_app/feature/bot_stock/utils/bot_stock_utils.dart';
import 'package:asklora_mobile_app/feature/chart/domain/chart_models.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart';
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

    final BaseResponse<List<RecommendedBot>> response =
        BaseResponse.complete(defaultRecommendedBots);

    final BaseResponse<PortfolioDetailResponse> detailResponse =
        BaseResponse.complete(PortfolioDetailResponse());

    final BaseResponse<PortfolioDetailResponse> detailErrorResponse =
        BaseResponse.error('Something went wrong');

    final BaseResponse<List<ChartDataSet>> chartResponse =
        BaseResponse.complete([]);

    final BaseResponse<List<RecommendedBot>> errorResponse =
        BaseResponse.error('Something went wrong');

    final BaseResponse<List<ChartDataSet>> chartErrorResponse =
        BaseResponse.error('Something went wrong');

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
        'fetching chart data',
        build: () {
          when(portfolioRepository.fetchChartDataJson())
              .thenAnswer((_) => Future.value(chartResponse));
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(FetchBotPortfolioChartData()),
        expect: () => {PortfolioState(chartDataResponse: chartResponse)});

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching chart data',
        build: () {
          when(portfolioRepository.fetchChartDataJson())
              .thenThrow(chartErrorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(FetchBotPortfolioChartData()),
        expect: () => {PortfolioState(chartDataResponse: chartErrorResponse)});

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching portfolio detail',
        build: () {
          when(portfolioRepository.fetchPortfolioDetail())
              .thenAnswer((_) => Future.value(detailResponse));
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(FetchPortfolioDetail()),
        expect: () => {
              PortfolioState(portfolioDetailResponse: BaseResponse.loading()),
              PortfolioState(portfolioDetailResponse: detailResponse)
            });

    blocTest<PortfolioBloc, PortfolioState>(
        'emits `BaseResponse.error` WHEN '
        'failed portfolio detail',
        build: () {
          when(portfolioRepository.fetchPortfolioDetail())
              .thenThrow(detailErrorResponse);
          return portfolioBloc;
        },
        act: (bloc) => bloc.add(FetchPortfolioDetail()),
        expect: () => {
              PortfolioState(portfolioDetailResponse: BaseResponse.loading()),
              PortfolioState(portfolioDetailResponse: detailErrorResponse)
            });

    tearDown(() => {portfolioBloc.close()});
  });
}
