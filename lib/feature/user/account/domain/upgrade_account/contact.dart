import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: 'email_address')
  String? emailAddress;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'street_address')
  String? streetAddress;

  String? unit;

  String? city;

  String? state;

  @JsonKey(name: 'postal_code')
  String? postalCode;

  String? country;

  Contact(
      {this.emailAddress,
      this.phoneNumber,
      this.streetAddress,
      this.unit,
      this.city,
      this.state,
      this.postalCode,
      this.country});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
