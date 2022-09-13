import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../domain/order_request.dart';
import '../../repository/orders_repository.dart';
import '../../utils/orders_calculation.dart';

part 'limit_event.dart';

part 'limit_state.dart';

class LimitBloc extends Bloc<LimitEvent, LimitState> {
  LimitBloc(
      {required double marketPrice,
      required double availableBuyingPower,
      required double numberOfSellableShares,
      required OrdersRepository ordersRepository})
      : _ordersRepository = ordersRepository,
        super(LimitState(
            availableBuyingPower: availableBuyingPower,
            numberOfSellableShares: numberOfSellableShares,
            availableAmountToSell: calculateAvailableAmountToSell(
                marketPrice, numberOfSellableShares))) {
    on<LimitChanged>(_onLimitChanged);
    on<QuantityChanged>(_onQuantityChanged);
    on<OrderSubmitted>(_onOrderSubmitted);
  }

  final OrdersRepository _ordersRepository;

  void _onLimitChanged(LimitChanged event, Emitter<LimitState> emit) {
    emit(state.copyWith(
        limit: event.limit,
        estimateTotal: calculateEstimateTotal(event.limit, state.quantity)));
  }

  void _onQuantityChanged(QuantityChanged event, Emitter<LimitState> emit) {
    emit(state.copyWith(
        estimateTotal: calculateEstimateTotal(state.limit, event.quantity),
        quantity: event.quantity));
  }

  void _onOrderSubmitted(OrderSubmitted event, Emitter<LimitState> emit) async {
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
