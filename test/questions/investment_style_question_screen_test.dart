import 'package:asklora_mobile_app/feature/questions/bloc/question/question_bloc.dart';
import 'package:asklora_mobile_app/feature/questions/presentation/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Investment Style Questions Screen Tests', () {
    var multipleChoiceQuestionBuilder =
        find.byKey(const Key('multiple_choice_question_builder'));
    var descriptiveQuestionInput =
        find.byKey(const Key('descriptive_question_input'));
    var questionHeader = find.byKey(const Key('question_header'));
    var questionNavigationButtonWidget =
        find.byKey(const Key('question_navigation_button_widget'));

    var questionNextButton = find.byKey(const Key('question_next_button'));
    var questionCancelButton = find.byKey(const Key('question_cancel_button'));

    Future<void> buildPrivacyQuestionScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const QuestionScreen(
          initialQuestionPage: QuestionPageStep.investmentStyle,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Rendering Investment Style Question Screen and Navigating through Investment question 1-5',
        (tester) async {
      await buildPrivacyQuestionScreen(tester);
      await tester.pumpAndSettle();

      ///question 1 - choice type
      expect(multipleChoiceQuestionBuilder, findsOneWidget);
      expect(descriptiveQuestionInput, findsNothing);
      expect(questionHeader, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
      await tester.tap(find.byKey(const Key('0')));
      await tester.pump();

      ///question 2 - descriptive type
      await tester.tap(questionNextButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(multipleChoiceQuestionBuilder, findsNothing);
      expect(descriptiveQuestionInput, findsOneWidget);
      expect(questionHeader, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
      await tester.enterText(descriptiveQuestionInput, 'abc');
      await tester.pump();

      ///question 3 - descriptive type
      await tester.tap(questionNextButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(multipleChoiceQuestionBuilder, findsNothing);
      expect(descriptiveQuestionInput, findsOneWidget);
      expect(questionHeader, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
      await tester.enterText(descriptiveQuestionInput, 'abc');
      await tester.pump();

      ///question 4 - choice type
      await tester.tap(questionNextButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(multipleChoiceQuestionBuilder, findsOneWidget);
      expect(descriptiveQuestionInput, findsNothing);
      expect(questionHeader, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
      await tester.tap(find.byKey(const Key('1')));
      await tester.pump();

      ///question 5 - choice type
      await tester.tap(questionNextButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(multipleChoiceQuestionBuilder, findsOneWidget);
      expect(descriptiveQuestionInput, findsNothing);
      expect(questionHeader, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
      await tester.tap(find.byKey(const Key('0')));
      await tester.pump();
    });
  });
}
