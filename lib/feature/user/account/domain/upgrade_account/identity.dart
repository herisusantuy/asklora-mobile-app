import 'package:json_annotation/json_annotation.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {

  @JsonKey(name: 'given_name')
  String? givenName;

  @JsonKey(name: 'middle_name')
  String? middleName;

  @JsonKey(name: 'family_name')
  String? familyName;

  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;

  @JsonKey(name: 'tax_id')
  String? taxId;

  @JsonKey(name: 'tax_id_type')
  String? taxIdType;

  @JsonKey(name: 'country_of_citizenship')
  String? countryOfCitizenship;

  @JsonKey(name: 'country_of_birth')
  String? countryOfBirth;

  @JsonKey(name: 'country_of_tax_residence')
  String? countryOfTaxResidence;

  @JsonKey(name: 'funding_source')
  String? fundingSource;

  Identity(
      {this.givenName,
      this.middleName,
      this.familyName,
      this.dateOfBirth,
      this.taxId,
      this.taxIdType,
      this.countryOfCitizenship,
      this.countryOfBirth,
      this.countryOfTaxResidence,
      this.fundingSource});

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}
