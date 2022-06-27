import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOtpRequest {
  final String email;

  @JsonKey(name: 'otp_code')
  final String otpCode;

  VerifyOtpRequest(this.email, this.otpCode);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);
}
