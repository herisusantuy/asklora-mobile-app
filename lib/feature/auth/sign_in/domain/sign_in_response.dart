import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  String? access;
  String? detail;

  SignInResponse({
    this.access,
    this.detail,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}
