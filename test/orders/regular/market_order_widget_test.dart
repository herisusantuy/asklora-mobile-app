import 'package:asklora_mobile_app/core/utils/app_icons.dart';
import 'package:asklora_mobile_app/feature/orders/bloc/order_bloc.dart';
import 'package:asklora_mobile_app/feature/orders/domain/symbol_detail.dart';
import 'package:asklora_mobile_app/feature/orders/regular/presentation/market_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('Market Order Widget Test', () {
    final SymbolDetail symbolDetail =
        SymbolDetail('AAPL.O', '100', AppIcons.appleLogo);
    Future<void> _buildMarketOrderWidget(WidgetTester tester,
        OrderType orderType, TransactionType transactionType) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (context) => OrderBloc(),
            child: MarketOrderWidget(transactionType, symbolDetail),
          ),
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    var inputMarket = find.byKey(const Key('input_market'));
    testWidgets('First render widget transaction type buy',
        (WidgetTester tester) async {
      await _buildMarketOrderWidget(
          tester, OrderType.market, TransactionType.buy);
      expect(inputMarket, findsOneWidget);
      expect(find.text('Market price of ${symbolDetail.name}'), findsOneWidget);
      expect(find.text('Number of shares'), findsOneWidget);
      expect(find.text('Estimate Total'), findsOneWidget);
      expect(find.text('Available buying power'), findsOneWidget);
      expect(find.text('Number of shares you can buy'), findsOneWidget);
    });

    testWidgets('First render widget transaction type sell',
        (WidgetTester tester) async {
      await _buildMarketOrderWidget(
          tester, OrderType.market, TransactionType.sell);
      expect(inputMarket, findsOneWidget);
      expect(find.text('Market price of ${symbolDetail.name}'), findsOneWidget);
      expect(find.text('Number of shares'), findsOneWidget);
      expect(find.text('Estimate Total'), findsOneWidget);
      expect(find.text('Available amount to sell'), findsOneWidget);
      expect(find.text('Number of shares you can sell'), findsOneWidget);
    });
  });
}
