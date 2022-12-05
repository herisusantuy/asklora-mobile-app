import 'package:asklora_mobile_app/feature/onboarding/welcome/carousel/presentation/carousel_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group(
    'Carousel Screen Widget Test',
    () {
      Future<void> buildCarouselScreen(WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          home: const CarouselScreen(),
          navigatorObservers: [mockObserver],
        ));
      }

      testWidgets(
          'Show Carousel screen with localization toggle button, carousel background, onboarding button and login button',
          (WidgetTester tester) async {
        await buildCarouselScreen(tester);
        var onBoardingButton = find.byKey(
          const Key('begin_on_boarding_button'),
        );
        var signInButton = find.byKey(
          const Key('sign_in_button'),
        );

        // var backgroundCarouselSlider = find.byKey(
        //   const Key('background_carousel_slider'),
        // );
        var localizationToggleButton = find.byKey(
          const Key('localization_toggle_button'),
        );

        // expect(backgroundCarouselSlider, findsOneWidget);
        // expect(
        //     (tester.firstWidget(backgroundCarouselSlider) as CarouselSlider)
        //             .items!
        //             .length ==
        //         4,
        //     isTrue);
        expect(localizationToggleButton, findsOneWidget);
        expect(onBoardingButton, findsOneWidget);
        expect(signInButton, findsOneWidget);
      });
    },
  );
}
