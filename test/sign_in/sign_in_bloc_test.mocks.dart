// Mocks generated by Mockito 5.4.1 from annotations
// in asklora_mobile_app/test/sign_in/sign_in_bloc_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:asklora_mobile_app/app/bloc/app_bloc.dart' as _i16;
import 'package:asklora_mobile_app/app/domain/user_journey_response.dart'
    as _i15;
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart'
    as _i14;
import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/core/domain/otp/get_otp_request.dart'
    as _i10;
import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart'
    as _i17;
import 'package:asklora_mobile_app/feature/auth/forgot_password/domain/forgot_password_response.dart'
    as _i12;
import 'package:asklora_mobile_app/feature/auth/repository/auth_repository.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/auth/reset_password/domain/reset_password_response.dart'
    as _i11;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/response.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/get_account/get_account_response.dart'
    as _i19;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_result_request.dart'
    as _i26;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_result_response.dart'
    as _i25;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_token_response.dart'
    as _i24;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/personal_info_request.dart'
    as _i23;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/personal_info_response.dart'
    as _i22;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_request.dart'
    as _i21;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_response.dart'
    as _i20;
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/account_repository.dart'
    as _i18;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response_request.dart'
    as _i28;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/bot_recommendation_repository.dart'
    as _i4;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_response_repository.dart'
    as _i27;
import 'package:asklora_mobile_app/feature/settings/domain/change_password/change_password_response.dart'
    as _i13;
import 'package:dio/dio.dart' as _i6;
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

