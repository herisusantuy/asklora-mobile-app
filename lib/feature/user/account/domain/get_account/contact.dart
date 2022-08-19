import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: 'email_address')
  final String email;
  @JsonKey(name: 'phone_number_country_code')
  final String? countryCode;
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

  Contact(
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.streetAddress,
    this.city,
    this.unit,
    this.state,
    this.postalCode,
    this.country,
  );

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
