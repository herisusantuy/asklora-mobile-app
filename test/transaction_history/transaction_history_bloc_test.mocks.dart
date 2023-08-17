// Mocks generated by Mockito 5.4.2 from annotations
// in asklora_mobile_app/test/transaction_history/transaction_history_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/core/domain/transaction/transaction_balance_response.dart'
    as _i7;
import 'package:asklora_mobile_app/core/domain/transaction/transaction_ledger_balance_response.dart'
    as _i8;
import 'package:asklora_mobile_app/core/repository/transaction_repository.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/balance/deposit/domain/deposit_response.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/balance/withdrawal/domain/withdrawal_request.dart'
    as _i12;
import 'package:asklora_mobile_app/feature/balance/withdrawal/domain/withdrawal_response.dart'
    as _i11;
import 'package:asklora_mobile_app/feature/transaction_history/bot_order/detail/domain/bot_detail_transaction_history_response.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/transaction_history/domain/grouped_transaction_model.dart'
    as _i5;
import 'package:file_picker/file_picker.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBaseResponse_0<T> extends _i1.SmartFake
    implements _i2.BaseResponse<T> {
  _FakeBaseResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TransactionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTransactionRepository extends _i1.Mock
    implements _i3.TransactionRepository {
  MockTransactionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse<List<_i5.GroupedTransactionModel>>>
      fetchAllTransactionsHistory() => (super.noSuchMethod(
            Invocation.method(
              #fetchAllTransactionsHistory,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<List<_i5.GroupedTransactionModel>>>.value(
                _FakeBaseResponse_0<List<_i5.GroupedTransactionModel>>(
              this,
              Invocation.method(
                #fetchAllTransactionsHistory,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i5.GroupedTransactionModel>>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i5.GroupedTransactionModel>>>
      fetchBotTransactionsHistory() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotTransactionsHistory,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<List<_i5.GroupedTransactionModel>>>.value(
                _FakeBaseResponse_0<List<_i5.GroupedTransactionModel>>(
              this,
              Invocation.method(
                #fetchBotTransactionsHistory,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i5.GroupedTransactionModel>>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i5.GroupedTransactionModel>>>
      fetchTransferTransactionsHistory() => (super.noSuchMethod(
            Invocation.method(
              #fetchTransferTransactionsHistory,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<List<_i5.GroupedTransactionModel>>>.value(
                _FakeBaseResponse_0<List<_i5.GroupedTransactionModel>>(
              this,
              Invocation.method(
                #fetchTransferTransactionsHistory,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i5.GroupedTransactionModel>>>);
  @override
  _i4.Future<_i2.BaseResponse<_i6.BotDetailTransactionHistoryResponse>>
      fetchBotTransactionsDetail(String? orderId) => (super.noSuchMethod(
            Invocation.method(
              #fetchBotTransactionsDetail,
              [orderId],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<
                        _i6.BotDetailTransactionHistoryResponse>>.value(
                _FakeBaseResponse_0<_i6.BotDetailTransactionHistoryResponse>(
              this,
              Invocation.method(
                #fetchBotTransactionsDetail,
                [orderId],
              ),
            )),
          ) as _i4.Future<
              _i2.BaseResponse<_i6.BotDetailTransactionHistoryResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i7.TransactionBalanceResponse>> fetchBalance() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchBalance,
          [],
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<_i7.TransactionBalanceResponse>>.value(
                _FakeBaseResponse_0<_i7.TransactionBalanceResponse>(
          this,
          Invocation.method(
            #fetchBalance,
            [],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i7.TransactionBalanceResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i8.TransactionLedgerBalanceResponse>>
      fetchLedgerBalance() => (super.noSuchMethod(
            Invocation.method(
              #fetchLedgerBalance,
              [],
            ),
            returnValue: _i4.Future<
                    _i2
                    .BaseResponse<_i8.TransactionLedgerBalanceResponse>>.value(
                _FakeBaseResponse_0<_i8.TransactionLedgerBalanceResponse>(
              this,
              Invocation.method(
                #fetchLedgerBalance,
                [],
              ),
            )),
          ) as _i4
              .Future<_i2.BaseResponse<_i8.TransactionLedgerBalanceResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i9.DepositResponse>> submitDeposit({
    required double? depositAmount,
    required List<_i10.PlatformFile>? platformFiles,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitDeposit,
          [],
          {
            #depositAmount: depositAmount,
            #platformFiles: platformFiles,
          },
        ),
        returnValue: _i4.Future<_i2.BaseResponse<_i9.DepositResponse>>.value(
            _FakeBaseResponse_0<_i9.DepositResponse>(
          this,
          Invocation.method(
            #submitDeposit,
            [],
            {
              #depositAmount: depositAmount,
              #platformFiles: platformFiles,
            },
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i9.DepositResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i11.WithdrawalResponse>> submitWithdrawal(
          {required _i12.WithdrawalRequest? withdrawalRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitWithdrawal,
          [],
          {#withdrawalRequest: withdrawalRequest},
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<_i11.WithdrawalResponse>>.value(
                _FakeBaseResponse_0<_i11.WithdrawalResponse>(
          this,
          Invocation.method(
            #submitWithdrawal,
            [],
            {#withdrawalRequest: withdrawalRequest},
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i11.WithdrawalResponse>>);
}
