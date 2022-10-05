import 'package:asklora_mobile_app/feature/questions/bloc/question/question_bloc.dart';
import 'package:asklora_mobile_app/feature/questions/presentation/bot_recommendation/bot_recommendation_screen.dart';
import 'package:asklora_mobile_app/feature/questions/presentation/question_screen.dart';
import 'package:asklora_mobile_app/feature/questions/presentation/widget/question_navigation_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Investment Style Questions Screen Tests', () {
    var botRecommendationHeader =
        find.byKey(const Key('bot_recommendation_header'));
    var botList = find.byKey(const Key('bot_list'));
    var questionNavigationButtonWidget =
        find.byKey(const Key('question_navigation_button_widget'));

    var questionNextButton = find.byKey(const Key('question_next_button'));
    var questionCancelButton = find.byKey(const Key('question_cancel_button'));
    var botIndex0 = find.byKey(const Key('0'));

    Future<void> buildBotRecommendationScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const QuestionScreen(
          initialQuestionPage: QuestionPageStep.botRecommendation,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Rendering Bot Recommendation Screen and tap twice on bot index 0',
        (tester) async {
      await buildBotRecommendationScreen(tester);
      await tester.pumpAndSettle();
      expect(botList, findsOneWidget);
      expect(botRecommendationHeader, findsOneWidget);
      expect(questionNavigationButtonWidget, findsOneWidget);
      expect(questionNextButton, findsOneWidget);
      expect(questionCancelButton, findsOneWidget);
      expect(botIndex0, findsOneWidget);
      expect(tester.widget<BotCard>(botIndex0).selected, isFalse);
      expect(
          tester
              .widget<QuestionNavigationButtonWidget>(
                  questionNavigationButtonWidget)
              .disable,
          isTrue);
      await tester.tap(botIndex0);
      await tester.pump();
      expect(tester.widget<BotCard>(botIndex0).selected, isTrue);
      expect(
          tester
              .widget<QuestionNavigationButtonWidget>(
                  questionNavigationButtonWidget)
              .disable,
          isFalse);
      await tester.tap(botIndex0);
      await tester.pump();
      expect(tester.widget<BotCard>(botIndex0).selected, isFalse);
      expect(
          tester
              .widget<QuestionNavigationButtonWidget>(
                  questionNavigationButtonWidget)
              .disable,
          isTrue);
    });
  });
}
