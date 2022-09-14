import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/orders/bloc/stop/stop_bloc.dart';
import 'package:asklora_mobile_app/feature/orders/domain/order_request.dart';
import 'package:asklora_mobile_app/feature/orders/domain/order_response.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../market_bloc_test.mocks.dart';

void main() async {
  group('*Stop Order Bloc Test*', () {
    late StopBloc stopBloc;
    late MockOrdersRepository mockOrdersRepository;
    double marketPrice = 100;

    setUpAll(() async {
      mockOrdersRepository = MockOrdersRepository();
    });

    setUp(() async {
      stopBloc = StopBloc(
          marketPrice: marketPrice,
          availableBuyingPower: 1000,
          numberOfSellableShares: 20,
          ordersRepository: mockOrdersRepository);
    });

    test('Stop Order init state', () {
      expect(
          stopBloc.state,
          const StopState(
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20,
          ));
    });

    blocTest<StopBloc, StopState>(
      'emits `estimateTotal = 0` and `stopPrice = 100` WHEN input stop price 100',
      build: () => stopBloc,
      act: (bloc) async => bloc.add(const StopPriceChanged(100)),
      expect: () => {
        const StopState(
            stopPrice: 100,
            estimateTotal: 0,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20)
      },
    );

    blocTest<StopBloc, StopState>(
      'emits `estimateTotal = 0` and `quantity = 10` WHEN input quantity 100',
      build: () => stopBloc,
      act: (bloc) => bloc.add(const StopQuantityChanged(10)),
      expect: () => {
        const StopState(
            quantity: 10,
            estimateTotal: 0,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
      },
    );

    blocTest<StopBloc, StopState>(
      'emits `estimateTotal = 1000` and `stop price = 100` `quantity = 10` WHEN input stop price 100 and quantity 100',
      build: () => stopBloc,
      act: (bloc) async {
        bloc.add(const StopPriceChanged(100));
        bloc.add(const StopQuantityChanged(10));
      },
      expect: () => {
        const StopState(
            stopPrice: 100,
            estimateTotal: 0,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
        const StopState(
            stopPrice: 100,
            quantity: 10,
            estimateTotal: 1000,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
      },
    );

    OrderRequest buyStopOrderRequest = OrderRequest.stop(
        symbolType: 'symbol',
        symbol: 'abc',
        side: 'buy',
        stopPrice: '100',
        quantity: '10');
    OrderRequest sellStopOrderRequest = OrderRequest.stop(
        symbolType: 'symbol',
        symbol: 'abc',
        side: 'sell',
        stopPrice: '100',
        quantity: '10');
    BaseResponse<OrderResponse> successResponse =
        BaseResponse.complete(OrderResponse());
    BaseResponse errorResponse =
        BaseResponse.error('Something went wrong, please try again later');

    blocTest<StopBloc, StopState>(
      'emits `response = BaseResponse.complete` WHEN `failed submit buy stop order`',
      build: () {
        when(mockOrdersRepository.submitOrder(
                orderRequest: buyStopOrderRequest))
            .thenThrow('Something went wrong, please try again later');
        return stopBloc;
      },
      act: (bloc) async {
        bloc.add(StopOrderSubmitted(buyStopOrderRequest));
      },
      expect: () => {
        StopState(
            response: BaseResponse.loading(),
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
        StopState(
            response: errorResponse,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
      },
    );
    blocTest<StopBloc, StopState>(
      'emits `response = BaseResponse.complete` WHEN `failed submit sell stop order`',
      build: () {
        when(mockOrdersRepository.submitOrder(
                orderRequest: sellStopOrderRequest))
            .thenThrow('Something went wrong, please try again later');
        return stopBloc;
      },
      act: (bloc) async {
        bloc.add(StopOrderSubmitted(sellStopOrderRequest));
      },
      expect: () => {
        StopState(
            response: BaseResponse.loading(),
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
        StopState(
            response: errorResponse,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
      },
    );
    blocTest<StopBloc, StopState>(
      'emits `response = BaseResponse.complete` WHEN `successfully submit buy stop order`',
      build: () {
        when(mockOrdersRepository.submitOrder(
                orderRequest: buyStopOrderRequest))
            .thenAnswer((_) async => Future.value(successResponse));
        return stopBloc;
      },
      act: (bloc) async {
        bloc.add(StopOrderSubmitted(buyStopOrderRequest));
      },
      expect: () => {
        StopState(
            response: BaseResponse.loading(),
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
        StopState(
            response: successResponse,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
      },
    );
    blocTest<StopBloc, StopState>(
      'emits `response = BaseResponse.complete` WHEN `successfully submit sell stop order`',
      build: () {
        when(mockOrdersRepository.submitOrder(
                orderRequest: sellStopOrderRequest))
            .thenAnswer((_) async => Future.value(successResponse));
        return stopBloc;
      },
      act: (bloc) async {
        bloc.add(StopOrderSubmitted(sellStopOrderRequest));
      },
      expect: () => {
        StopState(
            response: BaseResponse.loading(),
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
        StopState(
            response: successResponse,
            availableBuyingPower: 1000,
            availableAmountToSell: 2000,
            numberOfSellableShares: 20),
      },
    );
  });
}
