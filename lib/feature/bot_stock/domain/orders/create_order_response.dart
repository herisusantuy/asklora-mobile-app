import 'package:json_annotation/json_annotation.dart';

part 'create_order_response.g.dart';

@JsonSerializable()
class BotOrderResponse {
  final String uid;
  final String name;
  final String status;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'total_pnl')
  final double totalPnL;
  @JsonKey(name: 'expire_date')
  final String? expireDate;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @JsonKey(name: 'is_dummy')
  final bool isDummy;
  @JsonKey(name: 'spot_date')
  final String spotDate;
  final String ticker;

  ///todo : later menyesuaikan endpoint response

  final String optimalTime;
  final String newExpireDate;

  const BotOrderResponse(
    this.uid,
    this.name,
    this.status,
    this.isActive,
    this.totalPnL,
    this.expireDate,
    this.tickerName,
    this.currentPrice,
    this.isDummy,
    this.spotDate,
    this.ticker,
    this.optimalTime,
    this.newExpireDate,
  );

  factory BotOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BotOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotOrderResponseToJson(this);
}
