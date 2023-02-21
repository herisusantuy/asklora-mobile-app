import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse extends Equatable {
  final String? access;
  final String? refresh;
  final String? userJourney;
  final String? detail;
  final int? statusCode;

  const SignInResponse(
      {this.access,
      this.refresh,
      this.userJourney = 'investment_style',
      this.detail,
      this.statusCode});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  SignInResponse copyWith({String? userJourney}) =>
      SignInResponse(access, refresh, userJourney: userJourney);

  @override
  List<Object?> get props => [access, refresh, userJourney, detail, statusCode];

  SignInResponse copyWith({
    String? access,
    String? refresh,
    String? userJourney,
    String? detail,
    int? statusCode,
  }) {
    return SignInResponse(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
      userJourney: userJourney ?? this.userJourney,
      detail: detail ?? this.detail,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
