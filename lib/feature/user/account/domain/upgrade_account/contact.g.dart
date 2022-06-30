// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      emailAddress: json['email_address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      streetAddress: json['street_address'] as String?,
      unit: json['unit'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'email_address': instance.emailAddress,
      'phone_number': instance.phoneNumber,
      'street_address': instance.streetAddress,
      'unit': instance.unit,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
    };
