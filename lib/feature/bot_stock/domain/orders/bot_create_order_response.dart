import 'package:json_annotation/json_annotation.dart';

part 'bot_create_order_response.g.dart';

@JsonSerializable()
class BotCreateOrderResponse {
  @JsonKey(name: 'bot_order')
  final String botOrder;
  @JsonKey(name: 'bot_action')
  final String botAction;

  const BotCreateOrderResponse({
    required this.botOrder,
    required this.botAction,
  });

  factory BotCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BotCreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotCreateOrderResponseToJson(this);
}
