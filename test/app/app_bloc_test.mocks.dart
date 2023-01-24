// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/app/app_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/token/model/token_refresh_request.dart'
    as _i7;
import 'package:asklora_mobile_app/core/domain/token/model/token_verify_request.dart'
    as _i6;
import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart'
    as _i3;
import 'package:asklora_mobile_app/core/domain/token/token_api_client.dart'
    as _i5;
import 'package:dio/dio.dart' as _i2;
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

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TokenRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenRepository extends _i1.Mock implements _i3.TokenRepository {
  MockTokenRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void saveAccessToken(String? token) => super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [token],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void saveRefreshToken(String? token) => super.noSuchMethod(
        Invocation.method(
          #saveRefreshToken,
          [token],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<bool> isTokenValid() => (super.noSuchMethod(
        Invocation.method(
          #isTokenValid,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> refreshToken() => (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String?> getSignUpToken() => (super.noSuchMethod(
        Invocation.method(
          #getSignUpToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  void saveSignUpToken(String? token) => super.noSuchMethod(
        Invocation.method(
          #saveSignUpToken,
          [token],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TokenApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenApiClient extends _i1.Mock implements _i5.TokenApiClient {
  MockTokenApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response<dynamic>> verify(_i6.TokenVerifyRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #verify,
          [request],
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #verify,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
  @override
  _i4.Future<_i2.Response<dynamic>> refresh(_i7.TokenRefreshRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [request],
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #refresh,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
}
