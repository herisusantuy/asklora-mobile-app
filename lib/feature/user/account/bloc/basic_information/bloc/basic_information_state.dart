part of 'basic_information_bloc.dart';

enum Gender { female, male, other, unknown }

class BasicInformationState extends Equatable {
  const BasicInformationState({
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.chineseName = '',
    this.gender = '',
    this.dateOfBirth = '1990-01-01',
    this.countryCode = '',
    this.phoneNumber = '',
    this.countryOfCitizenship = '',
    this.isHongkongPermanentResident = true,
    this.isUnitedStateResident = false,
  });

  final String firstName;
  final String middleName;
  final String lastName;
  final String chineseName;
  final String gender;
  final String dateOfBirth;
  final String countryCode;
  final String phoneNumber;
  final String countryOfCitizenship;
  final bool isHongkongPermanentResident;
  final bool isUnitedStateResident;

  @override
  List<Object> get props {
    return [
      firstName,
      middleName,
      lastName,
      chineseName,
      gender,
      dateOfBirth,
      countryCode,
      phoneNumber,
      countryOfCitizenship,
      isHongkongPermanentResident,
      isUnitedStateResident,
    ];
  }

  BasicInformationState copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? chineseName,
    String? gender,
    String? dateOfBirth,
    String? countryCode,
    String? phoneNumber,
    String? countryOfCitizenship,
    bool? isHongkongPermanentResident,
    bool? isUnitedStateResident,
  }) {
    return BasicInformationState(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      chineseName: chineseName ?? this.chineseName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryOfCitizenship: countryOfCitizenship ?? this.countryOfCitizenship,
      isHongkongPermanentResident:
          isHongkongPermanentResident ?? this.isHongkongPermanentResident,
      isUnitedStateResident:
          isUnitedStateResident ?? this.isUnitedStateResident,
    );
  }
}
