// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountResponse _$GetAccountResponseFromJson(Map<String, dynamic> json) =>
    GetAccountResponse(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      personalInfo: json['personal_info'] == null
          ? null
          : PersonalInfo.fromJson(
              json['personal_info'] as Map<String, dynamic>),
      residenceInfo: json['residence_info'] == null
          ? null
          : ResidenceInfo.fromJson(
              json['residence_info'] as Map<String, dynamic>),
      employmentInfo: json['employment_info'] == null
          ? null
          : EmploymentInfo.fromJson(
              json['employment_info'] as Map<String, dynamic>),
      agreements: (json['agreements'] as List<dynamic>?)
              ?.map((e) => Agreement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastJourney: json['last_journey'] == null
          ? null
          : LastJourney.fromJson(json['last_journey'] as Map<String, dynamic>),
      isStaff: json['is_staff'] as bool? ?? false,
    );

Map<String, dynamic> _$GetAccountResponseToJson(GetAccountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'personal_info': instance.personalInfo?.toJson(),
      'residence_info': instance.residenceInfo?.toJson(),
      'employment_info': instance.employmentInfo?.toJson(),
      'agreements': instance.agreements.map((e) => e.toJson()).toList(),
      'last_journey': instance.lastJourney?.toJson(),
      'is_staff': instance.isStaff,
    };

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '-',
      gender: json['gender'] as String? ?? '-',
      hkIdNumber: json['hkid_number'] as String? ?? '-',
      nationality: json['nationality'] as String? ?? '-',
      dateOfBirth: json['date_of_birth'] as String? ?? '-',
      countryOfBirth: json['country_of_birth'] as String? ?? '-',
      phoneCountryCode: json['phone_country_code'] as String? ?? '-',
      phoneNumber: json['phone_number'] as String? ?? '-',
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'hkid_number': instance.hkIdNumber,
      'nationality': instance.nationality,
      'date_of_birth': instance.dateOfBirth,
      'country_of_birth': instance.countryOfBirth,
      'phone_country_code': instance.phoneCountryCode,
      'phone_number': instance.phoneNumber,
    };

