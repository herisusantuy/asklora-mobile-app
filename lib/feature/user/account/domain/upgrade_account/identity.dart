import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity extends Equatable {
  @JsonKey(name: 'given_name')
  final String? givenName;

  @JsonKey(name: 'middle_name')
  final String? middleName;

  @JsonKey(name: 'family_name')
  final String? familyName;

  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;

  @JsonKey(name: 'tax_id')
  final String? taxId;

  @JsonKey(name: 'tax_id_type')
  final String? taxIdType;

  @JsonKey(name: 'country_of_citizenship')
  final String? countryOfCitizenship;

  @JsonKey(name: 'country_of_birth')
  final String? countryOfBirth;

  @JsonKey(name: 'country_of_tax_residence')
  final String? countryOfTaxResidence;

  @JsonKey(name: 'funding_source')
  final String? fundingSource;

  const Identity(
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

  @override
  List<Object> get props => [
        givenName ?? '',
        middleName ?? '',
        familyName ?? '',
        dateOfBirth ?? '',
        taxId ?? '',
        taxIdType ?? '',
        countryOfCitizenship ?? '',
        countryOfBirth ?? '',
        countryOfTaxResidence ?? '',
        fundingSource ?? ''
      ];
}
