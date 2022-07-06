import 'package:json_annotation/json_annotation.dart';

part 'token_refresh_response.g.dart';

@JsonSerializable()
class TokenRefreshResponse {
  String? access;

  TokenRefreshResponse(
    this.access,
  );

  factory TokenRefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenRefreshResponseToJson(this);
}
