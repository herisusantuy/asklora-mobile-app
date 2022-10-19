part of 'upgrade_account_bloc.dart';

abstract class UpgradeAccountEvent extends Equatable {
  const UpgradeAccountEvent();

  @override
  List<Object> get props => [];
}

class UpgradeAccountFirstNameChanged extends UpgradeAccountEvent {
  final String firstName;

  const UpgradeAccountFirstNameChanged(this.firstName) : super();

  @override
  List<Object> get props => [firstName];
}

class UpgradeAccountMiddleNameChanged extends UpgradeAccountEvent {
  final String middleName;

  const UpgradeAccountMiddleNameChanged(this.middleName) : super();

  @override
  List<Object> get props => [middleName];
}

class UpgradeAccountLastNameChanged extends UpgradeAccountEvent {
  final String lastName;

  const UpgradeAccountLastNameChanged(this.lastName) : super();

  @override
  List<Object> get props => [lastName];
}

class UpgradeAccountChineseNameChanged extends UpgradeAccountEvent {
  final String chineseName;

  const UpgradeAccountChineseNameChanged(this.chineseName) : super();

  @override
  List<Object> get props => [chineseName];
}

class UpgradeAccountGenderChanged extends UpgradeAccountEvent {
  final Gender gender;

  const UpgradeAccountGenderChanged(this.gender) : super();

  @override
  List<Object> get props => [gender];
}

class UpgradeAccountDateOfBirthChanged extends UpgradeAccountEvent {
  final String dateOfBirth;

  const UpgradeAccountDateOfBirthChanged(this.dateOfBirth) : super();

  @override
  List<Object> get props => [dateOfBirth];
}

class UpgradeAccountCountryCodeChanged extends UpgradeAccountEvent {
  final String countryCode;

  const UpgradeAccountCountryCodeChanged(this.countryCode) : super();

  @override
  List<Object> get props => [countryCode];
}

class UpgradeAccountPhoneNumberChanged extends UpgradeAccountEvent {
  final String phoneNumber;

  const UpgradeAccountPhoneNumberChanged(this.phoneNumber) : super();

  @override
  List<Object> get props => [phoneNumber];
}

class UpgradeAccountCountryOfCitizenshipChanged extends UpgradeAccountEvent {
  final String countryOfCitizenship;

  const UpgradeAccountCountryOfCitizenshipChanged(this.countryOfCitizenship)
      : super();

  @override
  List<Object> get props => [countryOfCitizenship];
}

class UpgradeAccountIsHongKongResidentChanged extends UpgradeAccountEvent {
  final bool isHongKongResident;

  const UpgradeAccountIsHongKongResidentChanged(this.isHongKongResident)
      : super();

  @override
  List<Object> get props => [isHongKongResident];
}

class UpgradeAccountIsUnitedStateResidentChanged extends UpgradeAccountEvent {
  final bool isUnitedStateResident;

  const UpgradeAccountIsUnitedStateResidentChanged(this.isUnitedStateResident)
      : super();

  @override
  List<Object> get props => [isUnitedStateResident];
}
