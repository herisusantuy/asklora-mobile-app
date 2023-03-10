import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../bloc/personal_info/personal_info_bloc.dart';

part 'personal_info_request.g.dart';

@JsonSerializable()
class PersonalInfoRequest extends Equatable {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? gender;
  @JsonKey(name: 'hkid_number')
  final String? hkIdNumber;

  final String? nationality;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;

  @JsonKey(name: 'country_of_birth')
  final String? countryOfBirth;

  @JsonKey(name: 'phone_country_code')
  final String? phoneCountryCode;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  const PersonalInfoRequest({
    this.firstName,
    this.lastName,
    this.gender,
    this.hkIdNumber,
    this.nationality,
    this.dateOfBirth,
    this.countryOfBirth,
    this.phoneCountryCode,
    this.phoneNumber,
  });

  static PersonalInfoRequest getRequestFromPersonalInfoState(BuildContext context) {
    final PersonalInfoState personalInfostate =
        context.read<PersonalInfoBloc>().state;

    return PersonalInfoRequest(
      firstName: personalInfostate.firstName,
      lastName: personalInfostate.lastName,
      gender: personalInfostate.gender,
      hkIdNumber: personalInfostate.hkIdNumber,
      nationality: context.read<PersonalInfoBloc>().state.nationalityCode,
      dateOfBirth: personalInfostate.dateOfBirth,
      countryOfBirth: context.read<PersonalInfoBloc>().state.countryCodeOfBirth,
      phoneCountryCode: context.read<PersonalInfoBloc>().state.phoneCountryCode,
      phoneNumber: personalInfostate.phoneNumber,
    );
  }

  factory PersonalInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoRequestToJson(this);

  @override
  List<Object> get props => [
        firstName ?? '',
        lastName ?? '',
        gender ?? '',
        hkIdNumber ?? '',
        nationality ?? '',
        dateOfBirth ?? '',
        countryOfBirth ?? '',
        phoneCountryCode ?? '',
        phoneNumber ?? '',
      ];
}
