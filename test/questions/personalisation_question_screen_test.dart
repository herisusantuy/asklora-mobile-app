import 'package:asklora_mobile_app/feature/questions/bloc/question/question_bloc.dart';
import 'package:asklora_mobile_app/feature/questions/presentation/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Personalisation Question Screen Test', () {
    var titleQuestionScreen = find.text('Personalisation Question');
    var personalisationQuestionWidget =
        find.byKey(const Key('personalisation_question_widget'));
    var questionNavigationButtonWidget = find
        .byKey(const Key('personalisation_question_navigation_button_widget'));
    var questionNextButton = find.byKey(const Key('question_next_button'));
    var questionCancelButton = find.byKey(const Key('question_cancel_button'));

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

      // question screen
      expect(titleQuestionScreen, findsOneWidget);
      expect(personalisationQuestionWidget, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
    });
  });
}
