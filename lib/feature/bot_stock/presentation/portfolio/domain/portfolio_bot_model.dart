import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio_bot_model.g.dart';

@JsonSerializable()
class PortfolioBotModel extends Equatable {
  final int id;
  @JsonKey(name: 'bot_id')
  final String botId;
  @JsonKey(name: 'bot_word')
  final String? botWord;
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
  final String? expiredDate;

  const PortfolioBotModel(
    this.id,
    this.botId,
    this.botWord,
    this.botType,
    this.botAppType,
    this.ticker,
    this.tickerName,
    this.tickerSymbol,
    this.latestPrice,
    this.amount, {
    this.expiredDate,
    this.freeBot = false,
    this.selectable = false,
  });

  factory PortfolioBotModel.fromJson(Map<String, dynamic> json) =>
      _$PortfolioBotModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioBotModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        botId,
        botWord,
        botType,
        botAppType,
        ticker,
        tickerName,
        tickerSymbol,
        latestPrice,
        expiredDate
      ];
}
