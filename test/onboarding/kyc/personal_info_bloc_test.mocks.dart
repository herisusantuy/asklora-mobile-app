// Mocks generated by Mockito 5.4.0 from annotations
// in asklora_mobile_app/test/onboarding/kyc/personal_info_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/account_api_client.dart'
    as _i14;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/get_account/get_account_response.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_result_request.dart'
    as _i13;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_result_response.dart'
    as _i12;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_token_response.dart'
    as _i11;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/personal_info_request.dart'
    as _i10;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/personal_info_response.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_request.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_response.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/account_repository.dart'
    as _i4;
import 'package:dio/dio.dart' as _i3;
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

class _FakeResponse_1<T> extends _i1.SmartFake implements _i3.Response<T> {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i4.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BaseResponse<_i6.GetAccountResponse>> getAccount() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue: _i5.Future<_i2.BaseResponse<_i6.GetAccountResponse>>.value(
            _FakeBaseResponse_0<_i6.GetAccountResponse>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i6.GetAccountResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i6.GetAccountResponse>> getLocalAccount() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocalAccount,
          [],
        ),
        returnValue: _i5.Future<_i2.BaseResponse<_i6.GetAccountResponse>>.value(
            _FakeBaseResponse_0<_i6.GetAccountResponse>(
          this,
          Invocation.method(
            #getLocalAccount,
            [],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i6.GetAccountResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i7.UpgradeAccountResponse>> submitIBKR(
          _i8.UpgradeAccountRequest? upgradeAccountRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitIBKR,
          [upgradeAccountRequest],
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i7.UpgradeAccountResponse>>.value(
                _FakeBaseResponse_0<_i7.UpgradeAccountResponse>(
          this,
          Invocation.method(
            #submitIBKR,
            [upgradeAccountRequest],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i7.UpgradeAccountResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i9.PersonalInfoResponse>> submitPersonalInfo(
          {required _i10.PersonalInfoRequest? personalInfoRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitPersonalInfo,
          [],
          {#personalInfoRequest: personalInfoRequest},
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i9.PersonalInfoResponse>>.value(
                _FakeBaseResponse_0<_i9.PersonalInfoResponse>(
          this,
          Invocation.method(
            #submitPersonalInfo,
            [],
            {#personalInfoRequest: personalInfoRequest},
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i9.PersonalInfoResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i11.OnfidoTokenResponse>> getOnfidoToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i11.OnfidoTokenResponse>>.value(
                _FakeBaseResponse_0<_i11.OnfidoTokenResponse>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i11.OnfidoTokenResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i12.OnfidoResultResponse>> submitOnfidoOutcome(
          _i13.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitOnfidoOutcome,
          [request],
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i12.OnfidoResultResponse>>.value(
                _FakeBaseResponse_0<_i12.OnfidoResultResponse>(
          this,
          Invocation.method(
            #submitOnfidoOutcome,
            [request],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i12.OnfidoResultResponse>>);
}

/// A class which mocks [AccountApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountApiClient extends _i1.Mock implements _i14.AccountApiClient {
  MockAccountApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response<dynamic>> getAccount() => (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> submitIBKR(
          _i8.UpgradeAccountRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitIBKR,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #submitIBKR,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> submitPersonalInfo(
          _i10.PersonalInfoRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitPersonalInfo,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #submitPersonalInfo,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> getOnfidoToken() => (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> submitOnfidoOutcome(
          _i13.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitOnfidoOutcome,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #submitOnfidoOutcome,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
}
