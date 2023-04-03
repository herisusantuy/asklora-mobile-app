// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/sign_in/sign_in_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:asklora_mobile_app/app/bloc/app_bloc.dart' as _i12;
import 'package:asklora_mobile_app/app/domain/user_journey_response.dart'
    as _i11;
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart'
    as _i10;
import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i3;
import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart'
    as _i16;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_api_client.dart'
    as _i13;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_request.dart'
    as _i14;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_response.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/auth/sign_in/domain/sign_in_with_otp_request.dart'
    as _i15;
import 'package:asklora_mobile_app/feature/auth/sign_in/repository/sign_in_repository.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/get_account/get_account_response.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_result_request.dart'
    as _i24;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_result_response.dart'
    as _i23;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/onfido/onfido_token_response.dart'
    as _i22;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/personal_info_request.dart'
    as _i21;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/personal_info_response.dart'
    as _i20;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_request.dart'
    as _i19;
import 'package:asklora_mobile_app/feature/onboarding/kyc/domain/upgrade_account/upgrade_account_response.dart'
    as _i18;
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/account_repository.dart'
    as _i17;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response_request.dart'
    as _i26;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/bot_recommendation_repository.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_response_repository.dart'
    as _i25;
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

class _FakeSignInResponse_0 extends _i1.SmartFake
    implements _i2.SignInResponse {
  _FakeSignInResponse_0(
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

class _FakeGetAccountResponse_3 extends _i1.SmartFake
    implements _i5.GetAccountResponse {
  _FakeGetAccountResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBotRecommendationRepository_4 extends _i1.SmartFake
    implements _i6.BotRecommendationRepository {
  _FakeBotRecommendationRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePpiUserResponse_5 extends _i1.SmartFake
    implements _i7.PpiUserResponse {
  _FakePpiUserResponse_5(
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
class MockSignInRepository extends _i1.Mock implements _i8.SignInRepository {
  MockSignInRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.SignInResponse> signIn({
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
        returnValue: _i9.Future<_i2.SignInResponse>.value(_FakeSignInResponse_0(
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
      ) as _i9.Future<_i2.SignInResponse>);
  @override
  _i9.Future<_i2.SignInResponse> signInWithOtp({
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
        returnValue: _i9.Future<_i2.SignInResponse>.value(_FakeSignInResponse_0(
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
      ) as _i9.Future<_i2.SignInResponse>);
  @override
  void removeStorageOnSignInFailed() => super.noSuchMethod(
        Invocation.method(
          #removeStorageOnSignInFailed,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UserJourneyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserJourneyRepository extends _i1.Mock
    implements _i10.UserJourneyRepository {
  MockUserJourneyRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.BaseResponse<_i11.UserJourneyResponse>> saveUserJourney({
    required _i12.UserJourney? userJourney,
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
            _i9.Future<_i3.BaseResponse<_i11.UserJourneyResponse>>.value(
                _FakeBaseResponse_1<_i11.UserJourneyResponse>(
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
      ) as _i9.Future<_i3.BaseResponse<_i11.UserJourneyResponse>>);
  @override
  void saveUserJourneyToLocal({
    _i12.UserJourney? userJourney,
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
  _i9.Future<_i12.UserJourney?> getUserJourneyFromLocal() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserJourneyFromLocal,
          [],
        ),
        returnValue: _i9.Future<_i12.UserJourney?>.value(),
      ) as _i9.Future<_i12.UserJourney?>);
  @override
  _i9.Future<_i12.UserJourney?> getUserJourney() => (super.noSuchMethod(
        Invocation.method(
          #getUserJourney,
          [],
        ),
        returnValue: _i9.Future<_i12.UserJourney?>.value(),
      ) as _i9.Future<_i12.UserJourney?>);
  @override
  _i9.Future<_i3.BaseResponse<_i11.UserJourneyResponse>>
      getUserJourneyWithData() => (super.noSuchMethod(
            Invocation.method(
              #getUserJourneyWithData,
              [],
            ),
            returnValue:
                _i9.Future<_i3.BaseResponse<_i11.UserJourneyResponse>>.value(
                    _FakeBaseResponse_1<_i11.UserJourneyResponse>(
              this,
              Invocation.method(
                #getUserJourneyWithData,
                [],
              ),
            )),
          ) as _i9.Future<_i3.BaseResponse<_i11.UserJourneyResponse>>);
}

/// A class which mocks [SignInApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInApiClient extends _i1.Mock implements _i13.SignInApiClient {
  MockSignInApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i4.Response<dynamic>> signIn(_i14.SignInRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [request],
        ),
        returnValue:
            _i9.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #signIn,
            [request],
          ),
        )),
      ) as _i9.Future<_i4.Response<dynamic>>);
  @override
  _i9.Future<_i4.Response<dynamic>> signInWithOtp(
          _i15.SignInWithOtpRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithOtp,
          [request],
        ),
        returnValue:
            _i9.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #signInWithOtp,
            [request],
          ),
        )),
      ) as _i9.Future<_i4.Response<dynamic>>);
}

/// A class which mocks [SharedPreference].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreference extends _i1.Mock implements _i16.SharedPreference {
  MockSharedPreference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);
  @override
  _i9.Future<bool?> readBoolData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readBoolData,
          [key],
        ),
        returnValue: _i9.Future<bool?>.value(),
      ) as _i9.Future<bool?>);
  @override
  _i9.Future<bool> writeData(
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
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<bool> writeBoolData(
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
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<bool> writeIntData(
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
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
  @override
  _i9.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i9.Future<int?>.value(),
      ) as _i9.Future<int?>);
  @override
  _i9.Future<bool> containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i17.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i5.GetAccountResponse> getAccount() => (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i9.Future<_i5.GetAccountResponse>.value(_FakeGetAccountResponse_3(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i9.Future<_i5.GetAccountResponse>);
  @override
  _i9.Future<_i3.BaseResponse<_i18.UpgradeAccountResponse>> submitIBKR(
          _i19.UpgradeAccountRequest? upgradeAccountRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitIBKR,
          [upgradeAccountRequest],
        ),
        returnValue:
            _i9.Future<_i3.BaseResponse<_i18.UpgradeAccountResponse>>.value(
                _FakeBaseResponse_1<_i18.UpgradeAccountResponse>(
          this,
          Invocation.method(
            #submitIBKR,
            [upgradeAccountRequest],
          ),
        )),
      ) as _i9.Future<_i3.BaseResponse<_i18.UpgradeAccountResponse>>);
  @override
  _i9.Future<_i3.BaseResponse<_i20.PersonalInfoResponse>> submitPersonalInfo(
          {required _i21.PersonalInfoRequest? personalInfoRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitPersonalInfo,
          [],
          {#personalInfoRequest: personalInfoRequest},
        ),
        returnValue:
            _i9.Future<_i3.BaseResponse<_i20.PersonalInfoResponse>>.value(
                _FakeBaseResponse_1<_i20.PersonalInfoResponse>(
          this,
          Invocation.method(
            #submitPersonalInfo,
            [],
            {#personalInfoRequest: personalInfoRequest},
          ),
        )),
      ) as _i9.Future<_i3.BaseResponse<_i20.PersonalInfoResponse>>);
  @override
  _i9.Future<_i3.BaseResponse<_i22.OnfidoTokenResponse>> getOnfidoToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnfidoToken,
          [],
        ),
        returnValue:
            _i9.Future<_i3.BaseResponse<_i22.OnfidoTokenResponse>>.value(
                _FakeBaseResponse_1<_i22.OnfidoTokenResponse>(
          this,
          Invocation.method(
            #getOnfidoToken,
            [],
          ),
        )),
      ) as _i9.Future<_i3.BaseResponse<_i22.OnfidoTokenResponse>>);
  @override
  _i9.Future<_i3.BaseResponse<_i23.OnfidoResultResponse>> submitOnfidoOutcome(
          _i24.OnfidoResultRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitOnfidoOutcome,
          [request],
        ),
        returnValue:
            _i9.Future<_i3.BaseResponse<_i23.OnfidoResultResponse>>.value(
                _FakeBaseResponse_1<_i23.OnfidoResultResponse>(
          this,
          Invocation.method(
            #submitOnfidoOutcome,
            [request],
          ),
        )),
      ) as _i9.Future<_i3.BaseResponse<_i23.OnfidoResultResponse>>);
}

