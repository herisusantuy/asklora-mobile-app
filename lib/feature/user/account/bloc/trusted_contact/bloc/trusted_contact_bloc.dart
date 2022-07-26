import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/extensions.dart';

part 'trusted_contact_event.dart';

part 'trusted_contact_state.dart';

class TrustedContactBloc
    extends Bloc<TrustedContactEvent, TrustedContactState> {
  TrustedContactBloc() : super(const TrustedContactState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<EmailAddressChanged>(_onEmailAddressChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<TrustedContactSubmitted>(_onTrustedContactSubmitted);
  }

  void _onFirstNameChanged(
      FirstNameChanged event, Emitter<TrustedContactState> emit) {
    emit(
      state.copyWith(
          firstName: event.firstName,
          firstNameErrorText: event.firstName.isNotEmpty
              ? ''
              : 'First name trusted contact required'),
    );
  }

  void _onLastNameChanged(
      LastNameChanged event, Emitter<TrustedContactState> emit) {
    emit(
      state.copyWith(
          lastName: event.lastName,
          lastNameErrorText: event.lastName.isNotEmpty
              ? ''
              : 'Last name trusted contact required'),
    );
  }

  void _onEmailAddressChanged(
      EmailAddressChanged event, Emitter<TrustedContactState> emit) {
    emit(state.copyWith(
      emailAddress: event.emailAddress,
      emailErrorText: event.emailAddress.isEmpty
          ? 'Email address trusted contact required'
          : !event.emailAddress.isValidEmail()
              ? 'Enter valid email'
              : '',
    ));
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<TrustedContactState> emit) {
    emit(
      state.copyWith(
          phoneNumber: event.phoneNumber,
          phoneNumberErrorText: event.phoneNumber.isEmpty
              ? 'Phone Number trusted contact required'
              : event.phoneNumber.length < 8
                  ? 'Enter valid phone number'
                  : ''),
    );
  }

  void _onTrustedContactSubmitted(
      TrustedContactSubmitted event, Emitter<TrustedContactState> emit) {}
}
