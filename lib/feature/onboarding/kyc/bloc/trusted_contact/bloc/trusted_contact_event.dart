part of 'trusted_contact_bloc.dart';

abstract class TrustedContactEvent extends Equatable {
  const TrustedContactEvent();

  @override
  List<Object?> get props => [];
}

class FirstNameChanged extends TrustedContactEvent {
  final String firstName;

  const FirstNameChanged(this.firstName) : super();

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends TrustedContactEvent {
  final String lastName;

  const LastNameChanged(this.lastName) : super();

  @override
  List<Object> get props => [lastName];
}

class EmailAddressChanged extends TrustedContactEvent {
  final String emailAddress;

  const EmailAddressChanged(this.emailAddress) : super();

  @override
  List<Object> get props => [emailAddress];
}

class PhoneNumberChanged extends TrustedContactEvent {
  final String phoneNumber;

  const PhoneNumberChanged(this.phoneNumber) : super();

  @override
  List<Object> get props => [phoneNumber];
}

class CountryCodeChanged extends TrustedContactEvent {
  final String countryCode;

  const CountryCodeChanged(this.countryCode) : super();

  @override
  List<Object> get props => [countryCode];
}
