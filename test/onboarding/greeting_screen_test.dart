import 'package:asklora_mobile_app/core/presentation/buttons/primary_button.dart';
import 'package:asklora_mobile_app/feature/onboarding/welcome/greeting/greeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group(
    'Greeting Screen Widget Test',
    () {
      Future<void> buildCarouselScreen(WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          home: const GreetingScreen(name: 'Anton'),
          navigatorObservers: [mockObserver],
        ));
      }

      var mEmojiWidget = find.byKey(
        const Key('memoji_widget'),
      );

      var nextButton = find.byKey(
        const Key('next_button'),
      );

      testWidgets('Show Greeting screen with memoji and next button',
          (WidgetTester tester) async {
        await buildCarouselScreen(tester);
        expect(mEmojiWidget, findsOneWidget);
        expect(nextButton, findsOneWidget);
        expect((tester.firstWidget(nextButton) as PrimaryButton).disabled,
            isFalse);
      });
    },
  );
}
