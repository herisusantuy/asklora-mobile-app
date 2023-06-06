// Mocks generated by Mockito 5.4.1 from annotations
// in asklora_mobile_app/test/learning/demonstration_bot_bloc_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/bot_stock/domain/bot_detail_model.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/bot_stock/domain/bot_recommendation_model.dart'
    as _i8;
import 'package:asklora_mobile_app/feature/bot_stock/domain/orders/bot_active_order_detail_model.dart'
    as _i10;
import 'package:asklora_mobile_app/feature/bot_stock/domain/orders/bot_active_order_model.dart'
    as _i9;
import 'package:asklora_mobile_app/feature/bot_stock/domain/orders/create_order_response.dart'
    as _i11;
import 'package:asklora_mobile_app/feature/bot_stock/repository/bot_stock_repository.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/chart/domain/chart_models.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/chart/domain/chart_studio_animation_model.dart'
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
  _i4.Future<_i2.BaseResponse<_i5.BotDetailModel>> fetchBotDetail(
    String? ticker,
    String? botId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchBotDetail,
          [
            ticker,
            botId,
          ],
        ),
        returnValue: _i4.Future<_i2.BaseResponse<_i5.BotDetailModel>>.value(
            _FakeBaseResponse_0<_i5.BotDetailModel>(
          this,
          Invocation.method(
            #fetchBotDetail,
            [
              ticker,
              botId,
            ],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i5.BotDetailModel>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i6.ChartDataSet>>> fetchChartDataJson() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchChartDataJson,
          [],
        ),
        returnValue: _i4.Future<_i2.BaseResponse<List<_i6.ChartDataSet>>>.value(
            _FakeBaseResponse_0<List<_i6.ChartDataSet>>(
          this,
          Invocation.method(
            #fetchChartDataJson,
            [],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<List<_i6.ChartDataSet>>>);
  @override
  _i4.Future<_i2.BaseResponse<_i7.ChartStudioAnimationModel>>
      fetchTradeChartDataJson() => (super.noSuchMethod(
            Invocation.method(
              #fetchTradeChartDataJson,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<_i7.ChartStudioAnimationModel>>.value(
                _FakeBaseResponse_0<_i7.ChartStudioAnimationModel>(
              this,
              Invocation.method(
                #fetchTradeChartDataJson,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<_i7.ChartStudioAnimationModel>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i8.BotRecommendationModel>>>
      fetchBotRecommendation() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotRecommendation,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<List<_i8.BotRecommendationModel>>>.value(
                _FakeBaseResponse_0<List<_i8.BotRecommendationModel>>(
              this,
              Invocation.method(
                #fetchBotRecommendation,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i8.BotRecommendationModel>>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i8.BotRecommendationModel>>>
      fetchFreeBotRecommendation({bool? isFreeBot = false}) =>
          (super.noSuchMethod(
            Invocation.method(
              #fetchFreeBotRecommendation,
              [],
              {#isFreeBot: isFreeBot},
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<List<_i8.BotRecommendationModel>>>.value(
                _FakeBaseResponse_0<List<_i8.BotRecommendationModel>>(
              this,
              Invocation.method(
                #fetchFreeBotRecommendation,
                [],
                {#isFreeBot: isFreeBot},
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i8.BotRecommendationModel>>>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i8.BotRecommendationModel>>>
      fetchBotDemonstration() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotDemonstration,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.BaseResponse<List<_i8.BotRecommendationModel>>>.value(
                _FakeBaseResponse_0<List<_i8.BotRecommendationModel>>(
              this,
              Invocation.method(
                #fetchBotDemonstration,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<List<_i8.BotRecommendationModel>>>);
  @override
  _i4.Future<void> removeInvestmentStyleState() => (super.noSuchMethod(
        Invocation.method(
          #removeInvestmentStyleState,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.BaseResponse<List<_i9.BotActiveOrderModel>>> activeOrders(
          {required List<String>? status}) =>
      (super.noSuchMethod(
        Invocation.method(
          #activeOrders,
          [],
          {#status: status},
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<List<_i9.BotActiveOrderModel>>>.value(
                _FakeBaseResponse_0<List<_i9.BotActiveOrderModel>>(
          this,
          Invocation.method(
            #activeOrders,
            [],
            {#status: status},
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<List<_i9.BotActiveOrderModel>>>);
  @override
  _i4.Future<
      _i2.BaseResponse<_i10.BotActiveOrderDetailModel>> activeOrderDetail(
          String? botOrderId) =>
      (super.noSuchMethod(
        Invocation.method(
          #activeOrderDetail,
          [botOrderId],
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<_i10.BotActiveOrderDetailModel>>.value(
                _FakeBaseResponse_0<_i10.BotActiveOrderDetailModel>(
          this,
          Invocation.method(
            #activeOrderDetail,
            [botOrderId],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i10.BotActiveOrderDetailModel>>);
  @override
  _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>> createOrder({
    required _i8.BotRecommendationModel? botRecommendationModel,
    required double? tradeBotStockAmount,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createOrder,
          [],
          {
            #botRecommendationModel: botRecommendationModel,
            #tradeBotStockAmount: tradeBotStockAmount,
          },
        ),
        returnValue: _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>.value(
            _FakeBaseResponse_0<_i11.BotOrderResponse>(
          this,
          Invocation.method(
            #createOrder,
            [],
            {
              #botRecommendationModel: botRecommendationModel,
              #tradeBotStockAmount: tradeBotStockAmount,
            },
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>> cancelOrder(
          String? botOrderId) =>
      (super.noSuchMethod(
        Invocation.method(
          #cancelOrder,
          [botOrderId],
        ),
        returnValue: _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>.value(
            _FakeBaseResponse_0<_i11.BotOrderResponse>(
          this,
          Invocation.method(
            #cancelOrder,
            [botOrderId],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>> rolloverOrder(
          String? botOrderId) =>
      (super.noSuchMethod(
        Invocation.method(
          #rolloverOrder,
          [botOrderId],
        ),
        returnValue: _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>.value(
            _FakeBaseResponse_0<_i11.BotOrderResponse>(
          this,
          Invocation.method(
            #rolloverOrder,
            [botOrderId],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>);
  @override
  _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>> terminateOrder(
          String? botOrderId) =>
      (super.noSuchMethod(
        Invocation.method(
          #terminateOrder,
          [botOrderId],
        ),
        returnValue: _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>.value(
            _FakeBaseResponse_0<_i11.BotOrderResponse>(
          this,
          Invocation.method(
            #terminateOrder,
            [botOrderId],
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i11.BotOrderResponse>>);
}
