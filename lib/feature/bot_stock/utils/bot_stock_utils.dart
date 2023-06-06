import 'package:flutter/material.dart';

import '../../../core/domain/pair.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/bot_recommendation_model.dart';

List<Pair<String, String>> botRecommendationFaqs = [
  const Pair('How can I get a specific stock?',
      'Lora recommends a short list of stocks along with matching bots to invest with every time you engage her. Lora does not provide stock picks by themselves, as they are not useful without a trading strategy.'),
  const Pair('How can I see more Botstocks?',
      'The more keywords you add to our search, the more results you can get! Lora will display up to 20 Botstock recommendations.'),
  const Pair('Why should I invest in Botstocks?',
      'If you have ever felt helpless or lost in the stock market, because you were not sure what to do, our Botstocks are the perfect solution. Lora\'s mission is to use the best in AI technology to help you in your stock investment journey, from picking suitable stocks to trading them automatically.'),
];

List<BotRecommendationModel> defaultBotRecommendation = [
  const BotRecommendationModel(1, 'CLASSIC_classic_003846', '', '', 'Pull Up',
      'MSFT.O', 'TESLA', '', '440'),
  const BotRecommendationModel(2, 'CLASSIC_classic_003846', '', '', 'Plank',
      'MSFT.O', 'TESLA', '', '390'),
  const BotRecommendationModel(3, 'CLASSIC_classic_003846', '', '', 'Squat',
      'MSFT.O', 'TESLA', '', '100'),
  const BotRecommendationModel(4, 'CLASSIC_classic_003846', '', '', 'Plank',
      'MSFT.O', 'TESLA', '', '150'),
  const BotRecommendationModel(5, 'CLASSIC_classic_003846', '', '', 'Squat',
      'MSFT.O', 'TESLA', '', '160'),
  const BotRecommendationModel(6, 'CLASSIC_classic_003846', '', '', 'Pull Up',
      'MSFT.O', 'TESLA', '', '90'),
  const BotRecommendationModel(7, 'CLASSIC_classic_003846', '', '', 'Pull Up',
      'MSFT.O', 'TESLA', '', '20'),
  const BotRecommendationModel(8, 'CLASSIC_classic_003846', '', '', 'Plank',
      'MSFT.O', 'TESLA', '', '600'),
];

List<BotRecommendationModel> demonstrationBots = [
  const BotRecommendationModel(1, 'CLASSIC_classic_003846', '', '', 'Pull Up',
      'MSFT.O', 'TESLA', '', '440',
      selectable: true),
  const BotRecommendationModel(2, 'CLASSIC_classic_003846', '', '', 'Plank',
      'MSFT.O', 'TESLA', '', '390',
      selectable: true),
  const BotRecommendationModel(3, 'CLASSIC_classic_003846', '', '', 'Squat',
      'MSFT.O', 'TESLA', '', '100',
      selectable: true),
  const BotRecommendationModel(4, 'CLASSIC_classic_003846', '', '', 'Plank',
      'MSFT.O', 'TESLA', '', '150'),
  const BotRecommendationModel(5, 'CLASSIC_classic_003846', '', '', 'Squat',
      'MSFT.O', 'TESLA', '', '160'),
  const BotRecommendationModel(6, 'CLASSIC_classic_003846', '', '', 'Pull Up',
      'MSFT.O', 'TESLA', '', '90'),
  const BotRecommendationModel(7, 'CLASSIC_classic_003846', '', '', 'Pull Up',
      'MSFT.O', 'TESLA', '', '20'),
  const BotRecommendationModel(8, 'CLASSIC_classic_003846', '', '', 'Plank',
      'MSFT.O', 'TESLA', '', '600'),
];

enum BotType {
  pullUp('Pull Up', 'PULLUP', 'Pullup', 'icon_bot_badge_pop_up_message_pull_up',
      AskLoraColors.lime, AskLoraColors.darkerLime),
  squat('Squat', 'SQUAT', 'Squat', 'icon_bot_badge_pop_up_message_squat',
      AskLoraColors.purple, AskLoraColors.darkerPurple,
      expiredTextColor: AskLoraColors.white),
  plank('Plank', 'PLANK', 'Plank', 'icon_bot_badge_pop_up_message_plank',
      AskLoraColors.primaryGreen, AskLoraColors.darkerGreen);

  final String value;
  final String upperCaseName;
  final String name;
  final String botAssetName;
  final Color primaryBgColor;
  final Color secondaryBgColor;
  final Color expiredTextColor;

  const BotType(this.value, this.upperCaseName, this.name, this.botAssetName,
      this.primaryBgColor, this.secondaryBgColor,
      {this.expiredTextColor = AskLoraColors.charcoal});

  static BotType findByString(String botAppType) =>
      BotType.values.firstWhere((element) => element.value == botAppType);
}

enum BotStockFilter {
  all('All'),
  active('Active'),
  pending('Pending');

  final String name;

  const BotStockFilter(this.name);
}

enum BotStatus {
  pending('place', 'Pending', AskLoraColors.amber),
  active('open', 'Active', AskLoraColors.primaryGreen),
  activeExpireSoon('open', 'Active (Expire Soon)', AskLoraColors.primaryGreen),
  closed('closed', 'Closed', AskLoraColors.primaryGreen),
  cancel('cancel', 'Cancel', AskLoraColors.primaryMagenta);

  final String value;
  final String name;
  final Color color;

  static BotStatus findByString(String botStatusString, {String? expireDate}) {
    BotStatus botStatus = BotStatus.values
        .firstWhere((element) => element.value == botStatusString);
    if (botStatus == active &&
        expireDate != null &&
        DateTime.parse(expireDate).difference(DateTime.now()).inDays < 3) {
      botStatus = BotStatus.activeExpireSoon;
    }
    return botStatus;
  }

  const BotStatus(this.value, this.name, this.color);
}

String newExpiryDateOnRollover(String? expireDate) => expireDate!=null?formatDateTimeAsString(
    DateTime.parse(expireDate).add(const Duration(days: 14))):'';
