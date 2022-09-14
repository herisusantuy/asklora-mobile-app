import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../domain/order_request.dart';
import '../../repository/orders_repository.dart';
import '../../utils/orders_calculation.dart';

part 'stop_state.dart';
part 'stop_event.dart';

class StopBloc extends Bloc<StopEvent, StopState> {
  final OrdersRepository _ordersRepository;

  StopBloc({
    required double marketPrice,
    required double availableBuyingPower,
    required double numberOfSellableShares,
    required OrdersRepository ordersRepository,
  })  : _ordersRepository = ordersRepository,
        super(StopState(
          availableBuyingPower: availableBuyingPower,
          numberOfSellableShares: numberOfSellableShares,
          availableAmountToSell: calculateAvailableAmountToSell(
              marketPrice, numberOfSellableShares),
        )) {
    on<StopPriceChanged>(_onStopPriceChanged);
    on<StopQuantityChanged>(_onQuantityChanged);
    on<StopOrderSubmitted>(_onOrderSubmitted);
  }

  void _onStopPriceChanged(StopPriceChanged event, Emitter<StopState> emit) {
    emit(state.copyWith(
        stopPrice: event.stopPrice,
        estimateTotal:
            calculateEstimateTotal(event.stopPrice, state.quantity)));
  }

  void _onQuantityChanged(StopQuantityChanged event, Emitter<StopState> emit) {
    emit(state.copyWith(
        estimateTotal: calculateEstimateTotal(state.stopPrice, event.quantity),
        quantity: event.quantity));
  }

  void _onOrderSubmitted(
      StopOrderSubmitted event, Emitter<StopState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    try {
      var data =
          await _ordersRepository.submitOrder(orderRequest: event.orderRequest);
      emit(state.copyWith(response: data));
    } catch (e) {
      emit(state.copyWith(
          response: BaseResponse.error(
              'Something went wrong, please try again later')));
    }
  }
}
