import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../domain/order_request.dart';
import '../../repository/orders_repository.dart';
import '../../utils/orders_calculation.dart';

part 'trailing_order_event.dart';
part 'trailing_order_state.dart';

class TrailingOrderBloc extends Bloc<TrailingOrderEvent, TrailingOrderState> {
  final OrdersRepository _ordersRepository;
  final double _marketPrice;
  TrailingOrderBloc({
    required double marketPrice,
    required double availableBuyingPower,
    required double numberOfSellableShares,
    required OrdersRepository ordersRepository,
  })  : _ordersRepository = ordersRepository,
        _marketPrice = marketPrice,
        super(TrailingOrderState(
            availableBuyingPower: availableBuyingPower,
            availableAmountToSell: calculateAvailableAmountToSell(
                marketPrice, numberOfSellableShares),
            numberOfSellableShares: numberOfSellableShares)) {
    on<TrailingAmountChanged>(_onAmountChanged);
    on<TrailingPercentageChanged>(_onPercentageChanged);
    on<QuantityOfTrailingOrderChanged>(_onQuantityChanged);
  }

  void _onAmountChanged(
      TrailingAmountChanged event, Emitter<TrailingOrderState> emit) {
    emit(state.copyWith(
        amount: event.amount,
        initialTrailingPrice:
            initialTrailingAmountPrice(event.amount, _marketPrice)));
  }

  void _onPercentageChanged(
      TrailingPercentageChanged event, Emitter<TrailingOrderState> emit) {
    emit(state.copyWith(
        percentage: event.percentage,
        initialTrailingPrice:
            initialTrailingPercentagePrice(event.percentage, _marketPrice)));
  }

  void _onQuantityChanged(
      QuantityOfTrailingOrderChanged event, Emitter<TrailingOrderState> emit) {
    emit(state.copyWith(
      quantity: event.quantity,
    ));
  }

  void _onOrderSubmitted(
      TrailingOrderSubmitted event, Emitter<TrailingOrderState> emit) async {
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
