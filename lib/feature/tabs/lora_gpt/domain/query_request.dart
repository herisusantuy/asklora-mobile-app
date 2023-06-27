import 'package:equatable/equatable.dart';

abstract class BaseQueryRequest extends Equatable {}

class GeneralQueryRequest extends BaseQueryRequest {
  final String input;
  final String userId;
  final String username;
  final String platform;
  final String sessionId;

  GeneralQueryRequest(
      {required this.input,
      this.userId = 'user_id',
      this.username = 'testing user',
      this.platform = 'mobile_app',
      required this.sessionId});

  Map<String, String> get params => {
        'input': input,
        'user_id': userId,
        'username': username,
        'platform': platform,

        /// TODO: enable session if needed.
        // 'session_id': sessionId
      };

  @override
  List<Object?> get props => [input, userId, username, platform, sessionId];
}
