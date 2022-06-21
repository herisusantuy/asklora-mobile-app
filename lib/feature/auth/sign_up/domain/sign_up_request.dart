import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String email;
  final String password;

  SignUpRequest(this.email, this.password);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
