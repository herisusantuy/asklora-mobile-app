import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bloc/transaction_history_bloc.dart';
import 'package:asklora_mobile_app/feature/transaction_history/domain/grouped_transaction_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/domain/transaction_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/repository/transaction_history_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_history_bloc_test.mocks.dart';

@GenerateMocks([TransactionHistoryRepository])
void main() async {
  group('Transaction History Bloc Tests', () {
    late MockTransactionHistoryRepository transactionHistoryRepository;
    late TransactionHistoryBloc transactionHistoryBloc;

    final BaseResponse<List<TransactionModel>> successResponse =
        BaseResponse.complete([
      const BotOrderTransactionModel(
          id: '1', date: '2023-04-01', title: 'AAPL.O'),
      const BotOrderTransactionModel(
          id: '2', date: '2023-04-01', title: 'MSFT.O'),
      const BotOrderTransactionModel(
          id: '3', date: '2023-04-02', title: 'AAPL.O'),
    ]);

    final List<GroupedTransactionModel> groupedTransactions = [
      const GroupedTransactionModel(
          groupType: GroupType.others,
          groupTitle: '2023-04-01',
          data: [
            BotOrderTransactionModel(
                id: '1', date: '2023-04-01', title: 'AAPL.O'),
            BotOrderTransactionModel(
                id: '2', date: '2023-04-01', title: 'MSFT.O'),
          ]),
      const GroupedTransactionModel(
          groupType: GroupType.others,
          groupTitle: '2023-04-02',
          data: [
            BotOrderTransactionModel(
                id: '3', date: '2023-04-01', title: 'AAPL.O'),
          ]),
    ];
    final BaseResponse<List<TransactionModel>> errorResponse =
        BaseResponse.error();

    setUpAll(() async {
      transactionHistoryRepository = MockTransactionHistoryRepository();
    });

    setUp(() async {
      transactionHistoryBloc = TransactionHistoryBloc(
          transactionHistoryRepository: transactionHistoryRepository);
    });

    test('Transaction History Bloc init state response should be default one',
        () {
      expect(transactionHistoryBloc.state, const TransactionHistoryState());
    });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching transaction history',
        build: () {
          when(transactionHistoryRepository.fetchTransactionsHistory())
              .thenAnswer((_) => Future.value(successResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchTransaction()),
        expect: () => {
              TransactionHistoryState(response: BaseResponse.loading()),
              TransactionHistoryState(
                  response: successResponse,
                  allTransactions: groupedTransactions,
                  botOrderTransactions: groupedTransactions),
            });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching transaction history',
        build: () {
          when(transactionHistoryRepository.fetchTransactionsHistory())
              .thenAnswer((_) => Future.value(errorResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchTransaction()),
        expect: () => {
              TransactionHistoryState(response: BaseResponse.loading()),
              TransactionHistoryState(response: errorResponse),
            });

    tearDown(() => {transactionHistoryBloc.close()});
  });
}
