import 'package:flutter/material.dart';

import '../../../core/domain/pair.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';

List<Pair<String, String>> botRecommendationFaqs = [
  Pair('How can I get a specific stock?',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet eget egestas egestas sed nisl, at gravida. Amet gravida massa eu fusce arcu urna.'),
  Pair('How can I see more Botstock?',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet eget egestas egestas sed nisl, at gravida. Amet gravida massa eu fusce arcu urna.'),
  Pair('Why I should invest in Botstock?',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet eget egestas egestas sed nisl, at gravida. Amet gravida massa eu fusce arcu urna.'),
];

List<RecommendedBot> defaultRecommendedBots = [
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'pull_up',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 5))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 2))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 10)),
      freeBot: true),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'squat',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 30))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 25))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'pull_up',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 60))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'squat',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 70))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 80))),
];

List<RecommendedBot> demonstrationBots = [
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'pull_up',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 5)),
      selectable: true),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 2))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 10)),
      freeBot: true,
      selectable: true),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'squat',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 30)),
      selectable: true),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 25))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'pull_up',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 60))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'squat',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 70))),
  RecommendedBot(
      '1',
      'TSLA',
      'Tesla TSLA',
      '4',
      'plank',
      'For stocks that holds a stable position. ',
      'Tesla Inc',
      '303.75',
      '9',
      '10',
      DateTime.now().add(const Duration(days: 80))),
];

enum BotType {
  pullUp('pull_up', 'PULLUP', 'Pullup', 'icon_bot_badge_pop_up_message_pull_up',
      AskLoraColors.lime, AskLoraColors.darkerLime,
      expiredTextColor: AskLoraColors.white),
  squat('squat', 'SQUAT', 'Squat', 'icon_bot_badge_pop_up_message_squat',
      AskLoraColors.purple, AskLoraColors.darkerPurple,
      expiredTextColor: AskLoraColors.white),
  plank('plank', 'PLANK', 'Plank', 'icon_bot_badge_pop_up_message_plank',
      AskLoraColors.primaryGreen, AskLoraColors.darkerGreen,
      expiredTextColor: AskLoraColors.white);

  final String value;
  final String uppercaseName;
  final String name;
  final String botAssetName;
  final Color primaryBgColor;
  final Color secondaryBgColor;
  final Color expiredTextColor;

  const BotType(this.value, this.uppercaseName, this.name, this.botAssetName,
      this.primaryBgColor, this.secondaryBgColor,
      {this.expiredTextColor = AskLoraColors.charcoal});

  static BotType findByString(String botType) =>
      BotType.values.firstWhere((element) => element.value == botType);
}

enum BotStockFilter {
  all('All'),
  active('Active'),
  pending('Pending');

  final String name;

  const BotStockFilter(this.name);
}
