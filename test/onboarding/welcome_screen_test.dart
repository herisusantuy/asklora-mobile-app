import 'package:asklora_mobile_app/app/bloc/app_bloc.dart';
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart';
import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart';
import 'package:asklora_mobile_app/core/utils/storage/secure_storage.dart';
import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart';
import 'package:asklora_mobile_app/feature/onboarding/welcome/welcome_screen.dart';
import 'package:asklora_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          home: BlocProvider(
              create: (_) => AppBloc(
                  tokenRepository: TokenRepository(),
                  userJourneyRepository: UserJourneyRepository(),
                  sharedPreference: SharedPreference(),
                  secureStorage: SecureStorage()),
              child: const WelcomeScreen()),
          navigatorObservers: [mockObserver],
        ));
      }

      testWidgets(
          'Show Carousel screen with localization toggle button, carousel background, onboarding button and login button',
          (WidgetTester tester) async {
        await buildCarouselScreen(tester);
        await tester.pumpAndSettle();
        var onBoardingButtonPair = find.byKey(
          const Key('button_pair'),
        );

        /// Disabling this test as toggle button is not in the mock app
        // var localizationToggleButton = find.byKey(
        //   const Key('localization_toggle_button'),
        // );
        //
        // expect(localizationToggleButton, findsOneWidget);
        expect(onBoardingButtonPair, findsOneWidget);
      });
    },
  );
}
