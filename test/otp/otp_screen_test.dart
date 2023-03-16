import 'package:asklora_mobile_app/feature/auth/otp/presentation/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('OTP Screen Widget Tests', () {
    var requestOtpButton = find.byKey(const Key('request_otp_button'));
    var signUpAgainButton = find.byKey(const Key('sign_up_again_button'));

    var otpBox = find.byKey(const Key('otp_box'));
    var mEmojiWidget = find.byKey(const Key('memoji_widget'));

    Future<void> buildHomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const OtpScreen(
            email: 'test123@example.com', password: 'Aa1234567'),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Render OTP screen with `Guide` text, `OtpBox` field, `Instruction` text',
        (tester) async {
      await buildHomeScreen(tester);
      await tester.pump();
      expect(otpBox, findsOneWidget);
      expect(mEmojiWidget, findsOneWidget);
      expect(requestOtpButton, findsOneWidget);
      expect(signUpAgainButton, findsOneWidget);
    });

    testWidgets('Entering OTP < 6 digits not number',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildHomeScreen(tester);
        await tester.pump();
        await tester.enterText(otpBox, 'abc');
        await tester.pump();
        expect(find.text('a'), findsNothing);
        expect(find.text('b'), findsNothing);
        expect(find.text('c'), findsNothing);
      });
    });

    testWidgets('Entering OTP < 6 digits number', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildHomeScreen(tester);
        await tester.pump();
        await tester.enterText(otpBox, '123');
        await tester.pump();
        expect(find.text('1'), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
      });
    });

    testWidgets('Entering OTP 6 digits number', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildHomeScreen(tester);
        await tester.pump();
        await tester.enterText(otpBox, '123456');
        await tester.pump();
        expect(find.text('1'), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
        expect(find.text('4'), findsOneWidget);
        expect(find.text('5'), findsOneWidget);
        expect(find.text('6'), findsOneWidget);
      });
    });
  });
}
