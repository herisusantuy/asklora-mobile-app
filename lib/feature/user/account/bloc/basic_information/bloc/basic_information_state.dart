part of 'basic_information_bloc.dart';

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
    this.countryNameOfCitizenship = '',
    this.isHongKongPermanentResident,
    this.idNumber = '',
    this.isUnitedStateResident,
    this.isHkIdValid = false,
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
  final String countryNameOfCitizenship;
  final bool? isHongKongPermanentResident;
  final String idNumber;
  final bool? isUnitedStateResident;
  final bool isHkIdValid;

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
      countryNameOfCitizenship,
      isHongKongPermanentResident,
      idNumber,
      isUnitedStateResident,
      isHkIdValid,
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
    String? countryNameOfCitizenship,
    bool? isHongKongPermanentResident,
    String? idNumber,
    bool? isUnitedStateResident,
    bool? isHkIdValid,
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
      countryNameOfCitizenship:
          countryNameOfCitizenship ?? this.countryNameOfCitizenship,
      isHongKongPermanentResident:
          isHongKongPermanentResident ?? this.isHongKongPermanentResident,
      idNumber: idNumber ?? this.idNumber,
      isUnitedStateResident:
          isUnitedStateResident ?? this.isUnitedStateResident,
      isHkIdValid: isHkIdValid ?? this.isHkIdValid,
    );
  }

  bool enableNextButton() {
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        gender.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        countryCode.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        countryOfCitizenship.isNotEmpty &&
        isHongKongPermanentResident != null &&
        isUnitedStateResident != null) {
      if (isHongKongPermanentResident == true) {
        if (idNumber.isNotEmpty && isHkIdValid) {
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
