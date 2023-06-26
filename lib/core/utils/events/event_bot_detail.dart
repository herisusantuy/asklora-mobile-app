import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_bot_detail.g.dart';

@JsonSerializable()
class EventBotDetail extends Equatable {
  final String ticker;
  @JsonKey(name: 'bot_type')
  final String botType;
  final String duration;
  @JsonKey(name: 'total_pnl')
  final String totalPnl;
  @JsonKey(name: 'expiry_date')
  final String expiryDate;

  const EventBotDetail(
      {required this.ticker,
      required this.botType,
      required this.duration,
      required this.totalPnl,
      required this.expiryDate});

  factory EventBotDetail.fromJson(Map<String, dynamic> json) =>
      _$EventBotDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EventBotDetailToJson(this);

  @override
  List<Object> get props => [ticker, botType, duration, totalPnl, expiryDate];
}
