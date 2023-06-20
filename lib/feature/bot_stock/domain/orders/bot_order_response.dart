import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_utils.dart';

part 'bot_order_response.g.dart';

@JsonSerializable()
class BotOrderResponse {
  @JsonKey(name: 'bot_order')
  final String botOrder;
  @JsonKey(name: 'bot_action')
  final String? botAction;

  const BotOrderResponse({
    required this.botOrder,
    this.botAction,
  });

  factory BotOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BotOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BotOrderResponseToJson(this);
}

@JsonSerializable()
class TerminateOrderResponse {
  @JsonKey(name: 'optimal_time')
  final String optimalTime;

  TerminateOrderResponse(this.optimalTime);

  factory TerminateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$TerminateOrderResponseFromJson(json);

  String get optimalTimeFormatted =>
      formatDateTimeAsString(optimalTime, dateFormat: 'yyyy-MM-dd H:m:s');

  Map<String, dynamic> toJson() => _$TerminateOrderResponseToJson(this);
}

@JsonSerializable()
class RolloverOrderResponse extends BotOrderResponse {
  @JsonKey(name: 'new_expire_date')
  final String newExpireDate;

  RolloverOrderResponse(this.newExpireDate,
      {required super.botOrder, super.botAction});

  factory RolloverOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RolloverOrderResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RolloverOrderResponseToJson(this);
}
