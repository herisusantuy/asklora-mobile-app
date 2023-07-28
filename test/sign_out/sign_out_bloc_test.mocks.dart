// Mocks generated by Mockito 5.4.1 from annotations
// in asklora_mobile_app/test/sign_out/sign_out_bloc_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/core/domain/otp/get_otp_request.dart' as _i7;
import 'package:asklora_mobile_app/core/domain/token/repository/repository.dart'
    as _i11;
import 'package:asklora_mobile_app/core/utils/storage/secure_storage.dart'
    as _i13;
import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart'
    as _i12;
import 'package:asklora_mobile_app/feature/auth/forgot_password/domain/forgot_password_response.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/auth/repository/auth_repository.dart'
    as _i4;
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_response.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/response.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/settings/domain/change_password/change_password_response.dart'
    as _i10;
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

class _FakeSignInResponse_1 extends _i1.SmartFake
    implements _i3.SignInResponse {
  _FakeSignInResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i4.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BaseResponse<_i6.SignUpResponse>> signUp({
    required String? email,
    required String? password,
    required String? username,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
          {
            #email: email,
            #password: password,
            #username: username,
          },
        ),
        returnValue: _i5.Future<_i2.BaseResponse<_i6.SignUpResponse>>.value(
            _FakeBaseResponse_0<_i6.SignUpResponse>(
          this,
          Invocation.method(
            #signUp,
            [],
            {
              #email: email,
              #password: password,
              #username: username,
            },
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i6.SignUpResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>> getVerificationEmail(
          {required _i7.GetOtpRequest? getVerificationEmailRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getVerificationEmail,
          [],
          {#getVerificationEmailRequest: getVerificationEmailRequest},
        ),
        returnValue: _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>>.value(
            _FakeBaseResponse_0<_i6.GetOtpResponse>(
          this,
          Invocation.method(
            #getVerificationEmail,
            [],
            {#getVerificationEmailRequest: getVerificationEmailRequest},
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i6.GetOtpResponse>>);
  @override
  _i5.Future<bool> signOut(String? token) => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [token],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<_i3.SignInResponse> signIn({
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
        returnValue: _i5.Future<_i3.SignInResponse>.value(_FakeSignInResponse_1(
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
      ) as _i5.Future<_i3.SignInResponse>);
  @override
  _i5.Future<_i3.SignInResponse> signInWithOtp({
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
        returnValue: _i5.Future<_i3.SignInResponse>.value(_FakeSignInResponse_1(
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
      ) as _i5.Future<_i3.SignInResponse>);
  @override
  void removeStorageOnSignInFailed() => super.noSuchMethod(
        Invocation.method(
          #removeStorageOnSignInFailed,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<_i2.BaseResponse<_i8.ResetPasswordResponse>> resetPassword({
    required String? token,
    required String? password,
    required String? confirmPassword,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [],
          {
            #token: token,
            #password: password,
            #confirmPassword: confirmPassword,
          },
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i8.ResetPasswordResponse>>.value(
                _FakeBaseResponse_0<_i8.ResetPasswordResponse>(
          this,
          Invocation.method(
            #resetPassword,
            [],
            {
              #token: token,
              #password: password,
              #confirmPassword: confirmPassword,
            },
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i8.ResetPasswordResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i9.ForgotPasswordResponse>> forgotPassword(
          {required String? email}) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [],
          {#email: email},
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i9.ForgotPasswordResponse>>.value(
                _FakeBaseResponse_0<_i9.ForgotPasswordResponse>(
          this,
          Invocation.method(
            #forgotPassword,
            [],
            {#email: email},
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i9.ForgotPasswordResponse>>);
  @override
  _i5.Future<_i2.BaseResponse<_i10.ChangePasswordResponse>> changePassword({
    required String? password,
    required String? newPassword,
    required String? confirmNewPassword,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [],
          {
            #password: password,
            #newPassword: newPassword,
            #confirmNewPassword: confirmNewPassword,
          },
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<_i10.ChangePasswordResponse>>.value(
                _FakeBaseResponse_0<_i10.ChangePasswordResponse>(
          this,
          Invocation.method(
            #changePassword,
            [],
            {
              #password: password,
              #newPassword: newPassword,
              #confirmNewPassword: confirmNewPassword,
            },
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<_i10.ChangePasswordResponse>>);
}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i11.Repository {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> saveAccessToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [token],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveRefreshToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveRefreshToken,
          [token],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<bool> isTokenValid() => (super.noSuchMethod(
        Invocation.method(
          #isTokenValid,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> refreshToken() => (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [SharedPreference].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreference extends _i1.Mock implements _i12.SharedPreference {
  MockSharedPreference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<bool?> readBoolData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readBoolData,
          [key],
        ),
        returnValue: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);
  @override
  _i5.Future<bool> writeData(
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
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> writeBoolData(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeBoolData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> writeIntData(
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
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i5.Future<int?>.value(),
      ) as _i5.Future<int?>);
  @override
  _i5.Future<bool> containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> deleteAllDataExcept(List<String>? keys) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAllDataExcept,
          [keys],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [SecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorage extends _i1.Mock implements _i13.SecureStorage {
  MockSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> writeData(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i5.Future<int?>.value(),
      ) as _i5.Future<int?>);
  @override
  _i5.Future<void> writeIntData(
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool?> readBoolData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readBoolData,
          [key],
        ),
        returnValue: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);
  @override
  _i5.Future<void> writeBoolData(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeBoolData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool> containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
