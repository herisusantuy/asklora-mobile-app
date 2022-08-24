// Mocks generated by Mockito 5.3.0 from annotations
// in asklora_mobile_app/test/otp/otp_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/core/domain/otp/get_otp_client.dart' as _i9;
import 'package:asklora_mobile_app/core/domain/otp/get_otp_request.dart' as _i7;
import 'package:asklora_mobile_app/core/domain/otp/verify_otp_request.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/auth/otp/repository/otp_repository.dart'
    as _i4;
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/response.dart'
    as _i6;
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
  _FakeBaseResponse_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeResponse_1<T> extends _i1.SmartFake implements _i3.Response<T> {
  _FakeResponse_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [OtpRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOtpRepository extends _i1.Mock implements _i4.OtpRepository {
  MockOtpRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>> getOtp(
          {_i7.GetOtpRequest? getOtpRequest}) =>
      (super.noSuchMethod(
              Invocation.method(#getOtp, [], {#getOtpRequest: getOtpRequest}),
              returnValue: _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>>.value(
                  _FakeBaseResponse_0<_i6.GetOtpResponse>(
                      this,
                      Invocation.method(
                          #getOtp, [], {#getOtpRequest: getOtpRequest}))))
          as _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>> verifyOtp(
          {_i8.VerifyOtpRequest? verifyOtpRequest}) =>
      (super.noSuchMethod(Invocation.method(#verifyOtp, [], {#verifyOtpRequest: verifyOtpRequest}),
              returnValue: _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>>.value(
                  _FakeBaseResponse_0<_i6.GetOtpResponse>(
                      this,
                      Invocation.method(
                          #verifyOtp, [], {#verifyOtpRequest: verifyOtpRequest}))))
          as _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>>);
}

/// A class which mocks [GetOtpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetOtpClient extends _i1.Mock implements _i9.GetOtpClient {
  MockGetOtpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response<dynamic>> getOtp(_i7.GetOtpRequest? getOtpRequest) =>
      (super.noSuchMethod(Invocation.method(#getOtp, [getOtpRequest]),
              returnValue: _i5.Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>(
                      this, Invocation.method(#getOtp, [getOtpRequest]))))
          as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> verifyOtp(
          _i8.VerifyOtpRequest? verifyOtpRequest) =>
      (super.noSuchMethod(Invocation.method(#verifyOtp, [verifyOtpRequest]),
              returnValue: _i5.Future<_i3.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>(
                      this, Invocation.method(#verifyOtp, [verifyOtpRequest]))))
          as _i5.Future<_i3.Response<dynamic>>);
}
