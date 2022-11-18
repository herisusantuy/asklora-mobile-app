import 'package:asklora_mobile_app/core/presentation/we_create/custom_button.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/presentation/ppi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group(
    'PPI Result Screen Widget Test',
    () {
      Future<void> buildPpiResultScreen(
          WidgetTester tester, PpiResultType ppiResultType) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          home: PpiResultScreen(
              mEmojiText: 'congratulations',
              additionalMessage: 'additional message',
              ppiResultType: ppiResultType),
          navigatorObservers: [mockObserver],
        ));
      }

      var mEmojiWidget = find.byKey(
        const Key('memoji_widget'),
      );
      var nextButton = find.byKey(
        const Key('next_button'),
      );
      var tryAgainButton = find.byKey(
        const Key('try_again_button'),
      );
      var needHelpButton = find.byKey(
        const Key('need_help_button'),
      );

      testWidgets('Show Ppi Result screen with success type',
          (WidgetTester tester) async {
        await buildPpiResultScreen(tester, PpiResultType.success);
        expect(mEmojiWidget, findsOneWidget);
        expect(nextButton, findsOneWidget);
        expect(tryAgainButton, findsNothing);
        expect(needHelpButton, findsNothing);
        expect(
            (tester.firstWidget(nextButton) as CustomButton).disable, isFalse);
      });

      testWidgets('Show Ppi Result screen with failed type',
              (WidgetTester tester) async {
            await buildPpiResultScreen(tester, PpiResultType.failed);
            expect(mEmojiWidget, findsOneWidget);
            expect(nextButton, findsNothing);
            expect(tryAgainButton, findsOneWidget);
            expect(needHelpButton, findsOneWidget);
          });
    },
  );
}