/// A class which mocks [PpiResponseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPpiResponseRepository extends _i1.Mock
    implements _i25.PpiResponseRepository {
  MockPpiResponseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.BotRecommendationRepository get botRecommendationRepository =>
      (super.noSuchMethod(
        Invocation.getter(#botRecommendationRepository),
        returnValue: _FakeBotRecommendationRepository_4(
          this,
          Invocation.getter(#botRecommendationRepository),
        ),
      ) as _i6.BotRecommendationRepository);
  @override
  _i9.Future<_i7.PpiUserResponse> addAnswer(
          _i26.PpiSelectionRequest? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i9.Future<_i7.PpiUserResponse>.value(_FakePpiUserResponse_5(
          this,
          Invocation.method(
            #addAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i9.Future<_i7.PpiUserResponse>);
  @override
  _i9.Future<_i7.PpiUserResponse> addBulkAnswer(
          List<_i26.PpiSelectionRequest>? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBulkAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i9.Future<_i7.PpiUserResponse>.value(_FakePpiUserResponse_5(
          this,
          Invocation.method(
            #addBulkAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i9.Future<_i7.PpiUserResponse>);
  @override
  _i9.Future<_i3.BaseResponse<_i7.SnapShot>> getUserSnapShotUserId(
          dynamic userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapShotUserId,
          [userId],
        ),
        returnValue: _i9.Future<_i3.BaseResponse<_i7.SnapShot>>.value(
            _FakeBaseResponse_1<_i7.SnapShot>(
          this,
          Invocation.method(
            #getUserSnapShotUserId,
            [userId],
          ),
        )),
      ) as _i9.Future<_i3.BaseResponse<_i7.SnapShot>>);
  @override
  _i9.Future<void> saveUserSnapShotToLocal(_i7.SnapShot? snapshot) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserSnapShotToLocal,
          [snapshot],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<_i7.SnapShot?> getUserSnapShotFromLocal(
          {bool? forceToFetch = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapShotFromLocal,
          [],
          {#forceToFetch: forceToFetch},
        ),
        returnValue: _i9.Future<_i7.SnapShot?>.value(),
      ) as _i9.Future<_i7.SnapShot?>);
  @override
  _i9.Future<_i3.BaseResponse<_i7.SnapShot>> getUserSnapshotByAskloraId(
          int? askloraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapshotByAskloraId,
          [askloraId],
        ),
        returnValue: _i9.Future<_i3.BaseResponse<_i7.SnapShot>>.value(
            _FakeBaseResponse_1<_i7.SnapShot>(
          this,
          Invocation.method(
            #getUserSnapshotByAskloraId,
            [askloraId],
          ),
        )),
      ) as _i9.Future<_i3.BaseResponse<_i7.SnapShot>>);
  @override
  _i9.Future<_i4.Response<dynamic>> linkUser(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkUser,
          [userId],
        ),
        returnValue:
            _i9.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #linkUser,
            [userId],
          ),
        )),
      ) as _i9.Future<_i4.Response<dynamic>>);
}
