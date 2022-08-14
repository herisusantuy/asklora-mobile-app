// Mocks generated by Mockito 5.2.0 from annotations
// in asklora_mobile_app/test/payment/deposits/select_bank/select_bank_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/payment/deposits/repository/bank_details_repository.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/domain/add_bank_account_request.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_details/domain/registered_bank_account.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_list/domain/bank_details.dart'
    as _i7;
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

class _FakeBaseResponse_0<T> extends _i1.Fake implements _i2.BaseResponse<T> {}

/// A class which mocks [BankDetailsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBankDetailsRepository extends _i1.Mock
    implements _i3.BankDetailsRepository {
  MockBankDetailsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse<_i5.AddBankAccountRequest>> addBankAccount(
          {_i5.AddBankAccountRequest? addBankAccountRequest}) =>
      (super.noSuchMethod(
              Invocation.method(#addBankAccount, [],
                  {#addBankAccountRequest: addBankAccountRequest}),
              returnValue:
                  Future<_i2.BaseResponse<_i5.AddBankAccountRequest>>.value(
                      _FakeBaseResponse_0<_i5.AddBankAccountRequest>()))
          as _i4.Future<_i2.BaseResponse<_i5.AddBankAccountRequest>>);
  @override
  _i4.Future<_i2.BaseResponse<_i6.RegisteredBankAccount>> getBankAccount() =>
      (super.noSuchMethod(Invocation.method(#getBankAccount, []),
              returnValue:
                  Future<_i2.BaseResponse<_i6.RegisteredBankAccount>>.value(
                      _FakeBaseResponse_0<_i6.RegisteredBankAccount>()))
          as _i4.Future<_i2.BaseResponse<_i6.RegisteredBankAccount>>);
  @override
  _i4.Future<List<_i7.BankDetails>> getBankDetails() => (super.noSuchMethod(
          Invocation.method(#getBankDetails, []),
          returnValue: Future<List<_i7.BankDetails>>.value(<_i7.BankDetails>[]))
      as _i4.Future<List<_i7.BankDetails>>);
}
