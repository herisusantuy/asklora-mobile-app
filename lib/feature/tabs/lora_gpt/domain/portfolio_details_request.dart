import 'package:json_annotation/json_annotation.dart';

import 'query_request.dart';

@JsonSerializable()
class PortfolioDetailsRequest extends BaseQueryRequest {
  final String ticker;

  @JsonKey(name: 'user_id')
  final String userId;

  final String username;
  final String platform;

  @JsonKey(name: 'bot_type')
  final String botType;

  const PortfolioDetailsRequest.empty()
      : userId = '',
        ticker = '',
        username = '',
        platform = '',
        botType = '';

  const PortfolioDetailsRequest(
      {required String input,
      required this.userId,
      required this.ticker,
      required this.username,
      required this.platform,
      required this.botType})
      : super(input: input);

  Map<String, String> get params => {
        'input': input,
        'user_id': userId,
        'ticker': ticker,
        'username': username,
        'platform': platform,
        'bot_type': botType,
      };

  @override
  List<Object> get props => [input, userId, username, platform, botType];
}
