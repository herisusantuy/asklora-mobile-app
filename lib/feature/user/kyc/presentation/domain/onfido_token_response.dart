import 'package:json_annotation/json_annotation.dart';

part 'onfido_token_response.g.dart';

@JsonSerializable()
class OnfidoTokenResponse {
  final String token;

  OnfidoTokenResponse(this.token);

  factory OnfidoTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$OnfidoTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OnfidoTokenResponseToJson(this);
}
