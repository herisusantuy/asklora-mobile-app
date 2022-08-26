import 'package:asklora_mobile_app/core/domain/endpoints.dart';
import 'package:asklora_mobile_app/feature/orders/bloc/order_bloc.dart';
import 'package:asklora_mobile_app/feature/orders/regular/presentation/order_submitted_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('*Order Submitted Screen Test*', () {
    Future<void> _buildORderSubmittedScreen(
        WidgetTester tester, TransactionType transactionType) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: OrderSubmittedScreen(transactionType: transactionType),
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    var viewOrderDetailButton =
        find.byKey(const Key('view_order_detail_submitted_button'));
    var backToDashboardButton =
        find.byKey(const Key('back_to_dashboard_button'));
    var directionValue = find.byKey(const Key('direction_value_expanded_row'));
    var orderTypeValue = find.byKey(const Key('order_type_value_expanded_row'));
    var quantityValue = find.byKey(const Key('quantity_value_expanded_row'));
    var amountValue = find.byKey(const Key('amount_value_expanded_row'));

    testWidgets('When user on "BUY" Order submitted screen',
        (WidgetTester tester) async {
      await _buildORderSubmittedScreen(tester, TransactionType.buy);
      expect(find.text('Order Success!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.text('Your order of AAPL.O\nbeen processed'), findsOneWidget);
      expect(directionValue, findsOneWidget);
      expect(orderTypeValue, findsOneWidget);
      expect(quantityValue, findsOneWidget);
      expect(amountValue, findsOneWidget);
      expect(backToDashboardButton, findsOneWidget);
      expect(viewOrderDetailButton, findsOneWidget);
    });

    testWidgets('When user on "SELL" Order submitted screen',
        (WidgetTester tester) async {
      await _buildORderSubmittedScreen(tester, TransactionType.sell);
      expect(find.text('Order Success!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.text('Your order of AAPL.O\nbeen processed'), findsOneWidget);
      expect(find.text('Direction'), findsOneWidget);
      expect(find.text('Order Type'), findsOneWidget);
      expect(find.text('Quantity'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(backToDashboardButton, findsOneWidget);
      expect(viewOrderDetailButton, findsOneWidget);
    });
  });
}
