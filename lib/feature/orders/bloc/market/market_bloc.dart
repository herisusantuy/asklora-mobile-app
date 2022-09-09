import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../domain/order_request.dart';
import '../../repository/orders_repository.dart';
import '../../utils/orders_calculation.dart';

part 'market_event.dart';

part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc(
      {required double marketPrice,
      required double availableBuyingPower,
      required OrdersRepository ordersRepository})
      : _marketPrice = marketPrice,
        _ordersRepository = ordersRepository,
        super(MarketState(
            availableBuyingPower: availableBuyingPower,
            numberOfBuyableShares: calculateNumberOfBuyableShares(
                marketPrice, availableBuyingPower))) {
    on<AmountChanged>(_onAmountChanged);
    on<SharesAmountChanged>(_onSharesAmountChanged);
    on<SharesAmountIncremented>(_onSharesAmountIncremented);
    on<SharesAmountDecremented>(_onSharesAmountDecremented);
    on<OrderSubmitted>(_onOrderSubmitted);
  }

  final OrdersRepository _ordersRepository;

  final double _marketPrice;

  void _onAmountChanged(AmountChanged event, Emitter<MarketState> emit) {
    if (!event.amount.isNegative) {
      emit(state.copyWith(
          estimateTotal: event.amount,
          sharesAmount: calculateAmount(_marketPrice, event.amount)));
    }
  }

  void _onSharesAmountChanged(
      SharesAmountChanged event, Emitter<MarketState> emit) {
    if (!event.sharesAmount.isNegative) {
      emit(state.copyWith(
          estimateTotal:
              calculateEstimateTotal(_marketPrice, event.sharesAmount),
          sharesAmount: event.sharesAmount));
    }
  }

  void _onSharesAmountIncremented(
      SharesAmountIncremented event, Emitter<MarketState> emit) {
    double sharesAmount = incrementSharesAmount(state.sharesAmount);
    emit(state.copyWith(
        estimateTotal: calculateEstimateTotal(_marketPrice, sharesAmount),
        sharesAmount: sharesAmount,
        errorText: sharesAmount > state.numberOfBuyableShares
            ? 'Number of shares exceed the number of shares you can buy'
            : ''));
  }

  void _onSharesAmountDecremented(
      SharesAmountDecremented event, Emitter<MarketState> emit) {
    if (state.sharesAmount != 0) {
      double sharesAmount = decrementSharesAmount(state.sharesAmount);
      emit(state.copyWith(
          estimateTotal: calculateEstimateTotal(_marketPrice, sharesAmount),
          sharesAmount: sharesAmount,
          errorText: sharesAmount > state.numberOfBuyableShares
              ? 'Number of shares exceed the number of shares you can buy'
              : ''));
    }
  }

  void _onOrderSubmitted(
      OrderSubmitted event, Emitter<MarketState> emit) async {
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
