import 'package:asklora_mobile_app/core/domain/otp/get_otp_request.dart';
import 'package:asklora_mobile_app/feature/auth/otp/presentation/otp_form.dart';
import 'package:asklora_mobile_app/feature/auth/otp/presentation/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('OTP Screen Widget Tests', () {
    var requestOtpButton = find.byKey(const Key('request_otp_button'));
    var otpNumPad = find.byKey(const Key('otp_num_pad'));
    var otpNumKey1 = find.byKey(const Key('otp_num_key_1'));
    var otpNumKey2 = find.byKey(const Key('otp_num_key_2'));
    var otpNumKey3 = find.byKey(const Key('otp_num_key_3'));
    var otpNumKey4 = find.byKey(const Key('otp_num_key_4'));
    var otpNumKey5 = find.byKey(const Key('otp_num_key_5'));
    var otpNumKey6 = find.byKey(const Key('otp_num_key_6'));
    var otpNumKey7 = find.byKey(const Key('otp_num_key_7'));
    var otpNumKey8 = find.byKey(const Key('otp_num_key_8'));
    var otpNumKey9 = find.byKey(const Key('otp_num_key_9'));

    var otpBox = find.byKey(const Key('otp_box'));

    Future<void> _buildHomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const OtpScreen(
          email: 'test123@example.com',
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Render OTP screen with `Instruction` text, `OtpBox` field, `Request` button',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.pump();
      expect(requestOtpButton, findsOneWidget);
      expect(otpNumPad, findsOneWidget);
      expect(otpNumKey1, findsOneWidget);
      expect(otpNumKey2, findsOneWidget);
      expect(otpNumKey3, findsOneWidget);
      expect(otpNumKey4, findsOneWidget);
      expect(otpNumKey5, findsOneWidget);
      expect(otpNumKey6, findsOneWidget);
      expect(otpNumKey7, findsOneWidget);
      expect(otpNumKey8, findsOneWidget);
      expect(otpNumKey9, findsOneWidget);
      expect(otpBox, findsOneWidget);

      expect(find.text('Verification Code'), findsOneWidget);
      expect(
          find.text('Please enter the OTP sent on your registered Email ID.'),
          findsOneWidget);
    });

    testWidgets('Entering OTP < 6 digits', (tester) async {
      await _buildHomeScreen(tester);
      await tester.pump();
      await tester.ensureVisible(otpNumKey1);
      await tester.tap(otpNumKey1);
      await tester.pump();
      await tester.ensureVisible(otpNumKey2);
      await tester.tap(otpNumKey2);
      await tester.pump();
      await tester.ensureVisible(otpNumKey3);
      await tester.tap(otpNumKey3);
      await tester.pump();

      expect((tester.firstWidget(otpNumPad) as OtpNumPad).otp, '123');
    });

    testWidgets('Entering OTP 6 digits', (tester) async {
      await _buildHomeScreen(tester);
      await tester.pump();
      await tester.ensureVisible(otpNumKey1);
      await tester.tap(otpNumKey1);
      await tester.pump();
      await tester.ensureVisible(otpNumKey2);
      await tester.tap(otpNumKey2);
      await tester.pump();
      await tester.ensureVisible(otpNumKey3);
      await tester.tap(otpNumKey3);
      await tester.pump();
      await tester.ensureVisible(otpNumKey4);
      await tester.tap(otpNumKey4);
      await tester.pump();
      await tester.ensureVisible(otpNumKey5);
      await tester.tap(otpNumKey5);
      await tester.pump();
      await tester.ensureVisible(otpNumKey6);
      await tester.tap(otpNumKey6);
      await tester.pump();

      expect((tester.firstWidget(otpNumPad) as OtpNumPad).otp, '123456');
    });
  });
}
