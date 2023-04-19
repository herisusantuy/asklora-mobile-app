class QueryRequest {
  final String input;
  final String userId;
  final String username;
  final String platform;
  final String sessionId;

  QueryRequest(
      {required this.input,
      this.userId = 'user_id',
      this.username = 'username',
      this.platform = 'mobile_app',
      required this.sessionId});

  Map<String, String> get params => {
        'input': input,
        'user_id': userId,
        'username': username,
        'platform': platform,
        'session_id': sessionId
      };
}
