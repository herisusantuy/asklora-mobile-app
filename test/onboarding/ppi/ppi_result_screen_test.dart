import 'package:asklora_mobile_app/core/presentation/buttons/primary_button.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/presentation/ppi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group(
    'PPI Result Screen Widget Test',
    () {
      Future<void> buildPpiResultScreen(
          WidgetTester tester, Widget bottomButton) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          home: PpiResultScreen(
            ppiResult: PpiResult.success,
            memojiText: 'congratulations',
            additionalMessage: 'additional message',
            bottomButton: bottomButton,
          ),
          navigatorObservers: [mockObserver],
        ));
      }

      var mEmojiWidget = find.byKey(
        const Key('memoji_widget'),
      );

      testWidgets('Show Ppi Result screen with only memoji widget',
          (WidgetTester tester) async {
        await buildPpiResultScreen(tester, const SizedBox.shrink());
        expect(mEmojiWidget, findsOneWidget);
      });

      testWidgets('Show Ppi Result screen with memoji widget and bottomButton',
          (WidgetTester tester) async {
        Key bottomButtonKey = const Key('bottom_button');
        await buildPpiResultScreen(tester,
            PrimaryButton(key: bottomButtonKey, label: 'button', onTap: () {}));
        expect(mEmojiWidget, findsOneWidget);
        expect(find.byKey(bottomButtonKey), findsOneWidget);
      });
    },
  );
}
