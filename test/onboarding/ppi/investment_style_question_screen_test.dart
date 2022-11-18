import 'dart:math';

import 'package:asklora_mobile_app/feature/ppi/bloc/question/question_bloc.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/fixture.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/question.dart';
import 'package:asklora_mobile_app/feature/ppi/presentation/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

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

    List<QuestionCollection> investmentStyle =
        Fixture().investmentStyleQuestion;

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

      for (int index = 0; index < investmentStyle.length; index++) {
        if (investmentStyle[index].questions!.types ==
            QuestionType.choices.value) {
          expect(multipleChoiceQuestionBuilder, findsOneWidget);
          expect(descriptiveQuestionInput, findsNothing);
          expect(questionHeader, findsOneWidget);
          expect(questionNavigationButtonWidget, findsOneWidget);
          expect(questionNextButton, findsOneWidget);
          expect(questionCancelButton, findsOneWidget);
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(Key(
              '${investmentStyle[index].uid}-${_randomSelectedIndex(investmentStyle[index].questions!.choices!.length)}')));
          await tester.pumpAndSettle();
          await tester.tap(questionNextButton);
          await tester.pump();
        } else if (investmentStyle[index].questions!.types ==
            QuestionType.descriptive.value) {
          expect(multipleChoiceQuestionBuilder, findsNothing);
          expect(descriptiveQuestionInput, findsOneWidget);
          expect(questionHeader, findsOneWidget);
          expect(questionNavigationButtonWidget, findsOneWidget);
          expect(questionNextButton, findsOneWidget);
          expect(questionCancelButton, findsOneWidget);
          await tester.enterText(descriptiveQuestionInput, 'abc');
          await tester.pump();
          await tester.tap(questionNextButton);
          await tester.pump();
        }
      }
    });
  });
}

int _randomSelectedIndex(int max) => Random().nextInt(max);
