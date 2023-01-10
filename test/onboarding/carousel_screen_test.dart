import 'package:asklora_mobile_app/feature/onboarding/welcome/carousel/presentation/carousel_screen.dart';
import 'package:asklora_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group(
    'Carousel Screen Widget Test',
    () {
      Future<void> buildCarouselScreen(WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const CarouselScreen(),
          navigatorObservers: [mockObserver],
        ));
      }

      testWidgets(
          'Show Carousel screen with localization toggle button, carousel background, onboarding button and login button',
          (WidgetTester tester) async {
        await buildCarouselScreen(tester);
        await tester.pumpAndSettle();
        var onBoardingButtonPair = find.byKey(
          const Key('carousel_button_pair'),
        );

        var localizationToggleButton = find.byKey(
          const Key('localization_toggle_button'),
        );

        expect(localizationToggleButton, findsOneWidget);
        expect(onBoardingButtonPair, findsOneWidget);
      });
    },
  );
}
