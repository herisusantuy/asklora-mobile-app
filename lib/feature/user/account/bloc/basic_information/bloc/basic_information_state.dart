part of 'basic_information_bloc.dart';

class BasicInformationState extends Equatable {
  const BasicInformationState({
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.chineseName = '',
    this.gender = '',
    this.dateOfBirth = '',
    this.countryCode = '',
    this.phoneNumber = '',
    this.countryOfCitizenship = '',
    this.isHongKongPermanentResident,
    this.idNumber = '',
    this.isUnitedStateResident,
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
  final bool? isHongKongPermanentResident;
  final String idNumber;
  final bool? isUnitedStateResident;

  @override
  List<Object?> get props {
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
      isHongKongPermanentResident,
      idNumber,
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
    bool? isHongKongPermanentResident,
    String? idNumber,
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
      isHongKongPermanentResident:
          isHongKongPermanentResident ?? this.isHongKongPermanentResident,
      idNumber: idNumber ?? this.idNumber,
      isUnitedStateResident:
          isUnitedStateResident ?? this.isUnitedStateResident,
    );
  }

  bool enableNextButton() {
    if (firstName.isNotEmpty &&
        middleName.isNotEmpty &&
        lastName.isNotEmpty &&
        chineseName.isNotEmpty &&
        gender.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        countryCode.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        countryOfCitizenship.isNotEmpty) {
      if (isHongKongPermanentResident == true) {
        if (idNumber.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
