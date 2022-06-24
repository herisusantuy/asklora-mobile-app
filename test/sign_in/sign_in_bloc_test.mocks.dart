// Mocks generated by Mockito 5.2.0 from annotations
// in asklora_mobile_app/test/sign_in/sign_in_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_api_client.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_request.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/auth/sign_in/repository/sign_in_repository.dart'
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

class _FakeSignInResponse_0 extends _i1.Fake implements _i2.SignInResponse {}

class _FakeResponse_1<T> extends _i1.Fake implements _i3.Response<T> {}

/// A class which mocks [SignInRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInRepository extends _i1.Mock implements _i4.SignInRepository {
  MockSignInRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.SignInResponse> signIn({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(#signIn, [], {#email: email, #password: password}),
          returnValue:
              Future<_i2.SignInResponse>.value(_FakeSignInResponse_0())) as _i5
          .Future<_i2.SignInResponse>);
}

/// A class which mocks [SignInApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInApiClient extends _i1.Mock implements _i6.SignInApiClient {
  MockSignInApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response<dynamic>> signIn(_i7.SignInRequest? request) =>
      (super.noSuchMethod(Invocation.method(#signIn, [request]),
              returnValue: Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>()))
          as _i5.Future<_i3.Response<dynamic>>);
}
