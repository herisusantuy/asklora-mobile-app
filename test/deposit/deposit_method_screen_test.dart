import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('*Deposit Method Screen*', () {
    Future<void> _buildDepositMethodScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const DepositMethodScreen(),
        navigatorObservers: [mockObserver],
      ));
    }

    var wireTransferButton = find.byKey(const Key('wire_transfer_button'));
    var fpsButton = find.byKey(const Key('fps_button'));
    var whatIsFpsButton = find.byKey(const Key('what_is_fps_button'));

    testWidgets('First render screen', (tester) async {
      await _buildDepositMethodScreen(tester);
      expect(find.text('Deposit Method'), findsOneWidget);
      expect(find.text('Please select method of deposit'), findsOneWidget);
      expect((wireTransferButton), findsOneWidget);
      expect(fpsButton, findsOneWidget);
      expect(whatIsFpsButton, findsOneWidget);
    });
  });
}
