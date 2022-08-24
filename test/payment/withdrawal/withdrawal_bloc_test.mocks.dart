// Mocks generated by Mockito 5.3.0 from annotations
// in asklora_mobile_app/test/payment/withdrawal/withdrawal_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/payment/withdrawal/domain/withdrawal_request.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/payment/withdrawal/domain/withdrawal_response.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/payment/withdrawal/repository/withdrawal_repository.dart'
    as _i3;
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
  _FakeBaseResponse_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [WithdrawalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWithdrawalRepository extends _i1.Mock
    implements _i3.WithdrawalRepository {
  MockWithdrawalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse<_i5.WithdrawalResponse>> submitWithdrawal(
          {_i6.WithdrawalRequest? withdrawalRequest}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #submitWithdrawal, [], {#withdrawalRequest: withdrawalRequest}),
              returnValue: _i4.Future<_i2.BaseResponse<_i5.WithdrawalResponse>>.value(
                  _FakeBaseResponse_0<_i5.WithdrawalResponse>(
                      this, Invocation.method(#submitWithdrawal, [], {#withdrawalRequest: withdrawalRequest}))))
          as _i4.Future<_i2.BaseResponse<_i5.WithdrawalResponse>>);
}
