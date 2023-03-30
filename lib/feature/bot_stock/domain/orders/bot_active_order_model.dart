import 'package:json_annotation/json_annotation.dart';

part 'bot_active_order_model.g.dart';

@JsonSerializable()
class BotActiveOrderModel {
  final String pk;
  @JsonKey(name: 'bot_id')
  final String botId;
  @JsonKey(name: 'expire_date')
  final String expireDate;
  @JsonKey(name: 'is_active')
  final String isActive;
  final String ticker;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  final String status;
  @JsonKey(name: 'current_pnl_ret')
  final dynamic? currentPnlRet;
  @JsonKey(name: 'current_price')
  final dynamic currentPrice;
  @JsonKey(name: 'bot_apps_name')
  final String botAppsName;

  const BotActiveOrderModel(
      this.pk,
      this.botId,
      this.expireDate,
      this.isActive,
      this.ticker,
      this.tickerName,
      this.status,
      this.currentPnlRet,
      this.currentPrice,
  {this.botAppsName = 'Pull Up'});

  factory BotActiveOrderModel.fromJson(Map<String, dynamic> json) =>
      _$BotActiveOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotActiveOrderModelToJson(this);
}
