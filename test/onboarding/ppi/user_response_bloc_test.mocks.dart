// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/onboarding/ppi/user_response_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response_request.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/bot_recommendation_repository.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_response_repository.dart'
    as _i4;
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

/// A class which mocks [PpiResponseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPpiResponseRepository extends _i1.Mock
    implements _i4.PpiResponseRepository {
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
  _i5.Future<_i3.PpiUserResponse> addAnswer(
          _i6.PpiSelectionRequest? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i5.Future<_i3.PpiUserResponse>.value(_FakePpiUserResponse_1(
          this,
          Invocation.method(
            #addAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i5.Future<_i3.PpiUserResponse>);
  @override
  _i5.Future<_i3.PpiUserResponse> addBulkAnswer(
          List<_i6.PpiSelectionRequest>? ppiUserResponseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBulkAnswer,
          [ppiUserResponseRequest],
        ),
        returnValue:
            _i5.Future<_i3.PpiUserResponse>.value(_FakePpiUserResponse_1(
          this,
          Invocation.method(
            #addBulkAnswer,
            [ppiUserResponseRequest],
          ),
        )),
      ) as _i5.Future<_i3.PpiUserResponse>);
}
