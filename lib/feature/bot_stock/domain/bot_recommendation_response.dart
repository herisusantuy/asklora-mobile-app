import 'package:json_annotation/json_annotation.dart';
import 'bot_recommendation_model.dart';

part 'bot_recommendation_response.g.dart';

@JsonSerializable()
class BotRecommendationResponse {
  final List<BotRecommendationModel> data;

  BotRecommendationResponse({
    this.data = const [],
  });

  factory BotRecommendationResponse.fromJson(Map<String, dynamic> json) =>
      _$BotRecommendationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotRecommendationResponseToJson(this);
}
