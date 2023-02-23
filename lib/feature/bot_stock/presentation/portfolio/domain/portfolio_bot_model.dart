import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_bot_model.g.dart';

@JsonSerializable()
class PortfolioBotModel extends Equatable {
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
  final double amount;

  const PortfolioBotModel(
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
    this.amount, {
    this.freeBot = false,
    this.selectable = false,
  });

  factory PortfolioBotModel.fromJson(Map<String, dynamic> json) =>
      _$PortfolioBotModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioBotModelToJson(this);

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
