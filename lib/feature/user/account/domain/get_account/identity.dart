import 'package:json_annotation/json_annotation.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {
  final String givenName;
  final String middleName;
  final String familyName;
  final String chineseNAme;
  final String dateOfBirth;
  final String taxId;
  final String taxIdType;
  final String countryOfResidentship;
  final String countryOfCitizenship;
  final String countryOfBirth;
  final String countryOfTaxResidence;
  final String fundingSource;

  Identity({
    this.givenName = '',
    this.middleName = '',
    this.familyName = '',
    this.chineseNAme = '',
    this.dateOfBirth = '',
    this.taxId = '',
    this.taxIdType = '',
    this.countryOfResidentship = '',
    this.countryOfCitizenship = '',
    this.countryOfBirth = '',
    this.countryOfTaxResidence = '',
    this.fundingSource = '',
  });

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}
