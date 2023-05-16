// Mocks generated by Mockito 5.4.0 from annotations
// in asklora_mobile_app/test/app/app_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/app/bloc/app_bloc.dart' as _i8;
import 'package:asklora_mobile_app/app/domain/user_journey_response.dart'
    as _i7;
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart'
    as _i6;
import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/core/domain/token/model/token_refresh_request.dart'
    as _i11;
import 'package:asklora_mobile_app/core/domain/token/model/token_verify_request.dart'
    as _i10;
import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart'
    as _i4;
import 'package:asklora_mobile_app/core/domain/token/token_api_client.dart'
    as _i9;
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

/// A class which mocks [TokenRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenRepository extends _i1.Mock implements _i4.TokenRepository {
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
  _i5.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
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
}

/// A class which mocks [UserJourneyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserJourneyRepository extends _i1.Mock
    implements _i6.UserJourneyRepository {
  MockUserJourneyRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BaseResponse<_i7.UserJourneyResponse>> saveUserJourney({
    required _i8.UserJourney? userJourney,
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
            _i5.Future<_i2.BaseResponse<_i7.UserJourneyResponse>>.value(
                _FakeBaseResponse_0<_i7.UserJourneyResponse>(
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
      ) as _i5.Future<_i2.BaseResponse<_i7.UserJourneyResponse>>);
  @override
  void saveUserJourneyToLocal({
    _i8.UserJourney? userJourney,
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
  _i5.Future<_i8.UserJourney?> getUserJourneyFromLocal() => (super.noSuchMethod(
        Invocation.method(
          #getUserJourneyFromLocal,
          [],
        ),
        returnValue: _i5.Future<_i8.UserJourney?>.value(),
      ) as _i5.Future<_i8.UserJourney?>);
  @override
  _i5.Future<_i8.UserJourney?> getUserJourney() => (super.noSuchMethod(
        Invocation.method(
          #getUserJourney,
          [],
        ),
        returnValue: _i5.Future<_i8.UserJourney?>.value(),
      ) as _i5.Future<_i8.UserJourney?>);
  @override
  _i5.Future<_i2.BaseResponse<_i7.UserJourneyResponse>>
      getUserJourneyWithData() => (super.noSuchMethod(
            Invocation.method(
              #getUserJourneyWithData,
              [],
            ),
            returnValue:
                _i5.Future<_i2.BaseResponse<_i7.UserJourneyResponse>>.value(
                    _FakeBaseResponse_0<_i7.UserJourneyResponse>(
              this,
              Invocation.method(
                #getUserJourneyWithData,
                [],
              ),
            )),
          ) as _i5.Future<_i2.BaseResponse<_i7.UserJourneyResponse>>);
}

/// A class which mocks [TokenApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenApiClient extends _i1.Mock implements _i9.TokenApiClient {
  MockTokenApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response<dynamic>> verify(_i10.TokenVerifyRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #verify,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #verify,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
  @override
  _i5.Future<_i3.Response<dynamic>> refresh(
          _i11.TokenRefreshRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.Response<dynamic>>.value(_FakeResponse_1<dynamic>(
          this,
          Invocation.method(
            #refresh,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.Response<dynamic>>);
}
