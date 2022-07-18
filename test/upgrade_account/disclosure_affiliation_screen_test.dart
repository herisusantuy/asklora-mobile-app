import 'dart:math';

import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/core/presentation/question_widget.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Step-4 Disclosure & Affiliation Form widget test', () {
    Future<void> _buildDisclosureAffiliationForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 4),
          navigatorObservers: [mockObserver]));
    }

    var question1 = find.byKey(const Key('question_1'));
    var question1IsYes = find.byKey(const Key('question_1 Yes'));
    var question1IsNo = find.byKey(const Key('question_1 No'));

    var question2 = find.byKey(const Key('question_2'));
    var question2IsYes = find.byKey(const Key('question_2 Yes'));
    var question2IsNo = find.byKey(const Key('question_2 No'));

    var question3 = find.byKey(const Key('question_3'));
    var question3IsYes = find.byKey(const Key('question_3 Yes'));
    var question3IsNo = find.byKey(const Key('question_3 No'));

    var question4 = find.byKey(const Key('question_4'));
    var question4IsYes = find.byKey(const Key('question_4 Yes'));
    var question4IsNo = find.byKey(const Key('question_4 No'));

    var question5 = find.byKey(const Key('question_5'));
    var question5IsYes = find.byKey(const Key('question_5 Yes'));
    var question5IsNo = find.byKey(const Key('question_5 No'));

    var question6 = find.byKey(const Key('question_6'));
    var question6IsYes = find.byKey(const Key('question_6 Yes'));
    var question6IsNo = find.byKey(const Key('question_6 No'));

    var question7 = find.byKey(const Key('question_7'));
    var question7IsYes = find.byKey(const Key('question_7 Yes'));
    var question7IsNo = find.byKey(const Key('question_7 No'));

    var nextButton =
        find.byKey(const Key('disclosures_affiliations_next_step_button'));

    testWidgets('Render Disclosure  Affiliation Form first render',
        (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      expect(question1, findsOneWidget);
      expect(question1IsYes, findsOneWidget);
      expect(question1IsNo, findsOneWidget);
      expect(question2, findsOneWidget);
      expect(question2IsYes, findsOneWidget);
      expect(question2IsNo, findsOneWidget);
      expect(question3, findsOneWidget);
      expect(question3IsYes, findsOneWidget);
      expect(question3IsNo, findsOneWidget);
      expect(question4, findsOneWidget);
      expect(question4IsYes, findsOneWidget);
      expect(question4IsNo, findsOneWidget);
      expect(question5, findsOneWidget);
      expect(question5IsYes, findsOneWidget);
      expect(question5IsNo, findsOneWidget);
      expect(question6, findsOneWidget);
      expect(question6IsYes, findsOneWidget);
      expect(question6IsNo, findsOneWidget);
      expect(question7, findsOneWidget);
      expect(question7IsYes, findsOneWidget);
      expect(question7IsNo, findsOneWidget);
      expect(nextButton, findsOneWidget);
    });
    testWidgets(
        'selected answer is null when first render and next button = disabled',
        (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      expect((tester.widget<QuestionWidget>(question1).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question2).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question3).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question4).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question5).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question6).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question7).selectedAnswer), null);
      expect((tester.widget<CustomTextButton>(nextButton).disable), true);
    });

    testWidgets(
        'enable next button when question has answered with option "No" ',
        (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question1IsNo);
      await tester.pump();
      await tester.tap(question2IsNo);
      await tester.pump();
      await tester.tap(question3IsNo);
      await tester.pump();
      await tester.ensureVisible(question4IsNo);
      await tester.tap(question4IsNo);
      await tester.pump();
      await tester.tap(question5IsNo);
      await tester.pump();
      await tester.tap(question6IsNo);
      await tester.pump();
      await tester.tap(question7IsNo);
      await tester.pump();
      expect((tester.widget(question1) as QuestionWidget).selectedAnswer, 'No');
      expect((tester.widget(question2) as QuestionWidget).selectedAnswer, 'No');
      expect((tester.widget(question3) as QuestionWidget).selectedAnswer, 'No');
      expect((tester.widget(question4) as QuestionWidget).selectedAnswer, 'No');
      expect((tester.widget(question5) as QuestionWidget).selectedAnswer, 'No');
      expect((tester.widget(question6) as QuestionWidget).selectedAnswer, 'No');
      expect((tester.widget(question7) as QuestionWidget).selectedAnswer, 'No');
    });
  });
}
