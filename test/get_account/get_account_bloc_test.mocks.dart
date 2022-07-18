// Mocks generated by Mockito 5.2.0 from annotations
// in asklora_mobile_app/test/get_account/get_account_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:asklora_mobile_app/feature/user/account/domain/account_api_client.dart'
    as _i11;
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/get_account_response.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/tax_info_request.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/upgrade_account_request.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/user/account/repository/account_repository.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_result_request.dart'
    as _i10;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_result_response.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_token_response.dart'
    as _i4;
import 'package:dio/dio.dart' as _i7;
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

class _FakeGetAccountResponse_0 extends _i1.Fake
    implements _i2.GetAccountResponse {}

class _FakeUpgradeAccountRequest_1 extends _i1.Fake
    implements _i3.UpgradeAccountRequest {}

class _FakeOnfidoTokenResponse_2 extends _i1.Fake
    implements _i4.OnfidoTokenResponse {}

class _FakeOnfidoResultResponse_3 extends _i1.Fake
    implements _i5.OnfidoResultResponse {}

class _FakeTaxInfoRequest_4 extends _i1.Fake implements _i6.TaxInfoRequest {}

class _FakeResponse_5<T> extends _i1.Fake implements _i7.Response<T> {}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i8.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.GetAccountResponse> getAccount() => (super.noSuchMethod(
          Invocation.method(#getAccount, []),
          returnValue:
              Future<_i2.GetAccountResponse>.value(_FakeGetAccountResponse_0()))
      as _i9.Future<_i2.GetAccountResponse>);
  @override
  _i9.Future<_i3.UpgradeAccountRequest> upgradeAccount(
          _i3.UpgradeAccountRequest? upgradeAccountRequest) =>
      (super.noSuchMethod(
              Invocation.method(#upgradeAccount, [upgradeAccountRequest]),
              returnValue: Future<_i3.UpgradeAccountRequest>.value(
                  _FakeUpgradeAccountRequest_1()))
          as _i9.Future<_i3.UpgradeAccountRequest>);
  @override
  _i9.Future<_i4.OnfidoTokenResponse> getOnfidoToken() =>
      (super.noSuchMethod(Invocation.method(#getOnfidoToken, []),
              returnValue: Future<_i4.OnfidoTokenResponse>.value(
                  _FakeOnfidoTokenResponse_2()))
          as _i9.Future<_i4.OnfidoTokenResponse>);
  @override
  _i9.Future<_i5.OnfidoResultResponse> updateKycResult(
          _i10.OnfidoResultRequest? request) =>
      (super.noSuchMethod(Invocation.method(#updateKycResult, [request]),
              returnValue: Future<_i5.OnfidoResultResponse>.value(
                  _FakeOnfidoResultResponse_3()))
          as _i9.Future<_i5.OnfidoResultResponse>);
  @override
  _i9.Future<_i6.TaxInfoRequest> submitTaxInfo(_i6.TaxInfoRequest? request) =>
      (super.noSuchMethod(Invocation.method(#submitTaxInfo, [request]),
              returnValue:
                  Future<_i6.TaxInfoRequest>.value(_FakeTaxInfoRequest_4()))
          as _i9.Future<_i6.TaxInfoRequest>);
}

/// A class which mocks [AccountApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountApiClient extends _i1.Mock implements _i11.AccountApiClient {
  MockAccountApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i7.Response<dynamic>> getAccount() => (super.noSuchMethod(
          Invocation.method(#getAccount, []),
          returnValue:
              Future<_i7.Response<dynamic>>.value(_FakeResponse_5<dynamic>()))
      as _i9.Future<_i7.Response<dynamic>>);
  @override
  _i9.Future<_i7.Response<dynamic>> upgradeAccount(
          _i3.UpgradeAccountRequest? request) =>
      (super.noSuchMethod(Invocation.method(#upgradeAccount, [request]),
              returnValue: Future<_i7.Response<dynamic>>.value(
                  _FakeResponse_5<dynamic>()))
          as _i9.Future<_i7.Response<dynamic>>);
  @override
  _i9.Future<_i7.Response<dynamic>> getOnfidoToken() => (super.noSuchMethod(
          Invocation.method(#getOnfidoToken, []),
          returnValue:
              Future<_i7.Response<dynamic>>.value(_FakeResponse_5<dynamic>()))
      as _i9.Future<_i7.Response<dynamic>>);
  @override
  _i9.Future<_i7.Response<dynamic>> updateKycResult(
          _i10.OnfidoResultRequest? request) =>
      (super.noSuchMethod(Invocation.method(#updateKycResult, [request]),
              returnValue: Future<_i7.Response<dynamic>>.value(
                  _FakeResponse_5<dynamic>()))
          as _i9.Future<_i7.Response<dynamic>>);
  @override
  _i9.Future<_i7.Response<dynamic>> submitTaxInfo(
          _i6.TaxInfoRequest? request) =>
      (super.noSuchMethod(Invocation.method(#submitTaxInfo, [request]),
              returnValue: Future<_i7.Response<dynamic>>.value(
                  _FakeResponse_5<dynamic>()))
          as _i9.Future<_i7.Response<dynamic>>);
}
