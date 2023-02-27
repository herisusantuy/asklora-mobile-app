// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/get_account/get_account_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:asklora_mobile_app/core/utils/storage/secure_storage.dart'
    as _i12;
import 'package:asklora_mobile_app/feature/user/account/domain/account_api_client.dart'
    as _i11;
import 'package:asklora_mobile_app/feature/user/account/domain/get_account/get_account_response.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/tax_info_request.dart'
    as _i10;
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/upgrade_account_request.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/user/account/repository/account_repository.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_result_request.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_result_response.dart'
    as _i4;
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_token_response.dart'
    as _i3;
import 'package:dio/dio.dart' as _i5;
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

class _FakeOnfidoTokenResponse_1 extends _i1.SmartFake
    implements _i3.OnfidoTokenResponse {
  _FakeOnfidoTokenResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOnfidoResultResponse_2 extends _i1.SmartFake
    implements _i4.OnfidoResultResponse {
  _FakeOnfidoResultResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3<T> extends _i1.SmartFake implements _i5.Response<T> {
  _FakeResponse_3(
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
class MockAccountRepository extends _i1.Mock implements _i6.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.GetAccountResponse> getAccount() => (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i7.Future<_i2.GetAccountResponse>.value(_FakeGetAccountResponse_0(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i7.Future<_i2.GetAccountResponse>);
  @override
  _i7.Future<bool> upgradeAccount(
          _i8.UpgradeAccountRequest? upgradeAccountRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #upgradeAccount,
          [upgradeAccountRequest],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<_i3.OnfidoTokenResponse> getOnfidoToken() => (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue: _i7.Future<_i3.OnfidoTokenResponse>.value(
            _FakeOnfidoTokenResponse_1(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i7.Future<_i3.OnfidoTokenResponse>);
  @override
  _i7.Future<_i4.OnfidoResultResponse> updateKycResult(
          _i9.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateKycResult,
          [request],
        ),
        returnValue: _i7.Future<_i4.OnfidoResultResponse>.value(
            _FakeOnfidoResultResponse_2(
          this,
          Invocation.method(
            #updateKycResult,
            [request],
          ),
        )),
      ) as _i7.Future<_i4.OnfidoResultResponse>);
  @override
  _i7.Future<bool> submitTaxInfo(_i10.TaxInfoRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitTaxInfo,
          [request],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [AccountApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountApiClient extends _i1.Mock implements _i11.AccountApiClient {
  MockAccountApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response<dynamic>> getAccount() => (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i7.Future<_i5.Response<dynamic>>.value(_FakeResponse_3<dynamic>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i7.Future<_i5.Response<dynamic>>);
  @override
  _i7.Future<_i5.Response<dynamic>> upgradeAccount(
          _i8.UpgradeAccountRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #upgradeAccount,
          [request],
        ),
        returnValue:
            _i7.Future<_i5.Response<dynamic>>.value(_FakeResponse_3<dynamic>(
          this,
          Invocation.method(
            #upgradeAccount,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.Response<dynamic>>);
  @override
  _i7.Future<_i5.Response<dynamic>> getOnfidoToken() => (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i7.Future<_i5.Response<dynamic>>.value(_FakeResponse_3<dynamic>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i7.Future<_i5.Response<dynamic>>);
  @override
  _i7.Future<_i5.Response<dynamic>> updateKycResult(
          _i9.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateKycResult,
          [request],
        ),
        returnValue:
            _i7.Future<_i5.Response<dynamic>>.value(_FakeResponse_3<dynamic>(
          this,
          Invocation.method(
            #updateKycResult,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.Response<dynamic>>);
  @override
  _i7.Future<_i5.Response<dynamic>> submitTaxInfo(
          _i10.TaxInfoRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitTaxInfo,
          [request],
        ),
        returnValue:
            _i7.Future<_i5.Response<dynamic>>.value(_FakeResponse_3<dynamic>(
          this,
          Invocation.method(
            #submitTaxInfo,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.Response<dynamic>>);
}

/// A class which mocks [SecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorage extends _i1.Mock implements _i12.SecureStorage {
  MockSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<void> writeData(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i7.Future<String?>.value(),
      ) as _i7.Future<String?>);
  @override
  _i7.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i7.Future<int?>.value(),
      ) as _i7.Future<int?>);
  @override
  _i7.Future<void> writeIntData(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeIntData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}
