import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('*FPS Transfer Screen Test*', () {
    Future<void> _buildFpsTransferScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const DepositScreen(
          initialDepositPages: DepositPages.fpsTransfer,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    var fpsIdCard = find.byKey(const Key('fps_id_card'));
    var fpsIdCopyButton = find.byKey(const Key('fps_id_card_copy_button'));

    testWidgets('First render screen', (WidgetTester tester) async {
      await _buildFpsTransferScreen(tester);
      expect(find.text('FPS Transfer'), findsOneWidget);
      expect(
          find.text(
              'Please transfer to AskLORA’s bank account using your bank app'),
          findsOneWidget);
      expect(fpsIdCard, findsOneWidget);
      expect(fpsIdCopyButton, findsOneWidget);
      expect(find.text('Notes:'), findsOneWidget);
      expect(
          find.text(
              'Please make sure that the name under your FPS account matches with the name that you used to sign up'),
          findsOneWidget);
      expect(
          find.text(
              'Please make sure your FPS number matches the phone number you used to register on AskLORA'),
          findsOneWidget);
      expect(
          find.text(
              'Did you know that in a year, cows kill more people than sharks?'),
          findsOneWidget);
    });
  });
}
