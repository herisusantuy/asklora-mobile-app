import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String detail;

  SignUpResponse(this.detail);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
