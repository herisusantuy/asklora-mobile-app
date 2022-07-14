import 'package:json_annotation/json_annotation.dart';

part 'tax_info_request.g.dart';

@JsonSerializable()
class TaxInfoRequest {
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'country_citizen')
  final String countryCitizen;
  @JsonKey(name: 'permanent_address_street')
  final String permanentAddressStreet;
  @JsonKey(name: 'permanent_address_city_state')
  final String permanentAddressCityState;
  @JsonKey(name: 'permanent_address_country')
  final String permanentAddressCountry;
  @JsonKey(name: 'mailing_address_street')
  final String? mailingAddressStreet;
  @JsonKey(name: 'mailing_address_city_state')
  final String? mailingAddressCityState;
  @JsonKey(name: 'mailing_address_country')
  final String? mailingAddressCountry;
  @JsonKey(name: 'foreign_tax_id')
  final String foreignTaxId;
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;
  final String signature;
  final String date;
  @JsonKey(name: 'signer_full_name')
  final String signerFullName;
  @JsonKey(name: 'ip_address')
  final String ipAddress;

  TaxInfoRequest({
    this.fullName = '',
    this.countryCitizen = '',
    this.permanentAddressStreet = '',
    this.permanentAddressCityState = '',
    this.permanentAddressCountry = '',
    this.mailingAddressStreet = '',
    this.mailingAddressCityState = '',
    this.mailingAddressCountry = '',
    this.foreignTaxId = '',
    this.dateOfBirth = '',
    this.signature = '',
    this.date = '',
    this.signerFullName = '',
    this.ipAddress = '',
  });

  factory TaxInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$TaxInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TaxInfoRequestToJson(this);
}