class _FakeBotRecommendationRepository_2 extends _i1.SmartFake
    implements _i4.BotRecommendationRepository {
  _FakeBotRecommendationRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePpiUserResponse_3 extends _i1.SmartFake
    implements _i5.PpiUserResponse {
  _FakePpiUserResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4<T> extends _i1.SmartFake implements _i6.Response<T> {
  _FakeResponse_4(
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
class MockAuthRepository extends _i1.Mock implements _i7.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.BaseResponse<_i9.SignUpResponse>> signUp({
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
        returnValue: _i8.Future<_i2.BaseResponse<_i9.SignUpResponse>>.value(
            _FakeBaseResponse_0<_i9.SignUpResponse>(
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
      ) as _i8.Future<_i2.BaseResponse<_i9.SignUpResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i9.GetOtpResponse>> getVerificationEmail(
          {required _i10.GetOtpRequest? getVerificationEmailRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getVerificationEmail,
          [],
          {#getVerificationEmailRequest: getVerificationEmailRequest},
        ),
        returnValue: _i8.Future<_i2.BaseResponse<_i9.GetOtpResponse>>.value(
            _FakeBaseResponse_0<_i9.GetOtpResponse>(
          this,
          Invocation.method(
            #getVerificationEmail,
            [],
            {#getVerificationEmailRequest: getVerificationEmailRequest},
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i9.GetOtpResponse>>);
  @override
  _i8.Future<bool> signOut(String? token) => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [token],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i3.SignInResponse> signIn({
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
        returnValue: _i8.Future<_i3.SignInResponse>.value(_FakeSignInResponse_1(
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
      ) as _i8.Future<_i3.SignInResponse>);
  @override
  _i8.Future<_i3.SignInResponse> signInWithOtp({
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
        returnValue: _i8.Future<_i3.SignInResponse>.value(_FakeSignInResponse_1(
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
      ) as _i8.Future<_i3.SignInResponse>);
  @override
  void removeStorageOnSignInFailed() => super.noSuchMethod(
        Invocation.method(
          #removeStorageOnSignInFailed,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i2.BaseResponse<_i11.ResetPasswordResponse>> resetPassword({
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
            _i8.Future<_i2.BaseResponse<_i11.ResetPasswordResponse>>.value(
                _FakeBaseResponse_0<_i11.ResetPasswordResponse>(
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
      ) as _i8.Future<_i2.BaseResponse<_i11.ResetPasswordResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i12.ForgotPasswordResponse>> forgotPassword(
          {required String? email}) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [],
          {#email: email},
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i12.ForgotPasswordResponse>>.value(
                _FakeBaseResponse_0<_i12.ForgotPasswordResponse>(
          this,
          Invocation.method(
            #forgotPassword,
            [],
            {#email: email},
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i12.ForgotPasswordResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i13.ChangePasswordResponse>> changePassword({
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
            _i8.Future<_i2.BaseResponse<_i13.ChangePasswordResponse>>.value(
                _FakeBaseResponse_0<_i13.ChangePasswordResponse>(
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
      ) as _i8.Future<_i2.BaseResponse<_i13.ChangePasswordResponse>>);
}

/// A class which mocks [UserJourneyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserJourneyRepository extends _i1.Mock
    implements _i14.UserJourneyRepository {
  MockUserJourneyRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.BaseResponse<_i15.UserJourneyResponse>> saveUserJourney({
    required _i16.UserJourney? userJourney,
    String? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserJourney,
          [],
          {
            #userJourney: userJourney,
            #data: data,
          },
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i15.UserJourneyResponse>>.value(
                _FakeBaseResponse_0<_i15.UserJourneyResponse>(
          this,
          Invocation.method(
            #saveUserJourney,
            [],
            {
              #userJourney: userJourney,
              #data: data,
            },
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i15.UserJourneyResponse>>);
  @override
  void saveUserJourneyToLocal({
    _i16.UserJourney? userJourney,
    String? data,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #saveUserJourneyToLocal,
          [],
          {
            #userJourney: userJourney,
            #data: data,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i16.UserJourney?> getUserJourneyFromLocal() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserJourneyFromLocal,
          [],
        ),
        returnValue: _i8.Future<_i16.UserJourney?>.value(),
      ) as _i8.Future<_i16.UserJourney?>);
  @override
  _i8.Future<_i16.UserJourney?> getUserJourney() => (super.noSuchMethod(
        Invocation.method(
          #getUserJourney,
          [],
        ),
        returnValue: _i8.Future<_i16.UserJourney?>.value(),
      ) as _i8.Future<_i16.UserJourney?>);
  @override
  _i8.Future<_i2.BaseResponse<_i15.UserJourneyResponse>>
      getUserJourneyWithData() => (super.noSuchMethod(
            Invocation.method(
              #getUserJourneyWithData,
              [],
            ),
            returnValue:
                _i8.Future<_i2.BaseResponse<_i15.UserJourneyResponse>>.value(
                    _FakeBaseResponse_0<_i15.UserJourneyResponse>(
              this,
              Invocation.method(
                #getUserJourneyWithData,
                [],
              ),
            )),
          ) as _i8.Future<_i2.BaseResponse<_i15.UserJourneyResponse>>);
}

/// A class which mocks [SharedPreference].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreference extends _i1.Mock implements _i17.SharedPreference {
  MockSharedPreference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
  @override
  _i8.Future<bool?> readBoolData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readBoolData,
          [key],
        ),
        returnValue: _i8.Future<bool?>.value(),
      ) as _i8.Future<bool?>);
  @override
  _i8.Future<bool> writeData(
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
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<bool> writeBoolData(
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
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<bool> writeIntData(
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
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i8.Future<int?>.value(),
      ) as _i8.Future<int?>);
  @override
  _i8.Future<bool> containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<void> deleteAllDataExcept(List<String>? keys) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAllDataExcept,
          [keys],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i18.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.BaseResponse<_i19.GetAccountResponse>> getAccount() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i19.GetAccountResponse>>.value(
                _FakeBaseResponse_0<_i19.GetAccountResponse>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i19.GetAccountResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i19.GetAccountResponse>> getLocalAccount() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocalAccount,
          [],
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i19.GetAccountResponse>>.value(
                _FakeBaseResponse_0<_i19.GetAccountResponse>(
          this,
          Invocation.method(
            #getLocalAccount,
            [],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i19.GetAccountResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i20.UpgradeAccountResponse>> submitIBKR(
          _i21.UpgradeAccountRequest? upgradeAccountRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitIBKR,
          [upgradeAccountRequest],
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i20.UpgradeAccountResponse>>.value(
                _FakeBaseResponse_0<_i20.UpgradeAccountResponse>(
          this,
          Invocation.method(
            #submitIBKR,
            [upgradeAccountRequest],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i20.UpgradeAccountResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i22.PersonalInfoResponse>> submitPersonalInfo(
          {required _i23.PersonalInfoRequest? personalInfoRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitPersonalInfo,
          [],
          {#personalInfoRequest: personalInfoRequest},
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i22.PersonalInfoResponse>>.value(
                _FakeBaseResponse_0<_i22.PersonalInfoResponse>(
          this,
          Invocation.method(
            #submitPersonalInfo,
            [],
            {#personalInfoRequest: personalInfoRequest},
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i22.PersonalInfoResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i24.OnfidoTokenResponse>> getOnfidoToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i24.OnfidoTokenResponse>>.value(
                _FakeBaseResponse_0<_i24.OnfidoTokenResponse>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i24.OnfidoTokenResponse>>);
  @override
  _i8.Future<_i2.BaseResponse<_i25.OnfidoResultResponse>> submitOnfidoOutcome(
          _i26.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitOnfidoOutcome,
          [request],
        ),
        returnValue:
            _i8.Future<_i2.BaseResponse<_i25.OnfidoResultResponse>>.value(
                _FakeBaseResponse_0<_i25.OnfidoResultResponse>(
          this,
          Invocation.method(
            #submitOnfidoOutcome,
            [request],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i25.OnfidoResultResponse>>);
}

/// A class which mocks [PpiResponseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPpiResponseRepository extends _i1.Mock
    implements _i27.PpiResponseRepository {
  MockPpiResponseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.BotRecommendationRepository get botRecommendationRepository =>
      (super.noSuchMethod(
        Invocation.getter(#botRecommendationRepository),
        returnValue: _FakeBotRecommendationRepository_2(
          this,
          Invocation.getter(#botRecommendationRepository),
        ),
      ) as _i4.BotRecommendationRepository);
  @override
  _i8.Future<_i5.PpiUserResponse> addAnswer(
          _i28.PpiSelectionRequest? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i8.Future<_i5.PpiUserResponse>.value(_FakePpiUserResponse_3(
          this,
          Invocation.method(
            #addAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i8.Future<_i5.PpiUserResponse>);
  @override
  _i8.Future<_i5.PpiUserResponse> addBulkAnswer(
          List<_i28.PpiSelectionRequest>? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBulkAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i8.Future<_i5.PpiUserResponse>.value(_FakePpiUserResponse_3(
          this,
          Invocation.method(
            #addBulkAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i8.Future<_i5.PpiUserResponse>);
  @override
  _i8.Future<_i2.BaseResponse<_i5.SnapShot>> getUserSnapShotUserId(
          dynamic userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapShotUserId,
          [userId],
        ),
        returnValue: _i8.Future<_i2.BaseResponse<_i5.SnapShot>>.value(
            _FakeBaseResponse_0<_i5.SnapShot>(
          this,
          Invocation.method(
            #getUserSnapShotUserId,
            [userId],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i5.SnapShot>>);
  @override
  _i8.Future<void> saveUserSnapShotToLocal(_i5.SnapShot? snapshot) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserSnapShotToLocal,
          [snapshot],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<_i5.SnapShot?> getUserSnapShotFromLocal(
          {bool? forceToFetch = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapShotFromLocal,
          [],
          {#forceToFetch: forceToFetch},
        ),
        returnValue: _i8.Future<_i5.SnapShot?>.value(),
      ) as _i8.Future<_i5.SnapShot?>);
  @override
  _i8.Future<_i2.BaseResponse<_i5.SnapShot>> getUserSnapshotByAskloraId(
          int? askloraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapshotByAskloraId,
          [askloraId],
        ),
        returnValue: _i8.Future<_i2.BaseResponse<_i5.SnapShot>>.value(
            _FakeBaseResponse_0<_i5.SnapShot>(
          this,
          Invocation.method(
            #getUserSnapshotByAskloraId,
            [askloraId],
          ),
        )),
      ) as _i8.Future<_i2.BaseResponse<_i5.SnapShot>>);
  @override
  _i8.Future<_i6.Response<dynamic>> linkUser(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkUser,
          [userId],
        ),
        returnValue:
            _i8.Future<_i6.Response<dynamic>>.value(_FakeResponse_4<dynamic>(
          this,
          Invocation.method(
            #linkUser,
            [userId],
          ),
        )),
      ) as _i8.Future<_i6.Response<dynamic>>);
}
