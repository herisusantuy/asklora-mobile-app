import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState()) {
    on<TransactionTypeChanged>(_onTransactionTypeChanged);
    on<OrderTypeChanged>(_onOrderTypeChanged);
  }

  void _onTransactionTypeChanged(
      TransactionTypeChanged event, Emitter<OrderState> emit) {
    emit(state.copyWith(transactionType: event.transactionType));
  }

  void _onOrderTypeChanged(OrderTypeChanged event, Emitter<OrderState> emit) {
    emit(state.copyWith(orderType: event.orderType));
  }
}
