import 'package:json_annotation/json_annotation.dart';

part 'bot_create_order_response.g.dart';

@JsonSerializable()
class BotCreateOrderResponse {
  final String uid;
  final String name;
  @JsonKey(name: 'bot_apps_name')
  final String botAppsName;
  final String status;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final String symbol;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'is_dummy')
  final bool isDummy;
  @JsonKey(name: 'spot_date')
  final String spotDate;

  const BotCreateOrderResponse(
    this.uid,
    this.name,
    this.botAppsName,
    this.status,
    this.isActive,
    this.tickerName,
    this.isDummy,
    this.spotDate,
    this.symbol,
  );

  factory BotCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BotCreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotCreateOrderResponseToJson(this);
}
