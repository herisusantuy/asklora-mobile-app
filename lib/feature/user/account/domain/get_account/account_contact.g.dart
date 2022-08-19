// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountContact _$AccountContactFromJson(Map<String, dynamic> json) =>
    AccountContact(
      email: json['email_address'] as String? ?? '',
      countryCode: json['phone_number_country_code'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      streetAddress: json['street_address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      unit: json['unit'] as String? ?? '',
      state: json['state'] as String? ?? '',
      postalCode: json['postal_code'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$AccountContactToJson(AccountContact instance) =>
    <String, dynamic>{
      'email_address': instance.email,
      'phone_number_country_code': instance.countryCode,
      'phone_number': instance.phoneNumber,
      'street_address': instance.streetAddress,
      'city': instance.city,
      'unit': instance.unit,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
    };
