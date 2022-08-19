part of 'trusted_contact_bloc.dart';

class TrustedContactState extends Equatable {
  final String firstName;
  final String firstNameErrorText;
  final String lastName;
  final String lastNameErrorText;
  final String emailAddress;
  final String emailErrorText;
  final String phoneNumber;
  final String phoneNumberErrorText;
  final String countryCode;

  const TrustedContactState({
    this.firstName = '',
    this.firstNameErrorText = '',
    this.lastName = '',
    this.lastNameErrorText = '',
    this.emailAddress = '',
    this.emailErrorText = '',
    this.phoneNumber = '',
    this.phoneNumberErrorText = '',
    this.countryCode = '',
  });

  TrustedContactState copyWith({
    String? firstName,
    String? firstNameErrorText,
    String? lastName,
    String? lastNameErrorText,
    String? emailAddress,
    String? emailErrorText,
    String? phoneNumber,
    String? phoneNumberErrorText,
    String? countryCode,
  }) {
    return TrustedContactState(
      firstName: firstName ?? this.firstName,
      firstNameErrorText: firstNameErrorText ?? this.firstNameErrorText,
      lastName: lastName ?? this.lastName,
      lastNameErrorText: lastNameErrorText ?? this.lastNameErrorText,
      emailAddress: emailAddress ?? this.emailAddress,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberErrorText: phoneNumberErrorText ?? this.phoneNumberErrorText,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  List<Object> get props => [
        firstName,
        firstNameErrorText,
        lastName,
        lastNameErrorText,
        emailAddress,
        emailErrorText,
        phoneNumber,
        phoneNumberErrorText,
        countryCode
      ];

  bool disableNextButton() {
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        emailAddress.isEmpty ||
        phoneNumber.isEmpty ||
        phoneNumberErrorText.isNotEmpty ||
        emailErrorText.isNotEmpty ||
        countryCode.isEmpty) {
      return true;
    }
    return false;
  }
}
