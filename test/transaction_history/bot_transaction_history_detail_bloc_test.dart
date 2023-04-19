import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/bloc/bot_transaction_history_detail_bloc.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/domain/bot_detail_transaction_history_response.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/domain/grouped_activities_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/repository/transaction_history_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_history_bloc_test.mocks.dart';

@GenerateMocks([TransactionHistoryRepository])
void main() async {
  group('Bot Transaction History Detail Bloc Tests', () {
    late MockTransactionHistoryRepository transactionHistoryRepository;
    late BotTransactionHistoryDetailBloc botTransactionHistoryDetailBloc;

    final BaseResponse<BotDetailTransactionHistoryResponse> successResponse =
        BaseResponse.complete(const BotDetailTransactionHistoryResponse(
            '1',
            'AAPL',
            'APPLE',
            'xx',
            'xx',
            true,
            'open',
            'pending',
            'Pull Up',
            [],
            [],
            0,
            0,
            '',
            0,
            0,
            0,
            0,
            0,
            0));

    final List<GroupedActivitiesModel> groupedActivities = [];
    final BaseResponse<BotDetailTransactionHistoryResponse> errorResponse =
        BaseResponse.error();

    setUpAll(() async {
      transactionHistoryRepository = MockTransactionHistoryRepository();
    });

    setUp(() async {
      botTransactionHistoryDetailBloc = BotTransactionHistoryDetailBloc(
          transactionHistoryRepository: transactionHistoryRepository);
    });

    test(
        'Bot Transaction History Detail Bloc init state response should be default one',
        () {
      expect(botTransactionHistoryDetailBloc.state,
          const BotTransactionHistoryDetailState());
    });

    blocTest<BotTransactionHistoryDetailBloc, BotTransactionHistoryDetailState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching transaction history detail',
        build: () {
          when(transactionHistoryRepository.fetchBotTransactionsDetail('123'))
              .thenAnswer((_) => Future.value(successResponse));
          return botTransactionHistoryDetailBloc;
        },
        act: (bloc) => bloc.add(const FetchBotTransactionDetail('123')),
        expect: () => {
              BotTransactionHistoryDetailState(
                  response: BaseResponse.loading()),
              BotTransactionHistoryDetailState(
                  response: successResponse, activities: groupedActivities),
            });

    blocTest<BotTransactionHistoryDetailBloc, BotTransactionHistoryDetailState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching transaction history detail',
        build: () {
          when(transactionHistoryRepository.fetchBotTransactionsDetail('123'))
              .thenAnswer((_) => Future.value(errorResponse));
          return botTransactionHistoryDetailBloc;
        },
        act: (bloc) => bloc.add(const FetchBotTransactionDetail('123')),
        expect: () => {
              BotTransactionHistoryDetailState(
                  response: BaseResponse.loading()),
              BotTransactionHistoryDetailState(response: errorResponse),
            });

    tearDown(() => {botTransactionHistoryDetailBloc.close()});
  });
}
