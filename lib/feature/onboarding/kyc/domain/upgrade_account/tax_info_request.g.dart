// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxInfoRequest _$TaxInfoRequestFromJson(Map<String, dynamic> json) =>
    TaxInfoRequest(
      fullName: json['full_name'] as String? ?? '',
      countryCitizen: json['country_citizen'] as String? ?? '',
      permanentAddressStreet: json['permanent_address_street'] as String? ?? '',
      permanentAddressCityState:
          json['permanent_address_city_state'] as String? ?? '',
      permanentAddressCountry:
          json['permanent_address_country'] as String? ?? '',
      mailingAddressStreet: json['mailing_address_street'] as String? ?? '',
      mailingAddressCityState:
          json['mailing_address_city_state'] as String? ?? '',
      mailingAddressCountry: json['mailing_address_country'] as String? ?? '',
      foreignTaxId: json['foreign_tax_id'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] as String? ?? '',
      signature: json['signature'] as String? ?? '',
      date: json['date'] as String? ?? '',
      signerFullName: json['signer_full_name'] as String? ?? '',
      ipAddress: json['ip_address'] as String? ?? '',
    );

Map<String, dynamic> _$TaxInfoRequestToJson(TaxInfoRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'country_citizen': instance.countryCitizen,
      'permanent_address_street': instance.permanentAddressStreet,
      'permanent_address_city_state': instance.permanentAddressCityState,
      'permanent_address_country': instance.permanentAddressCountry,
      'mailing_address_street': instance.mailingAddressStreet,
      'mailing_address_city_state': instance.mailingAddressCityState,
      'mailing_address_country': instance.mailingAddressCountry,
      'foreign_tax_id': instance.foreignTaxId,
      'date_of_birth': instance.dateOfBirth,
      'signature': instance.signature,
      'date': instance.date,
      'signer_full_name': instance.signerFullName,
      'ip_address': instance.ipAddress,
    };
