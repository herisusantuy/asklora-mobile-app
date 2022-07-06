import 'package:asklora_mobile_app/core/utils/route_generator.dart';
import 'package:asklora_mobile_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mocks.dart';

void main() {
  group('Home Screen Tests', () {
    setUpAll(() {});

    Future<void> _buildHomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const HomeScreen(),
        onGenerateRoute: RouterGenerator.generateRoute,
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'When user tap on AskLora app'
        'Then show `Home Screen with Sing-up and Login` screen',
        (tester) async {
      await _buildHomeScreen(tester);
      var signUpButton = find.byKey(const Key('custom_button_sign_up'));
      expect(signUpButton, findsOneWidget);
      var loginButton = find.byKey(const Key('custom_button_login'));
      expect(loginButton, findsOneWidget);
    });

    testWidgets(
        'When user tap on Sign-Up Button'
        'Then show `Sign-Up Screen with email and password fields`',
        (tester) async {
      await _buildHomeScreen(tester);
      var signUpButton = find.byKey(const Key('custom_button_sign_up'));
      expect(signUpButton, findsOneWidget);
      await tester.tap(find.byKey(const Key('custom_button_sign_up')));
      await tester.pumpAndSettle();
    });

    tearDownAll(() => null);
  });
}
