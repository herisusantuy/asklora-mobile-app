import 'package:json_annotation/json_annotation.dart';

part 'account_contact.g.dart';

@JsonSerializable()
class AccountContact {
  @JsonKey(name: 'email_address')
  final String email;
  @JsonKey(name: 'phone_number_country_code')
  final String countryCode;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  final String city;
  final String unit;
  final String state;
  @JsonKey(name: 'postal_code')
  final String postalCode;
  final String country;

  AccountContact({
    this.email = '',
    this.countryCode = '',
    this.phoneNumber = '',
    this.streetAddress = '',
    this.city = '',
    this.unit = '',
    this.state = '',
    this.postalCode = '',
    this.country = '',
  });

  factory AccountContact.fromJson(Map<String, dynamic> json) =>
      _$AccountContactFromJson(json);

  Map<String, dynamic> toJson() => _$AccountContactToJson(this);
}
