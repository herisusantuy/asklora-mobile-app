import 'dart:math';

import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/ppi/bloc/question/question_bloc.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/fixture.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/question.dart';
import 'package:asklora_mobile_app/feature/ppi/presentation/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('Personalisation Question Screen Test', () {
    var titleQuestionScreen = find.text('Personalisation Question');
    var personalisationQuestionWidget =
        find.byKey(const Key('personalisation_question_widget'));
    var questionNavigationButtonWidget = find
        .byKey(const Key('personalisation_question_navigation_button_widget'));
    var questionNextButton = find.byKey(const Key('question_next_button'));
    var questionCancelButton = find.byKey(const Key('question_cancel_button'));
    List<QuestionCollection> personalisedQuestions =
        Fixture().personalisedQuestion;
    Future<void> builderPersonalisationQuestionScreen(
        WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const QuestionScreen(
          initialQuestionPage: QuestionPageStep.personalisation,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Rendering Personalisation Question Screen and Navigation through personalisation question 1-3',
        (tester) async {
      await builderPersonalisationQuestionScreen(tester);
      await tester.pumpAndSettle();

      for (int index = 0;
          index < personalisedQuestions.length;
          index = index + 2) {
        expect(titleQuestionScreen, findsOneWidget);
        expect(personalisationQuestionWidget, findsOneWidget);
        expect(questionNavigationButtonWidget, findsOneWidget);
        expect(questionNextButton, findsOneWidget);
        expect(questionCancelButton, findsOneWidget);
        await tester.tap(find.byKey(Key(
            '${personalisedQuestions[index].uid}-${_randomSelectedIndex(personalisedQuestions[index].questions!.choices!.length)}')));
        await tester.pumpAndSettle();
        expect(
            (tester.firstWidget(questionNextButton) as CustomTextButton)
                .disable,
            isTrue);
        await tester.tap(find.byKey(Key(
            '${personalisedQuestions[index + 1].uid}-${_randomSelectedIndex(personalisedQuestions[index + 1].questions!.choices!.length)}')));
        await tester.pumpAndSettle();
        expect(
            (tester.firstWidget(questionNextButton) as CustomTextButton)
                .disable,
            isFalse);
        await tester.tap(questionNextButton);
        await tester.pump();
      }
    });
  });
}

int _randomSelectedIndex(int max) => Random().nextInt(max);
