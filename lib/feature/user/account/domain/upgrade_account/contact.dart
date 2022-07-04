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

  Contact copyWith({
    String? emailAddress,
    String? phoneNumber,
    String? streetAddress,
    String? unit,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) {
    return Contact(
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      streetAddress: streetAddress ?? this.streetAddress,
      unit: unit ?? this.unit,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }
}
