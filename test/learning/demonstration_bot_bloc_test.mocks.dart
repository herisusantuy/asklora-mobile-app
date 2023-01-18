// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/learning/demonstration_bot_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/core/domain/triplet.dart' as _i7;
import 'package:asklora_mobile_app/feature/bot_stock/repository/bot_stock_repository.dart'
    as _i4;
import 'package:asklora_mobile_app/feature/chart/domain/chart_models.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/learning/demonstration_bot/bloc/demonstration_bot_bloc.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart'
    as _i8;
import 'package:flutter_bloc/flutter_bloc.dart' as _i9;
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

class _FakeDemonstrationBotState_1 extends _i1.SmartFake
    implements _i3.DemonstrationBotState {
  _FakeDemonstrationBotState_1(
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
    implements _i4.BotStockRepository {
  MockBotStockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BaseResponse<List<_i6.ChartDataSet>>> fetchChartDataJson() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchChartDataJson,
          [],
        ),
        returnValue: _i5.Future<_i2.BaseResponse<List<_i6.ChartDataSet>>>.value(
            _FakeBaseResponse_0<List<_i6.ChartDataSet>>(
          this,
          Invocation.method(
            #fetchChartDataJson,
            [],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<List<_i6.ChartDataSet>>>);
  @override
  _i5.Future<
      _i2.BaseResponse<
          _i7.Triplet<
              List<_i6.ChartDataStudioSet>,
              List<_i6.ChartDataStudioSet>,
              List<_i6.UiData>>>> fetchTradeChartDataJson() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTradeChartDataJson,
          [],
        ),
        returnValue: _i5.Future<
            _i2.BaseResponse<
                _i7.Triplet<
                    List<_i6.ChartDataStudioSet>,
                    List<_i6.ChartDataStudioSet>,
                    List<_i6.UiData>>>>.value(_FakeBaseResponse_0<
            _i7.Triplet<List<_i6.ChartDataStudioSet>,
                List<_i6.ChartDataStudioSet>, List<_i6.UiData>>>(
          this,
          Invocation.method(
            #fetchTradeChartDataJson,
            [],
          ),
        )),
      ) as _i5.Future<
          _i2.BaseResponse<
              _i7.Triplet<List<_i6.ChartDataStudioSet>,
                  List<_i6.ChartDataStudioSet>, List<_i6.UiData>>>>);
  @override
  _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>
      fetchBotRecommendation() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotRecommendation,
              [],
            ),
            returnValue:
                _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>.value(
                    _FakeBaseResponse_0<List<_i8.RecommendedBot>>(
              this,
              Invocation.method(
                #fetchBotRecommendation,
                [],
              ),
            )),
          ) as _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>);
  @override
  _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>
      fetchBotDemonstration() => (super.noSuchMethod(
            Invocation.method(
              #fetchBotDemonstration,
              [],
            ),
            returnValue:
                _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>.value(
                    _FakeBaseResponse_0<List<_i8.RecommendedBot>>(
              this,
              Invocation.method(
                #fetchBotDemonstration,
                [],
              ),
            )),
          ) as _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>);
  @override
  _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>> fetchBotPortfolio() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchBotPortfolio,
          [],
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>.value(
                _FakeBaseResponse_0<List<_i8.RecommendedBot>>(
          this,
          Invocation.method(
            #fetchBotPortfolio,
            [],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<List<_i8.RecommendedBot>>>);
  @override
  _i5.Future<_i2.BaseResponse<bool>> getFreeBotStock() => (super.noSuchMethod(
        Invocation.method(
          #getFreeBotStock,
          [],
        ),
        returnValue:
            _i5.Future<_i2.BaseResponse<bool>>.value(_FakeBaseResponse_0<bool>(
          this,
          Invocation.method(
            #getFreeBotStock,
            [],
          ),
        )),
      ) as _i5.Future<_i2.BaseResponse<bool>>);
}

/// A class which mocks [DemonstrationBotBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockDemonstrationBotBloc extends _i1.Mock
    implements _i3.DemonstrationBotBloc {
  MockDemonstrationBotBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.DemonstrationBotState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeDemonstrationBotState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.DemonstrationBotState);
  @override
  _i5.Stream<_i3.DemonstrationBotState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i3.DemonstrationBotState>.empty(),
      ) as _i5.Stream<_i3.DemonstrationBotState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i3.DemonstrationBotEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i3.DemonstrationBotEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.DemonstrationBotState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i3.DemonstrationBotEvent>(
    _i9.EventHandler<E, _i3.DemonstrationBotState>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i9.Transition<_i3.DemonstrationBotEvent, _i3.DemonstrationBotState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  void onChange(_i9.Change<_i3.DemonstrationBotState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
