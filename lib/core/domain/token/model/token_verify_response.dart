import 'package:json_annotation/json_annotation.dart';

part 'token_verify_response.g.dart';

@JsonSerializable()
class TokenVerifyResponse {
  String? detail;
  String? code;

  TokenVerifyResponse(
    this.detail,
    this.code,
  );

  factory TokenVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenVerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenVerifyResponseToJson(this);
}
