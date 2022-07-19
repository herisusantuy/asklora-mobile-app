import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class SignUpResponse extends Equatable {
  final String detail;

  const SignUpResponse(this.detail);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

  @override
  List<Object?> get props => [detail];
}

@JsonSerializable()
class GetOtpResponse {
  String detail;

  GetOtpResponse(this.detail);

  factory GetOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOtpResponseToJson(this);
}
