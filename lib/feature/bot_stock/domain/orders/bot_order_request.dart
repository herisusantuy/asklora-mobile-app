import 'package:json_annotation/json_annotation.dart';

part 'bot_order_request.g.dart';

@JsonSerializable()
class BotOrderRequest {
  @JsonKey(name: 'order_id')
  final String orderId;

  @JsonKey(name: 'order_type')
  final String orderType;

  const BotOrderRequest({required this.orderId, this.orderType = 'POOL'});

  factory BotOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$BotOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BotOrderRequestToJson(this);
}
