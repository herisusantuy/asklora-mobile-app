import 'package:asklora_mobile_app/feature/orders/regular/presentation/order_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('*Order Type Screen Test*', () {
    Future<void> _buildOrderTypeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const Scaffold(
          body: OrderTypeScreen(
            orderType: OrderType.buy,
          ),
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    var marketOrderButton = find.byKey(const Key('market_order_buy_button'));
    var limitOrderButton = find.byKey(const Key('limit_order_buy_button'));
    var stopOrderButton = find.byKey(const Key('stop_order_buy_button'));
    var stopLimitOrderButton =
        find.byKey(const Key('stop_limit_order_buy_button'));
    var trailingStopOrderButton =
        find.byKey(const Key('trailing_stop_order_buy_button'));

    testWidgets('When user on Order Type Screen', (WidgetTester tester) async {
      await _buildOrderTypeScreen(tester);
      expect(find.text('Select Order type'), findsOneWidget);
      expect(find.text('AskLORA supports the following order type :'),
          findsOneWidget);
      expect(marketOrderButton, findsOneWidget);
      expect(limitOrderButton, findsOneWidget);
      expect(stopOrderButton, findsOneWidget);
      expect(stopLimitOrderButton, findsOneWidget);
      expect(trailingStopOrderButton, findsOneWidget);
      expect(
          find.text(
              'Still unsure about the different order types? Learn more here!'),
          findsOneWidget);
    });
  });
}
