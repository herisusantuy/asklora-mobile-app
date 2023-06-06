import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/bloc/bot_transaction_history_detail_bloc.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/domain/bot_activities_transaction_history_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/domain/bot_detail_transaction_history_response.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/domain/grouped_activities_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/domain/grouped_model.dart';
import 'package:asklora_mobile_app/core/repository/transaction_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_history_bloc_test.mocks.dart';

@GenerateMocks([TransactionRepository])
void main() async {
  group('Bot Transaction History Detail Bloc Tests', () {
    late MockTransactionRepository transactionRepository;
    late BotTransactionHistoryDetailBloc botTransactionHistoryDetailBloc;

    final BaseResponse<BotDetailTransactionHistoryResponse> successResponse =
        BaseResponse.complete(BotDetailTransactionHistoryResponse(
            '1',
            'AAPL',
            'APPLE',
            'xx',
            'xx',
            true,
            'open',
            'pending',
            'Pull Up',
            const [],
            [
              BotActivitiesTransactionHistoryModel(
                DateTime(2023, 04, 14),
                0,
                0,
                0,
                'buy',
                0,
                '',
                0,
                index: 1,
              ),
              BotActivitiesTransactionHistoryModel(
                DateTime(2023, 04, 14),
                0,
                0,
                0,
                'buy',
                0,
                '',
                0,
                index: 1,
              ),
              BotActivitiesTransactionHistoryModel(
                DateTime(2023, 04, 15),
                0,
                0,
                0,
                'buy',
                0,
                '',
                0,
                index: 1,
              ),
            ],
            0,
            0,
            '',
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            '',
            ''));

    final List<GroupedActivitiesModel> groupedActivities = [
      GroupedActivitiesModel(
          groupType: GroupType.others,
          groupTitle: '2023-04-14',
          data: [
            BotActivitiesTransactionHistoryModel(
              DateTime(2023, 04, 14),
              0,
              0,
              0,
              'buy',
              0,
              '',
              0,
              index: 1,
            ),
            BotActivitiesTransactionHistoryModel(
              DateTime(2023, 04, 14),
              0,
              0,
              0,
              'buy',
              0,
              '',
              0,
              index: 1,
            ),
          ]),
      GroupedActivitiesModel(
          groupType: GroupType.others,
          groupTitle: '2023-04-15',
          data: [
            BotActivitiesTransactionHistoryModel(
              DateTime(2023, 04, 15),
              0,
              0,
              0,
              'buy',
              0,
              '',
              0,
              index: 1,
            ),
          ]),
    ];
    final BaseResponse<BotDetailTransactionHistoryResponse> errorResponse =
        BaseResponse.error();

    setUpAll(() async {
      transactionRepository = MockTransactionRepository();
    });

    setUp(() async {
      botTransactionHistoryDetailBloc = BotTransactionHistoryDetailBloc(
          transactionHistoryRepository: transactionRepository);
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
          when(transactionRepository.fetchBotTransactionsDetail('123'))
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
          when(transactionRepository.fetchBotTransactionsDetail('123'))
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
