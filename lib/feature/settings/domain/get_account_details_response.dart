// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_account_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAccountDetailsResponse extends Equatable {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'personal_info')
  final PersonalInfo personalInfo;

  const GetAccountDetailsResponse({
    this.id = 0,
    this.username = '-',
    this.email = '-',
    this.personalInfo = const PersonalInfo(),
  });

  factory GetAccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountDetailsResponseToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class PersonalInfo {
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

  const PersonalInfo({
    this.firstName = '',
    this.lastName = '-',
    this.gender = '-',
    this.hkIdNumber = '-',
    this.nationality = '-',
    this.dateOfBirth = '-',
    this.countryOfBirth = '-',
    this.phoneCountryCode = '-',
    this.phoneNumber = '-',
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);

  @override
  String toString() {
    return 'PersonalInfo{firstName: $firstName, lastName: $lastName, gender: $gender, hkIdNumber: $hkIdNumber, nationality: $nationality, dateOfBirth: $dateOfBirth, countryOfBirth: $countryOfBirth, phoneCountryCode: $phoneCountryCode, phoneNumber: $phoneNumber}';
  }
}
