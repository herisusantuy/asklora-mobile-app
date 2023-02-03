import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../app/bloc/app_bloc.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse extends Equatable {
  final String access;
  final String refresh;
  final String userJourney;

  const SignInResponse(this.access, this.refresh, this.userJourney);

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  @override
  List<Object?> get props => [access, refresh, userJourney];
}
