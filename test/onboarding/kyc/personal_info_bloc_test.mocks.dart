// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/onboarding/kyc/personal_info_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i3;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/get_account/get_account_response.dart'
    as _i2;
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
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/tax_info_request.dart'
    as _i14;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_request.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_response.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/account_repository.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/user/account/domain/account_api_client.dart'
    as _i15;
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/tax_info_request.dart'
    as _i18;
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/upgrade_account_request.dart'
    as _i16;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_result_request.dart'
    as _i17;
import 'package:dio/dio.dart' as _i4;
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

class _FakeGetAccountResponse_0 extends _i1.SmartFake
    implements _i2.GetAccountResponse {
  _FakeGetAccountResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseResponse_1<T> extends _i1.SmartFake
    implements _i3.BaseResponse<T> {
  _FakeBaseResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2<T> extends _i1.SmartFake implements _i4.Response<T> {
  _FakeResponse_2(
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
class MockAccountRepository extends _i1.Mock implements _i5.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.GetAccountResponse> getAccount() => (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i6.Future<_i2.GetAccountResponse>.value(_FakeGetAccountResponse_0(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i6.Future<_i2.GetAccountResponse>);
  @override
  _i6.Future<_i3.BaseResponse<_i7.UpgradeAccountResponse>> upgradeAccount(
          _i8.UpgradeAccountRequest? upgradeAccountRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #upgradeAccount,
          [upgradeAccountRequest],
        ),
        returnValue:
            _i6.Future<_i3.BaseResponse<_i7.UpgradeAccountResponse>>.value(
                _FakeBaseResponse_1<_i7.UpgradeAccountResponse>(
          this,
          Invocation.method(
            #upgradeAccount,
            [upgradeAccountRequest],
          ),
        )),
      ) as _i6.Future<_i3.BaseResponse<_i7.UpgradeAccountResponse>>);
  @override
  _i6.Future<_i3.BaseResponse<_i9.PersonalInfoResponse>> submitPersonalInfo(
          {required _i10.PersonalInfoRequest? personalInfoRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitPersonalInfo,
          [],
          {#personalInfoRequest: personalInfoRequest},
        ),
        returnValue:
            _i6.Future<_i3.BaseResponse<_i9.PersonalInfoResponse>>.value(
                _FakeBaseResponse_1<_i9.PersonalInfoResponse>(
          this,
          Invocation.method(
            #submitPersonalInfo,
            [],
            {#personalInfoRequest: personalInfoRequest},
          ),
        )),
      ) as _i6.Future<_i3.BaseResponse<_i9.PersonalInfoResponse>>);
  @override
  _i6.Future<_i3.BaseResponse<_i11.OnfidoTokenResponse>> getOnfidoToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i6.Future<_i3.BaseResponse<_i11.OnfidoTokenResponse>>.value(
                _FakeBaseResponse_1<_i11.OnfidoTokenResponse>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i6.Future<_i3.BaseResponse<_i11.OnfidoTokenResponse>>);
  @override
  _i6.Future<_i3.BaseResponse<_i12.OnfidoResultResponse>> updateKycResult(
          _i13.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateKycResult,
          [request],
        ),
        returnValue:
            _i6.Future<_i3.BaseResponse<_i12.OnfidoResultResponse>>.value(
                _FakeBaseResponse_1<_i12.OnfidoResultResponse>(
          this,
          Invocation.method(
            #updateKycResult,
            [request],
          ),
        )),
      ) as _i6.Future<_i3.BaseResponse<_i12.OnfidoResultResponse>>);
  @override
  _i6.Future<bool> submitTaxInfo(_i14.TaxInfoRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitTaxInfo,
          [request],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [AccountApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountApiClient extends _i1.Mock implements _i15.AccountApiClient {
  MockAccountApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response<dynamic>> getAccount() => (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);
  @override
  _i6.Future<_i4.Response<dynamic>> upgradeAccount(
          _i16.UpgradeAccountRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #upgradeAccount,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #upgradeAccount,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);
  @override
  _i6.Future<_i4.Response<dynamic>> getOnfidoToken() => (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);
  @override
  _i6.Future<_i4.Response<dynamic>> updateKycResult(
          _i17.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateKycResult,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #updateKycResult,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);
  @override
  _i6.Future<_i4.Response<dynamic>> submitTaxInfo(
          _i18.TaxInfoRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitTaxInfo,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #submitTaxInfo,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);
}
