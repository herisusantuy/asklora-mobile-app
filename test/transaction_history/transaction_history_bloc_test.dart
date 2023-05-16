import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/transaction_history/bloc/transaction_history_bloc.dart';
import 'package:asklora_mobile_app/feature/transaction_history/domain/grouped_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/domain/grouped_transaction_model.dart';
import 'package:asklora_mobile_app/feature/transaction_history/domain/transaction_history_model.dart';
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

    final BaseResponse<List<GroupedTransactionModel>> successResponse =
        BaseResponse.complete([
      const GroupedTransactionModel(
          groupType: GroupType.others,
          groupTitle: '2023-04-01',
          data: [
            TransactionHistoryModel('1', TransactionHistoryType.bot,
                '2023-04-01', '2023-04-01', 'AAPL', 'place', '2000'),
            TransactionHistoryModel('1', TransactionHistoryType.bot,
                '2023-04-01', '2023-04-01', 'BMW', 'place', '2500'),
          ]),
      const GroupedTransactionModel(
          groupType: GroupType.others,
          groupTitle: '2023-04-02',
          data: [
            TransactionHistoryModel('1', TransactionHistoryType.bot,
                '2023-04-02', '2023-04-02', 'FORD', 'place', '1000'),
          ]),
    ]);

    final BaseResponse<List<GroupedTransactionModel>> errorResponse =
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
          when(transactionHistoryRepository
                  .fetchTransactionsHistory(TransactionHistoryType.all))
              .thenAnswer((_) => Future.value(successResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchAllTransaction()),
        expect: () => {
              TransactionHistoryState(
                  allTransactionsResponse: BaseResponse.loading()),
              TransactionHistoryState(allTransactionsResponse: successResponse),
            });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching transaction history',
        build: () {
          when(transactionHistoryRepository
                  .fetchTransactionsHistory(TransactionHistoryType.all))
              .thenAnswer((_) => Future.value(errorResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchAllTransaction()),
        expect: () => {
              TransactionHistoryState(
                  allTransactionsResponse: BaseResponse.loading()),
              TransactionHistoryState(allTransactionsResponse: errorResponse),
            });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching bot transaction history',
        build: () {
          when(transactionHistoryRepository
                  .fetchTransactionsHistory(TransactionHistoryType.bot))
              .thenAnswer((_) => Future.value(successResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchBotTransaction()),
        expect: () => {
              TransactionHistoryState(
                  botTransactionsResponse: BaseResponse.loading()),
              TransactionHistoryState(botTransactionsResponse: successResponse),
            });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching bot transaction history',
        build: () {
          when(transactionHistoryRepository
                  .fetchTransactionsHistory(TransactionHistoryType.bot))
              .thenAnswer((_) => Future.value(errorResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchBotTransaction()),
        expect: () => {
              TransactionHistoryState(
                  botTransactionsResponse: BaseResponse.loading()),
              TransactionHistoryState(botTransactionsResponse: errorResponse),
            });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.complete` WHEN '
        'fetching transfer transaction history',
        build: () {
          when(transactionHistoryRepository
                  .fetchTransactionsHistory(TransactionHistoryType.transfer))
              .thenAnswer((_) => Future.value(successResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchTransferTransaction()),
        expect: () => {
              TransactionHistoryState(
                  transferTransactionsResponse: BaseResponse.loading()),
              TransactionHistoryState(
                  transferTransactionsResponse: successResponse),
            });

    blocTest<TransactionHistoryBloc, TransactionHistoryState>(
        'emits `BaseResponse.error` WHEN '
        'failed fetching transfer transaction history',
        build: () {
          when(transactionHistoryRepository
                  .fetchTransactionsHistory(TransactionHistoryType.transfer))
              .thenAnswer((_) => Future.value(errorResponse));
          return transactionHistoryBloc;
        },
        act: (bloc) => bloc.add(FetchTransferTransaction()),
        expect: () => {
              TransactionHistoryState(
                  transferTransactionsResponse: BaseResponse.loading()),
              TransactionHistoryState(
                  transferTransactionsResponse: errorResponse),
            });

    tearDown(() => {transactionHistoryBloc.close()});
  });
}
