import 'package:asklora_mobile_app/feature/orders/bloc/order_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Order Bloc Tests', () {
    late OrderBloc orderBloc;

    setUp(() async {
      orderBloc = OrderBloc();
    });

    test('Order Bloc init state', () {
      expect(orderBloc.state, const OrderState());
    });

    blocTest<OrderBloc, OrderState>(
        'emits `transactionType` = TransactionType.buy WHEN '
        'select transaction type buy',
        build: () => orderBloc,
        act: (bloc) async =>
            bloc.add(const TransactionTypeChanged(TransactionType.buy)),
        expect: () => {
              const OrderState(transactionType: TransactionType.buy),
            });

    blocTest<OrderBloc, OrderState>(
        'emits `transactionType` = TransactionType.buy WHEN '
        'select transaction type sell',
        build: () => orderBloc,
        act: (bloc) async =>
            bloc.add(const TransactionTypeChanged(TransactionType.sell)),
        expect: () => {
              const OrderState(transactionType: TransactionType.sell),
            });

    blocTest<OrderBloc, OrderState>(
        'emits `orderType` = OrderType.limit WHEN '
        'select order type limit',
        build: () => orderBloc,
        act: (bloc) async => bloc.add(const OrderTypeChanged(OrderType.limit)),
        expect: () => {
              const OrderState(orderType: OrderType.limit),
            });

    tearDown(() => {orderBloc.close()});
  });
}
