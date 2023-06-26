import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'query_request.dart';

part 'portfolio_query_request.g.dart';

@JsonSerializable()
class PortfolioQueryRequest extends BaseQueryRequest {
  final String input;

  @JsonKey(name: 'user_id')
  final String userId;

  final String username;
  final String platform;

  @JsonKey(name: 'total_pnl')
  final double totalPnl;

  PortfolioQueryRequest.empty()
      : input = '',
        userId = '',
        username = '',
        platform = '',
        totalPnl = 0.0;

  PortfolioQueryRequest(
      {required this.input,
      required this.userId,
      required this.username,
      required this.platform,
      required this.totalPnl})
      : super();

  factory PortfolioQueryRequest.fromJson(Map<String, dynamic> json) =>
      _$PortfolioQueryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioQueryRequestToJson(this);

  Map<String, dynamic> get params => {
        'input': input,
        'user_id': userId,
        'username': username,
        'platform': platform,
        'total_pnl': totalPnl,
      };

  @override
  List<Object> get props => [input, userId, username, platform, totalPnl];

  PortfolioQueryRequest copyWith({
    String? input,
    String? userId,
    String? username,
    String? platform,
    double? totalPnl,
  }) {
    return PortfolioQueryRequest(
      input: input ?? this.input,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      platform: platform ?? this.platform,
      totalPnl: totalPnl ?? this.totalPnl,
    );
  }
}

@JsonSerializable()
class Botstock extends Equatable {
  final String ticker;
  @JsonKey(name: 'bot_type')
  final String botType;
  final String duration;
  @JsonKey(name: 'total_pnl')
  final String totalPnl;
  @JsonKey(name: 'expiry_date')
  final String expiryDate;

  const Botstock.empty()
      : ticker = '',
        botType = '',
        duration = '',
        totalPnl = '',
        expiryDate = '';

  const Botstock(
      {required this.ticker,
      required this.botType,
      required this.duration,
      required this.totalPnl,
      required this.expiryDate});

  factory Botstock.fromJson(Map<String, dynamic> json) =>
      _$BotstockFromJson(json);

  Map<String, dynamic> toJson() => _$BotstockToJson(this);

  @override
  List<Object> get props => [ticker, botType, duration, totalPnl, expiryDate];
}
