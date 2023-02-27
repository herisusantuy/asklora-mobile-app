import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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

  @JsonKey(name: 'phone_number_verified')
  final bool? phoneNumberVerified;

  @JsonKey(name: 'address_line_1')
  final String? addressLine1;

  @JsonKey(name: 'address_line_2')
  final String? addressLine2;

  final String? district;
  final String? region;

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
    this.phoneNumberVerified,
    this.addressLine1,
    this.addressLine2,
    this.district,
    this.region,
  });

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
        phoneNumberVerified ?? false,
        addressLine1 ?? '',
        addressLine2 ?? '',
        district ?? '',
        region ?? '',
      ];
}
