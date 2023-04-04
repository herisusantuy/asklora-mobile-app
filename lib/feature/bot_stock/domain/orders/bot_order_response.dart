import 'package:json_annotation/json_annotation.dart';

part 'bot_order_response.g.dart';

@JsonSerializable()
class BotOrderResponse {
  @JsonKey(name: 'bot_order')
  final String botOrder;
  @JsonKey(name: 'bot_action')
  final String botAction;
  @JsonKey(name: 'optimal_time')
  final String? optimalTime;

  const BotOrderResponse(
      {required this.botOrder, required this.botAction, this.optimalTime});

  factory BotOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BotOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotOrderResponseToJson(this);
}
