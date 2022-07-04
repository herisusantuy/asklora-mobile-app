part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {}

class UpgradeAccount extends AccountEvent {
  final UpgradeAccountRequest? upgradeAccountRequest;

  const UpgradeAccount(this.upgradeAccountRequest);
}

class AccountFieldChanged extends AccountEvent {
  final String object;
  final String key;
  final String value;
  const AccountFieldChanged({
    required this.object,
    required this.key,
    required this.value,
  }) : super();

  @override
  List<Object> get props => [object, key, value];
}

class GetSdkToken extends AccountEvent {}

class AccountFirstNameChanged extends AccountEvent {
  final String firstName;
  const AccountFirstNameChanged(this.firstName) : super();
  @override
  List<Object> get props => [firstName];
}

class AccountMiddleNameChanged extends AccountEvent {
  final String middleName;
  const AccountMiddleNameChanged(this.middleName) : super();
  @override
  List<Object> get props => [middleName];
}

class AccountLastNameChanged extends AccountEvent {
  final String lastName;
  const AccountLastNameChanged(this.lastName) : super();
  @override
  List<Object> get props => [lastName];
}

class AccountChineseNameChanged extends AccountEvent {
  final String chineseName;
  const AccountChineseNameChanged(this.chineseName) : super();
  @override
  List<Object> get props => [chineseName];
}

class AccountGenderChanged extends AccountEvent {
  final Gender gender;
  const AccountGenderChanged(this.gender) : super();
  @override
  List<Object> get props => [gender];
}

class AccountDateOfBirthChanged extends AccountEvent {
  final String dateOfBirth;
  const AccountDateOfBirthChanged(this.dateOfBirth) : super();
  @override
  List<Object> get props => [dateOfBirth];
}

class AccountCountryCodeChanged extends AccountEvent {
  final String countryCode;
  const AccountCountryCodeChanged(this.countryCode) : super();
  @override
  List<Object> get props => [countryCode];
}

class AccountPhoneNumberChanged extends AccountEvent {
  final String phoneNumber;
  const AccountPhoneNumberChanged(this.phoneNumber) : super();
  @override
  List<Object> get props => [phoneNumber];
}

class AccountCountryOfCitizenshipChanged extends AccountEvent {
  final String countryOfCitizenship;
  const AccountCountryOfCitizenshipChanged(this.countryOfCitizenship) : super();
  @override
  List<Object> get props => [countryOfCitizenship];
}

class AccountIsHongKongResidentChanged extends AccountEvent {
  final bool isHongKongResident;
  const AccountIsHongKongResidentChanged(this.isHongKongResident) : super();
  @override
  List<Object> get props => [isHongKongResident];
}

class AccountIsUnitedStateResidentChanged extends AccountEvent {
  final bool isUnitedStateResident;
  const AccountIsUnitedStateResidentChanged(this.isUnitedStateResident)
      : super();
  @override
  List<Object> get props => [isUnitedStateResident];
}
