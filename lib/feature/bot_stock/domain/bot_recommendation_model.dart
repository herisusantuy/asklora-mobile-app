import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bot_recommendation_model.g.dart';

@JsonSerializable()
class BotRecommendationModel extends Equatable {
  final int id;
  final String suitability;
  final String benefit;
  @JsonKey(name: 'bot_id')
  final String botId;
  @JsonKey(name: 'bot_word')
  final String botWord;
  @JsonKey(name: 'bot_type')
  final String botType;
  @JsonKey(name: 'bot_app_type')
  final String botAppType;
  final String ticker;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'ticker_symbol')
  final String tickerSymbol;
  @JsonKey(name: 'latest_price')
  final String latestPrice;
  final bool freeBot;
  final bool selectable;

  const BotRecommendationModel(
      this.id,
      this.suitability,
      this.benefit,
      this.botId,
      this.botWord,
      this.botType,
      this.botAppType,
      this.ticker,
      this.tickerName,
      this.tickerSymbol,
      this.latestPrice,
      {this.freeBot = false,
      this.selectable = false});

  BotRecommendationModel copyWith({bool? freeBot}) => BotRecommendationModel(
      id,
      suitability,
      benefit,
      botId,
      botWord,
      botType,
      botAppType,
      ticker,
      tickerName,
      tickerSymbol,
      latestPrice,
      freeBot: freeBot ?? this.freeBot);

  factory BotRecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$BotRecommendationModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotRecommendationModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        suitability,
        benefit,
        botId,
        botWord,
        botType,
        botAppType,
        ticker,
        tickerName,
        tickerSymbol,
        latestPrice
      ];
}
