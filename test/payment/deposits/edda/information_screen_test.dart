import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('eDDA Information Screen Test', () {
    Future<void> _buildWhatIsFpsScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: DepositScreen(
          initialDepositPages: DepositPageStep.eDdaMeaning,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets('First render screen', (WidgetTester tester) async {
      await _buildWhatIsFpsScreen(tester);
      expect(find.text('What is eDDA?', skipOffstage: false), findsOneWidget);
      expect(
          find.byKey(const Key('edda_information_screen_info_key'),
              skipOffstage: false),
          findsOneWidget);
    });
  });
}
