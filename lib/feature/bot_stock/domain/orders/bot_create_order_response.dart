import 'package:json_annotation/json_annotation.dart';

part 'bot_create_order_response.g.dart';

@JsonSerializable()
class BotCreateOrderResponse {
  final String uid;
  final String name;
  final String status;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'total_pnl_amt')
  final double totalPnLAmt;
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

  const BotCreateOrderResponse(
    this.uid,
    this.name,
    this.status,
    this.isActive,
    this.totalPnLAmt,
    this.expireDate,
    this.tickerName,
    this.currentPrice,
    this.isDummy,
    this.spotDate,
    this.ticker,
  );

  factory BotCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BotCreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotCreateOrderResponseToJson(this);
}
