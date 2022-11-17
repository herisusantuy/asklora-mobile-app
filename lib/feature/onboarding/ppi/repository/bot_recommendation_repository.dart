import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/domain/base_response.dart';
import '../domain/ppi_user_response.dart';

class BotRecommendationRepository {
  static BotRecommendationRepository? _instance;

  factory BotRecommendationRepository() =>
      _instance ??= BotRecommendationRepository._();

  BotRecommendationRepository._();

  List<RecommendedBot> recommendedBots = [];

  set setRecommendedBots(List<RecommendedBot> recommendedBots) {
    this.recommendedBots = recommendedBots;
  }

  List<RecommendedBot> get getRecommendedBots {
    return recommendedBots;
  }

  Future<BaseResponse<List<RecommendedBot>>> fetchBots() async {
    final String response =
        await rootBundle.loadString('assets/json/bot_recommended_list.json');

    Iterable iterable = json.decode(response);
    var data = List<RecommendedBot>.from(
        iterable.map((model) => RecommendedBot.fromJson(model)));

    return BaseResponse.complete(data);
  }
}
