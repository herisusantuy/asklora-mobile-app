// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/sign_out/sign_out_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/token/repository/repository.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/auth/sign_out/domain/sign_out_api_client.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/auth/sign_out/domain/sign_out_request.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/auth/sign_out/repository/sign_out_repository.dart'
    as _i3;
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

/// A class which mocks [SignOutRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignOutRepository extends _i1.Mock implements _i3.SignOutRepository {
  MockSignOutRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> signOut(String? token) => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [token],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [SignOutApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignOutApiClient extends _i1.Mock implements _i5.SignOutApiClient {
  MockSignOutApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response<dynamic>> signOut(_i6.SignOutRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [request],
        ),
        returnValue:
            _i4.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #signOut,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.Response<dynamic>>);
}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i7.Repository {
  MockRepository() {
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
  void saveResetPasswordToken(String? token) => super.noSuchMethod(
        Invocation.method(
          #saveResetPasswordToken,
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
  _i4.Future<String?> getResetPasswordToken() => (super.noSuchMethod(
        Invocation.method(
          #getResetPasswordToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
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
  _i4.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
