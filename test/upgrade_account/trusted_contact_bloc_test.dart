import 'package:asklora_mobile_app/feature/user/account/bloc/trusted_contact/bloc/trusted_contact_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Trusted Contact Bloc Tests', () {
    late TrustedContactBloc trustedContactBloc;

    setUp(() async {
      trustedContactBloc = TrustedContactBloc();
    });

    test('Trusted Contact init state data should be `false`', () {
      expect(
          trustedContactBloc.state,
          const TrustedContactState(
            firstName: '',
            firstNameErrorText: '',
            lastName: '',
            lastNameErrorText: '',
            emailAddress: '',
            emailErrorText: '',
            phoneNumber: '',
            phoneNumberErrorText: '',
          ));
    });
    blocTest<TrustedContactBloc, TrustedContactState>('fill firstName input',
        build: () {
          return trustedContactBloc;
        },
        act: (bloc) {
          bloc.add(const FirstNameChanged('alex'));
        },
        expect: () => {
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: '',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              )
            });
    blocTest<TrustedContactBloc, TrustedContactState>(
        'fill fistName and lastName input',
        build: () {
          return trustedContactBloc;
        },
        act: (bloc) {
          bloc.add(const FirstNameChanged('alex'));
          bloc.add(const LastNameChanged('graham'));
        },
        expect: () => {
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: '',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              )
            });
    blocTest<TrustedContactBloc, TrustedContactState>(
        'fill fistName, lastName, and wrong emailAddress input',
        build: () {
          return trustedContactBloc;
        },
        act: (bloc) {
          bloc.add(const FirstNameChanged('alex'));
          bloc.add(const LastNameChanged('graham'));
          bloc.add(const EmailAddressChanged('alex.graham'));
        },
        expect: () => {
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: '',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: 'alex.graham',
                emailErrorText: 'Enter valid email',
                phoneNumber: '',
                phoneNumberErrorText: '',
              )
            });
    blocTest<TrustedContactBloc, TrustedContactState>(
        'fill fistName, lastName, and correct emailAddress input',
        build: () {
          return trustedContactBloc;
        },
        act: (bloc) {
          bloc.add(const FirstNameChanged('alex'));
          bloc.add(const LastNameChanged('graham'));
          bloc.add(const EmailAddressChanged('alex.graham@example.com'));
        },
        expect: () => {
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: '',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: 'alex.graham@example.com',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              )
            });
    blocTest<TrustedContactBloc, TrustedContactState>(
        'fill fistName, lastName, correct emailAddress, wrong phoneNumber input',
        build: () {
          return trustedContactBloc;
        },
        act: (bloc) {
          bloc.add(const FirstNameChanged('alex'));
          bloc.add(const LastNameChanged('graham'));
          bloc.add(const EmailAddressChanged('alex.graham@example.com'));
          bloc.add(const PhoneNumberChanged('abc'));
        },
        expect: () => {
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: '',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: 'alex.graham@example.com',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: 'alex.graham@example.com',
                emailErrorText: '',
                phoneNumber: 'abc',
                phoneNumberErrorText: 'Enter valid phone number',
              )
            });
    blocTest<TrustedContactBloc, TrustedContactState>(
        'fill fistName, lastName, correct emailAddress, correct phoneNumber input',
        build: () {
          return trustedContactBloc;
        },
        act: (bloc) {
          bloc.add(const FirstNameChanged('alex'));
          bloc.add(const LastNameChanged('graham'));
          bloc.add(const EmailAddressChanged('alex.graham@example.com'));
          bloc.add(const PhoneNumberChanged('62859111233'));
        },
        expect: () => {
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: '',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: '',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: 'alex.graham@example.com',
                emailErrorText: '',
                phoneNumber: '',
                phoneNumberErrorText: '',
              ),
              const TrustedContactState(
                firstName: 'alex',
                firstNameErrorText: '',
                lastName: 'graham',
                lastNameErrorText: '',
                emailAddress: 'alex.graham@example.com',
                emailErrorText: '',
                phoneNumber: '62859111233',
                phoneNumberErrorText: '',
              )
            });

    tearDown(() => {trustedContactBloc.close()});
  });
}
