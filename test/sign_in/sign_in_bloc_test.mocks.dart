// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/sign_in/sign_in_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_api_client.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_request.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_with_otp_request.dart'
    as _i9;
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

/// A class which mocks [SignInRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInRepository extends _i1.Mock implements _i4.SignInRepository {
  MockSignInRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BaseResponse<_i6.SignInResponse>> signIn({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<_i2.BaseResponse<_i6.SignInResponse>>.value(
            _FakeBaseResponse_0<_i6.SignInResponse>(
          this,
          Invocation.method(
            #signIn,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i6.SignInResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i6.SignInResponse>> signInWithOtp({
    required String? otp,
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithOtp,
          [],
          {
            #otp: otp,
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<_i2.BaseResponse<_i6.SignInResponse>>.value(
            _FakeBaseResponse_0<_i6.SignInResponse>(
          this,
          Invocation.method(
            #signInWithOtp,
            [],
            {
              #otp: otp,
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i6.SignInResponse>>);
}

/// A class which mocks [SignInApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInApiClient extends _i1.Mock implements _i7.SignInApiClient {
  MockSignInApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response<dynamic>> signIn(_i8.SignInRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #signIn,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> signInWithOtp(
          _i9.SignInWithOtpRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithOtp,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #signInWithOtp,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
}
