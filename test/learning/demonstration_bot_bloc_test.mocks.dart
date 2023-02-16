// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/learning/demonstration_bot_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/bot_stock/repository/bot_stock_repository.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/chart/domain/chart_models.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/chart/domain/chart_studio_animation_model.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart'
    as _i7;
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

/// A class which mocks [BotStockRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBotStockRepository extends _i1.Mock
    implements _i3.BotStockRepository {
  MockBotStockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse<List<_i5.ChartDataSet>>> fetchChartDataJson() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchChartDataJson,
          [],
        ),
        returnValue: _i4.Future<_i2.BaseResponse<List<_i5.ChartDataSet>>>.value(
            _FakeBaseResponse_0<List<_i5.ChartDataSet>>(
          this,
          Invocation.method(
            #fetchChartDataJson,
            [],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<List<_i5.ChartDataSet>>>);
  @override
  _i4.Future<_i2.BaseResponse<_i6.ChartStudioAnimationModel>>
      fetchTradeChartDataJson() => (super.noSuchMethod(
            Invocation.method(
              #fetchTradeChartDataJson,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<_i6.ChartStudioAnimationModel>>.value(
                _FakeBaseResponse_0<_i6.ChartStudioAnimationModel>(
              this,
              Invocation.method(
                #fetchTradeChartDataJson,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<_i6.ChartStudioAnimationModel>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>
      fetchBotRecommendation() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotRecommendation,
              [],
            ),
            returnValue:
                _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>.value(
                    _FakeBaseResponse_0<List<_i7.RecommendedBot>>(
              this,
              Invocation.method(
                #fetchBotRecommendation,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>
      fetchFreeBotRecommendation({bool? isFreeBot = false}) =>
          (super.noSuchMethod(
            Invocation.method(
              #fetchFreeBotRecommendation,
              [],
              {#isFreeBot: isFreeBot},
            ),
            returnValue:
                _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>.value(
                    _FakeBaseResponse_0<List<_i7.RecommendedBot>>(
              this,
              Invocation.method(
                #fetchFreeBotRecommendation,
                [],
                {#isFreeBot: isFreeBot},
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>
      fetchBotDemonstration() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotDemonstration,
              [],
            ),
            returnValue:
                _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>.value(
                    _FakeBaseResponse_0<List<_i7.RecommendedBot>>(
              this,
              Invocation.method(
                #fetchBotDemonstration,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i7.RecommendedBot>>>);
  @override
  _i4.Future<_i2.BaseResponse<bool>> tradeBotStock({
    required _i7.RecommendedBot? recommendedBot,
    required double? tradeBotStockAmount,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFreeBotStock,
          [],
          {
            #recommendedBot: recommendedBot,
            #tradeBotStockAmount: tradeBotStockAmount,
          },
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<bool>>.value(_FakeBaseResponse_0<bool>(
          this,
          Invocation.method(
            #getFreeBotStock,
            [],
            {
              #recommendedBot: recommendedBot,
              #tradeBotStockAmount: tradeBotStockAmount,
            },
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<bool>>);
  @override
  _i4.Future<_i2.BaseResponse<bool>> endBotStock(
          _i7.RecommendedBot? recommendedBot) =>
      (super.noSuchMethod(
        Invocation.method(
          #endBotStock,
          [recommendedBot],
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<bool>>.value(_FakeBaseResponse_0<bool>(
          this,
          Invocation.method(
            #endBotStock,
            [recommendedBot],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<bool>>);
}