ResidenceInfo _$ResidenceInfoFromJson(Map<String, dynamic> json) =>
    ResidenceInfo(
      postalCode: json['postal_code'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      addressLine1: json['address_line_1'] as String? ?? '',
      addressLine2: json['address_line_2'] as String?,
      district: json['district'] as String? ?? '',
      region: json['region'] as String? ?? '',
    );

Map<String, dynamic> _$ResidenceInfoToJson(ResidenceInfo instance) =>
    <String, dynamic>{
      'postal_code': instance.postalCode,
      'city': instance.city,
      'country': instance.country,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'district': instance.district,
      'region': instance.region,
    };

EmploymentInfo _$EmploymentInfoFromJson(Map<String, dynamic> json) =>
    EmploymentInfo(
      postalCode: json['postal_code'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      employmentStatus: $enumDecodeNullable(
              _$EmploymentStatusEnumMap, json['employment_status']) ??
          EmploymentStatus.unknown,
      employerBusiness: json['employer_business'] as String?,
      employerBusinessDescription:
          json['employer_business_description'] as String?,
      occupation: $enumDecodeNullable(_$OccupationsEnumMap, json['occupation']),
      employerAddressLine1: json['employer_address_line_1'] as String?,
      employerAddressLine2: json['employer_address_line_2'] as String?,
      district: json['district'] as String?,
      region: json['region'] as String?,
      differentCountryReason: json['different_country_reason'] as String?,
    );

Map<String, dynamic> _$EmploymentInfoToJson(EmploymentInfo instance) =>
    <String, dynamic>{
      'postal_code': instance.postalCode,
      'city': instance.city,
      'country': instance.country,
      'employment_status':
          _$EmploymentStatusEnumMap[instance.employmentStatus]!,
      'employer_business': instance.employerBusiness,
      'employer_business_description': instance.employerBusinessDescription,
      'occupation': _$OccupationsEnumMap[instance.occupation],
      'employer_address_line_1': instance.employerAddressLine1,
      'employer_address_line_2': instance.employerAddressLine2,
      'district': instance.district,
      'region': instance.region,
      'different_country_reason': instance.differentCountryReason,
    };

const _$EmploymentStatusEnumMap = {
  EmploymentStatus.unemployed: 'unemployed',
  EmploymentStatus.employed: 'employed',
  EmploymentStatus.selfEmployed: 'selfEmployed',
  EmploymentStatus.retired: 'retired',
  EmploymentStatus.student: 'student',
  EmploymentStatus.atHomeTrader: 'atHomeTrader',
  EmploymentStatus.homemaker: 'homemaker',
  EmploymentStatus.unknown: 'unknown',
};

const _$OccupationsEnumMap = {
  Occupations.accountant: 'accountant',
  Occupations.analyst: 'analyst',
  Occupations.architect: 'architect',
  Occupations.attorney: 'attorney',
  Occupations.auditor: 'auditor',
  Occupations.businessOwner: 'businessOwner',
  Occupations.ceo: 'ceo',
  Occupations.cashier: 'cashier',
  Occupations.collectionsAgent: 'collectionsAgent',
  Occupations.complianceOfficer: 'complianceOfficer',
  Occupations.computerProgrammer: 'computerProgrammer',
  Occupations.courier: 'courier',
  Occupations.customerServiceRepresentative: 'customerServiceRepresentative',
  Occupations.databaseAdministrator: 'databaseAdministrator',
  Occupations.doctor: 'doctor',
  Occupations.director: 'director',
  Occupations.engineer: 'engineer',
  Occupations.entrepreneur: 'entrepreneur',
  Occupations.executive: 'executive',
  Occupations.humanResources: 'humanResources',
  Occupations.insuranceAgent: 'insuranceAgent',
  Occupations.lawyer: 'lawyer',
  Occupations.legalAssistant: 'legalAssistant',
  Occupations.manager: 'manager',
  Occupations.managingDirector: 'managingDirector',
  Occupations.nurse: 'nurse',
  Occupations.paralegal: 'paralegal',
  Occupations.president: 'president',
  Occupations.projectManager: 'projectManager',
  Occupations.realEstateAgent: 'realEstateAgent',
  Occupations.retail: 'retail',
  Occupations.recruiter: 'recruiter',
  Occupations.salesRepresentative: 'salesRepresentative',
  Occupations.teacher: 'teacher',
  Occupations.other: 'other',
};

Agreement _$AgreementFromJson(Map<String, dynamic> json) => Agreement(
      agreement:
          $enumDecodeNullable(_$AgreementTypeEnumMap, json['agreement']) ??
              AgreementType.w8ben,
      signedAt: json['signed_at'] as String? ?? '',
      ipAddress: json['ip_address'] as String?,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$AgreementToJson(Agreement instance) => <String, dynamic>{
      'agreement': _$AgreementTypeEnumMap[instance.agreement]!,
      'signed_at': instance.signedAt,
      'ip_address': instance.ipAddress,
      'signature': instance.signature,
    };

const _$AgreementTypeEnumMap = {
  AgreementType.ma: 'ma',
  AgreementType.aa: 'aa',
  AgreementType.ca: 'ca',
  AgreementType.aca: 'aca',
  AgreementType.rds: 'rds',
  AgreementType.w8ben: 'w8ben',
};

LastJourney _$LastJourneyFromJson(Map<String, dynamic> json) => LastJourney(
      userJourney: json['user_journey'] as String? ?? '',
      signature: json['data'] as String?,
    );

Map<String, dynamic> _$LastJourneyToJson(LastJourney instance) =>
    <String, dynamic>{
      'user_journey': instance.userJourney,
      'data': instance.signature,
    };
