// Mocks generated by Mockito 5.2.0 from annotations
// in asklora_mobile_app/test/questions/bot_recommendation_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/questions/domain/endpoint_response.dart'
    as _i4;
import 'package:asklora_mobile_app/feature/questions/repository/bot_recommendation_repository.dart'
    as _i3;
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

class _FakeBaseResponse_0<T> extends _i1.Fake implements _i2.BaseResponse<T> {}

/// A class which mocks [BotRecommendationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBotRecommendationRepository extends _i1.Mock
    implements _i3.BotRecommendationRepository {
  MockBotRecommendationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i4.RecommendedBot> get recommendedBots =>
      (super.noSuchMethod(Invocation.getter(#recommendedBots),
          returnValue: <_i4.RecommendedBot>[]) as List<_i4.RecommendedBot>);

  @override
  set recommendedBots(List<_i4.RecommendedBot>? _recommendedBots) =>
      super.noSuchMethod(Invocation.setter(#recommendedBots, _recommendedBots),
          returnValueForMissingStub: null);

  @override
  set setRecommendedBots(List<_i4.RecommendedBot>? recommendedBots) => super
      .noSuchMethod(Invocation.setter(#setRecommendedBots, recommendedBots),
          returnValueForMissingStub: null);

  @override
  List<_i4.RecommendedBot> get getRecommendedBots =>
      (super.noSuchMethod(Invocation.getter(#getRecommendedBots),
          returnValue: <_i4.RecommendedBot>[]) as List<_i4.RecommendedBot>);

  @override
  _i5.Future<_i2.BaseResponse<List<_i4.RecommendedBot>>> fetchBots() =>
      (super.noSuchMethod(Invocation.method(#fetchBots, []),
          returnValue: Future<_i2.BaseResponse<List<_i4.RecommendedBot>>>.value(
              _FakeBaseResponse_0<List<_i4.RecommendedBot>>())) as _i5
          .Future<_i2.BaseResponse<List<_i4.RecommendedBot>>>);
}
