import 'package:asklora_mobile_app/feature/orders/bloc/order_bloc.dart';
import 'package:asklora_mobile_app/feature/orders/regular/presentation/order_screen.dart';
import 'package:asklora_mobile_app/feature/orders/regular/presentation/widgets/custom_bottom_sheet_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('Trail Type Widget Test', () {
    Future<void> _buildTrailTypeWidget(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (_) => OrderBloc(),
            child: const TrailWidget(),
          ),
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    final trailTypeButton = find.byKey(const Key('trail_type_button'));
    final trailTypePercentageChoice =
        find.byKey(const Key('trail_type_percentage_choice'));
    final trailTypeAmountChoice =
        find.byKey(const Key('trail_type_amount_choice'));
    final trailTypeBottomSheet =
        find.byKey(const Key('trail_type_bottom_sheet'));
    final trailTypeAmountChoiceButton =
        find.byKey(const Key('trail_type_amount_choice_button'));
    final trailTypePercentageChoiceButton =
        find.byKey(const Key('trail_type_percentage_choice_button'));

    testWidgets('First render trail type widget', (WidgetTester tester) async {
      await _buildTrailTypeWidget(tester);
      expect(trailTypeButton, findsOneWidget);
    });

    testWidgets('Tap and show bottom sheet widget',
        (WidgetTester tester) async {
      await _buildTrailTypeWidget(tester);
      expect(trailTypeButton, findsOneWidget);
      await tester.tap(trailTypeButton);
      await tester.pump();
      expect(trailTypeBottomSheet, findsOneWidget);
      expect(trailTypePercentageChoice, findsOneWidget);
      expect(trailTypeAmountChoice, findsOneWidget);
    });

    testWidgets('Tap choice amount and percentage',
        (WidgetTester tester) async {
      await _buildTrailTypeWidget(tester);
      expect(trailTypeButton, findsOneWidget);
      await tester.tap(trailTypeButton);
      await tester.pump();
      expect(trailTypeBottomSheet, findsOneWidget);
      expect(trailTypePercentageChoice, findsOneWidget);
      expect(trailTypeAmountChoice, findsOneWidget);
      await tester.ensureVisible(trailTypeAmountChoiceButton);
      await tester.pumpAndSettle();
      await tester.tap(trailTypeAmountChoiceButton);
      await tester.pump();
      expect(
          (tester.widget(trailTypeAmountChoice) as CustomBottomSheetCardWidget)
              .active,
          isTrue);
      expect(
          (tester.widget(trailTypePercentageChoice)
                  as CustomBottomSheetCardWidget)
              .active,
          isFalse);
      await tester.ensureVisible(trailTypePercentageChoiceButton);
      await tester.pumpAndSettle();
      await tester.tap(trailTypePercentageChoiceButton);
      await tester.pump();
      expect(
          (tester.widget(trailTypePercentageChoice)
                  as CustomBottomSheetCardWidget)
              .active,
          isTrue);
      expect(
          (tester.widget(trailTypeAmountChoice) as CustomBottomSheetCardWidget)
              .active,
          isFalse);
    });
  });
}
