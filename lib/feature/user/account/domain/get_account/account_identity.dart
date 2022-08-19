import 'package:json_annotation/json_annotation.dart';

part 'account_identity.g.dart';

@JsonSerializable()
class AccountIdentity {
  @JsonKey(name: 'given_name')
  final String givenName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'family_name')
  final String familyName;
  @JsonKey(name: 'chinese_name')
  final String? chineseName;
  @JsonKey(name: 'date_of_name')
  final String dateOfBirth;
  @JsonKey(name: 'tax_id')
  final String taxId;
  @JsonKey(name: 'tax_id_type')
  final String taxIdType;
  @JsonKey(name: 'country_of_residentship')
  final String countryOfResidentship;
  @JsonKey(name: 'country_of_citizenship')
  final String countryOfCitizenship;
  @JsonKey(name: 'country_of_birth')
  final String countryOfBirth;
  @JsonKey(name: 'country_of_tax_residence')
  final String countryOfTaxResidence;
  @JsonKey(name: 'funding_source')
  final String fundingSource;

  AccountIdentity({
    this.givenName = '',
    this.middleName = '',
    this.familyName = '',
    this.chineseName = '',
    this.dateOfBirth = '',
    this.taxId = '',
    this.taxIdType = '',
    this.countryOfResidentship = '',
    this.countryOfCitizenship = '',
    this.countryOfBirth = '',
    this.countryOfTaxResidence = '',
    this.fundingSource = '',
  });

  factory AccountIdentity.fromJson(Map<String, dynamic> json) =>
      _$AccountIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$AccountIdentityToJson(this);
}
