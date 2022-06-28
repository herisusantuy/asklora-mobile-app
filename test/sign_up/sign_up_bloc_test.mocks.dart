// Mocks generated by Mockito 5.2.0 from annotations
// in asklora_mobile_app/test/sign_up/sign_up_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:asklora_mobile_app/feature/auth/sign_up/domain/response.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/sign_up_api_client.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/sign_up_request.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/auth/sign_up/repository/sign_up_repository.dart'
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

class _FakeSignUpResponse_0 extends _i1.Fake implements _i2.SignUpResponse {}

class _FakeResponse_1<T> extends _i1.Fake implements _i3.Response<T> {}

/// A class which mocks [SignUpRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignUpRepository extends _i1.Mock implements _i4.SignUpRepository {
  MockSignUpRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.SignUpResponse> signUp({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(#signUp, [], {#email: email, #password: password}),
          returnValue:
              Future<_i2.SignUpResponse>.value(_FakeSignUpResponse_0())) as _i5
          .Future<_i2.SignUpResponse>);
}

/// A class which mocks [SignUpApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignUpApiClient extends _i1.Mock implements _i6.SignUpApiClient {
  MockSignUpApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response<dynamic>> signUp(_i7.SignUpRequest? request) =>
      (super.noSuchMethod(Invocation.method(#signUp, [request]),
              returnValue: Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>()))
          as _i5.Future<_i3.Response<dynamic>>);
}
