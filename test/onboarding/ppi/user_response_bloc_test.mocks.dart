// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/onboarding/ppi/user_response_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i4;
import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response_request.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/bot_recommendation_repository.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_response_repository.dart'
    as _i6;
import 'package:dio/dio.dart' as _i5;
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

class _FakeBotRecommendationRepository_0 extends _i1.SmartFake
    implements _i2.BotRecommendationRepository {
  _FakeBotRecommendationRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePpiUserResponse_1 extends _i1.SmartFake
    implements _i3.PpiUserResponse {
  _FakePpiUserResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseResponse_2<T> extends _i1.SmartFake
    implements _i4.BaseResponse<T> {
  _FakeBaseResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3<T> extends _i1.SmartFake implements _i5.Response<T> {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PpiResponseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPpiResponseRepository extends _i1.Mock
    implements _i6.PpiResponseRepository {
  MockPpiResponseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BotRecommendationRepository get botRecommendationRepository =>
      (super.noSuchMethod(
        Invocation.getter(#botRecommendationRepository),
        returnValue: _FakeBotRecommendationRepository_0(
          this,
          Invocation.getter(#botRecommendationRepository),
        ),
      ) as _i2.BotRecommendationRepository);
  @override
  _i7.Future<_i3.PpiUserResponse> addAnswer(
          _i8.PpiSelectionRequest? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i7.Future<_i3.PpiUserResponse>.value(_FakePpiUserResponse_1(
          this,
          Invocation.method(
            #addAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i7.Future<_i3.PpiUserResponse>);
  @override
  _i7.Future<_i3.PpiUserResponse> addBulkAnswer(
          List<_i8.PpiSelectionRequest>? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBulkAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i7.Future<_i3.PpiUserResponse>.value(_FakePpiUserResponse_1(
          this,
          Invocation.method(
            #addBulkAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i7.Future<_i3.PpiUserResponse>);
  @override
  _i7.Future<_i4.BaseResponse<_i3.SnapShot>> getUserSnapShotUserId(
          dynamic userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapShotUserId,
          [userId],
        ),
        returnValue: _i7.Future<_i4.BaseResponse<_i3.SnapShot>>.value(
            _FakeBaseResponse_2<_i3.SnapShot>(
          this,
          Invocation.method(
            #getUserSnapShotUserId,
            [userId],
          ),
        )),
      ) as _i7.Future<_i4.BaseResponse<_i3.SnapShot>>);
  @override
  _i7.Future<_i4.BaseResponse<_i3.SnapShot>> getUserSnapshotByAskloraId(
          int? askloraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSnapshotByAskloraId,
          [askloraId],
        ),
        returnValue: _i7.Future<_i4.BaseResponse<_i3.SnapShot>>.value(
            _FakeBaseResponse_2<_i3.SnapShot>(
          this,
          Invocation.method(
            #getUserSnapshotByAskloraId,
            [askloraId],
          ),
        )),
      ) as _i7.Future<_i4.BaseResponse<_i3.SnapShot>>);
  @override
  _i7.Future<_i5.Response<dynamic>> linkUser(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #linkUser,
          [userId],
        ),
        returnValue:
            _i7.Future<_i5.Response<dynamic>>.value(_FakeResponse_3<dynamic>(
          this,
          Invocation.method(
            #linkUser,
            [userId],
          ),
        )),
      ) as _i7.Future<_i5.Response<dynamic>>);
}

/// A class which mocks [SharedPreference].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreference extends _i1.Mock implements _i9.SharedPreference {
  MockSharedPreference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i7.Future<String?>.value(),
      ) as _i7.Future<String?>);
  @override
  _i7.Future<bool?> readBoolData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readBoolData,
          [key],
        ),
        returnValue: _i7.Future<bool?>.value(),
      ) as _i7.Future<bool?>);
  @override
  _i7.Future<bool> writeData(
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
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<bool> writeBoolData(
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
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<bool> writeIntData(
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
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i7.Future<int?>.value(),
      ) as _i7.Future<int?>);
}
