import 'package:asklora_mobile_app/core/utils/app_icons.dart';
import 'package:asklora_mobile_app/feature/orders/bloc/order_bloc.dart';
import 'package:asklora_mobile_app/feature/orders/domain/symbol_detail.dart';
import 'package:asklora_mobile_app/feature/orders/regular/presentation/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('Limit Order Widget Test', () {
    final SymbolDetail symbolDetail =
        SymbolDetail('AAPL.O', '100', AppIcons.appleLogo);
    Future<void> _buildLimitOrderWidget(WidgetTester tester,
        OrderType orderType, TransactionType transactionType) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: LimitOrderWidget(
              orderType: orderType,
              transactionType: transactionType,
              symbolDetail: symbolDetail),
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets('First render widget transaction type buy',
        (WidgetTester tester) async {
      await _buildLimitOrderWidget(
          tester, OrderType.limit, TransactionType.buy);
      expect(find.text('Limit Price'), findsOneWidget);
      expect(find.text('Quantity'), findsOneWidget);
      expect(find.text('Time in Force'), findsOneWidget);
      expect(find.text('Trading Hours'), findsOneWidget);
      expect(find.text('Market price of ${symbolDetail.name}'), findsOneWidget);
      expect(find.text('Estimated Total'), findsOneWidget);
      expect(find.text('Available buying power'), findsOneWidget);
      expect(find.text('Available amount to sell'), findsNothing);
      expect(find.text('Number of shares you can sell'), findsNothing);
    });

    testWidgets('First render widget transaction type sell',
        (WidgetTester tester) async {
      await _buildLimitOrderWidget(
          tester, OrderType.limit, TransactionType.sell);
      expect(find.text('Limit Price'), findsOneWidget);
      expect(find.text('Quantity'), findsOneWidget);
      expect(find.text('Time in Force'), findsOneWidget);
      expect(find.text('Trading Hours'), findsOneWidget);
      expect(find.text('Market price of ${symbolDetail.name}'), findsOneWidget);
      expect(find.text('Estimated Total'), findsOneWidget);
      expect(find.text('Available buying power'), findsNothing);
      expect(find.text('Available amount to sell'), findsOneWidget);
      expect(find.text('Number of shares you can sell'), findsOneWidget);
    });
  });
}
