import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/kyc_dropdown_enum.dart';

part 'get_account_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAccountResponse extends Equatable {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'personal_info')
  final PersonalInfo? personalInfo;
  @JsonKey(name: 'residence_info')
  final ResidenceInfo? residenceInfo;
  @JsonKey(name: 'employment_info')
  final EmploymentInfo? employmentInfo;
  final List<Agreement> agreements;
  @JsonKey(name: 'last_journey')
  final LastJourney? lastJourney;
  @JsonKey(name: 'is_staff')
  final bool isStaff;

  const GetAccountResponse({
    this.id = 0,
    this.username = '',
    this.email = '',
    this.personalInfo,
    this.residenceInfo,
    this.employmentInfo,
    this.agreements = const [],
    this.lastJourney,
    this.isStaff = false,
  });

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountResponseToJson(this);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class PersonalInfo {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;
  final String gender;
  @JsonKey(name: 'hkid_number')
  final String hkIdNumber;

  final String nationality;
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;

  @JsonKey(name: 'country_of_birth')
  final String countryOfBirth;

  @JsonKey(name: 'phone_country_code')
  final String phoneCountryCode;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

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

@JsonSerializable()
class ResidenceInfo {
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? city;
  final String? country;
  @JsonKey(name: 'address_line_1')
  final String addressLine1;
  @JsonKey(name: 'address_line_2')
  final String? addressLine2;
  final String district;
  final String region;

  ResidenceInfo({
    this.postalCode,
    this.city,
    this.country,
    this.addressLine1 = '',
    this.addressLine2,
    this.district = '',
    this.region = '',
  });

  factory ResidenceInfo.fromJson(Map<String, dynamic> json) =>
      _$ResidenceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResidenceInfoToJson(this);

  @override
  String toString() {
    return 'ResidenceInfo(postalCode: $postalCode, city: $city, country: $country, addressLine1: $addressLine1, addressLine2: $addressLine2, district: $district, region: $region)';
  }
}

@JsonSerializable()
class EmploymentInfo {
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? city;
  final String? country;
  @JsonKey(name: 'employment_status')
  final EmploymentStatus employmentStatus;
  @JsonKey(name: 'employer_business')
  final String? employerBusiness;
  @JsonKey(name: 'employer_business_description')
  final String? employerBusinessDescription;
  final Occupations? occupation;
  @JsonKey(name: 'employer_address_line_1')
  final String? employerAddressLine1;
  @JsonKey(name: 'employer_address_line_2')
  final String? employerAddressLine2;
  final String? district;
  final String? region;
  @JsonKey(name: 'different_country_reason')
  final String? differentCountryReason;

  EmploymentInfo({
    this.postalCode,
    this.city,
    this.country,
    this.employmentStatus = EmploymentStatus.unknown,
    this.employerBusiness,
    this.employerBusinessDescription,
    this.occupation,
    this.employerAddressLine1,
    this.employerAddressLine2,
    this.district,
    this.region,
    this.differentCountryReason,
  });

  factory EmploymentInfo.fromJson(Map<String, dynamic> json) =>
      _$EmploymentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentInfoToJson(this);

  @override
  String toString() {
    return 'EmploymentInfo(postalCode: $postalCode, city: $city, country: $country, employmentStatus: $employmentStatus, employerBusiness: $employerBusiness, employerBusinessDescription: $employerBusinessDescription, occupation: $occupation, employerAddressLine1: $employerAddressLine1, employerAddressLine2: $employerAddressLine2, district: $district, region: $region, differentCountryReason: $differentCountryReason)';
  }
}

enum AgreementType {
  ma('MA'),
  aa('AA'),
  ca('CA'),
  aca('ACA'),
  rds('RDS'),
  w8ben('W8BEN');

  final String value;
  const AgreementType(this.value);
}

@JsonSerializable()
class Agreement {
  final AgreementType agreement;
  @JsonKey(name: 'signed_at')
  final String signedAt;
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  final String? signature;

  Agreement({
    this.agreement = AgreementType.w8ben,
    this.signedAt = '',
    this.ipAddress,
    this.signature,
  });

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementToJson(this);

  @override
  String toString() {
    return 'Agreement(agreement: $agreement, signedAt: $signedAt, ipAddress: $ipAddress, signature: $signature)';
  }
}

@JsonSerializable()
class LastJourney {
  @JsonKey(name: 'user_journey')
  final String userJourney;
  @JsonKey(name: 'data')
  final String? signature;

  LastJourney({
    this.userJourney = '',
    this.signature,
  });

  factory LastJourney.fromJson(Map<String, dynamic> json) =>
      _$LastJourneyFromJson(json);

  Map<String, dynamic> toJson() => _$LastJourneyToJson(this);

  @override
  String toString() =>
      'LastJourney(userJourney: $userJourney, signature: $signature)';
}
