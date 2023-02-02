import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/bloc/basic_information/basic_information_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('*Basic Information Bloc Test', () {
    late BasicInformationBloc basicInformationBloc;

    setUp(() async {
      basicInformationBloc = BasicInformationBloc();
    });

    test(
        'init state all field should be empty string except for optional fields it should be null',
        () {
      expect(
          basicInformationBloc.state,
          const BasicInformationState(
            firstName: '',
            middleName: null,
            lastName: '',
            chineseName: null,
            gender: '',
            dateOfBirth: '1990-01-01',
            countryCode: '',
            phoneNumber: '',
            countryOfCitizenship: '',
            isHongKongPermanentResident: null,
            idNumber: '',
            isUnitedStateResident: null,
            countryCodeOfBirth: '',
          ));
    });

    blocTest<BasicInformationBloc, BasicInformationState>(
        'Expected bloc error should be error as US residence is true',
        build: () => basicInformationBloc,
        act: (bloc) {
          bloc.add(const BasicInformationIsUnitedStateResidentChanged(true));
          bloc.add(const BasicInformationNext());
        },
        expect: () => {
              const BasicInformationState(
                firstName: '',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                countryCode: '',
                phoneNumber: '',
                countryCodeOfBirth: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: true,
                isHkIdValid: false,
                status: ResponseState.unknown,
                message: '',
              ),
              const BasicInformationState(
                firstName: '',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                countryCode: '',
                phoneNumber: '',
                countryCodeOfBirth: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: true,
                isHkIdValid: false,
                status: ResponseState.error,
                message: r'You are not eligible!',
              ),
            });

    blocTest<BasicInformationBloc, BasicInformationState>(
        'Expected bloc error should be error as age is below 18',
        build: () => basicInformationBloc,
        act: (bloc) {
          bloc.add(const BasicInformationDateOfBirthChanged('2010-08-08'));
          bloc.add(const BasicInformationNext());
        },
        expect: () => {
              const BasicInformationState(
                firstName: '',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                countryCode: '',
                phoneNumber: '',
                dateOfBirth: '2010-08-08',
                countryCodeOfBirth: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
                isHkIdValid: false,
                status: ResponseState.unknown,
                message: '',
              ),
              const BasicInformationState(
                firstName: '',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                countryCode: '',
                phoneNumber: '',
                countryCodeOfBirth: '',
                countryOfCitizenship: '',
                dateOfBirth: '2010-08-08',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
                isHkIdValid: false,
                status: ResponseState.error,
                message: r'You must be over 18 to sign up for AskLORA!',
              ),
            });

    blocTest<BasicInformationBloc, BasicInformationState>(
        'Input invalid HKID number',
        build: () => basicInformationBloc,
        act: (bloc) {
          bloc.add(const BasicInformationIdNumberChanged('666-55-4321'));
        },
        expect: () => {
              const BasicInformationState(
                firstName: '',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                countryCode: '',
                phoneNumber: '',
                countryCodeOfBirth: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '666-55-4321',
                isUnitedStateResident: null,
                isHkIdValid: false,
              ),
            });

    blocTest<BasicInformationBloc, BasicInformationState>(
        'Input valid HKID number',
        build: () => basicInformationBloc,
        act: (bloc) {
          bloc.add(const BasicInformationIdNumberChanged('F1234567'));
        },
        expect: () => {
              const BasicInformationState(
                firstName: '',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                countryCode: '',
                phoneNumber: '',
                countryCodeOfBirth: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: 'F1234567',
                isUnitedStateResident: null,
                isHkIdValid: true,
              ),
            });

    blocTest<BasicInformationBloc, BasicInformationState>(
        'Input field for Basic Information Form.',
        build: () => basicInformationBloc,
        act: (bloc) {
          bloc.add(const BasicInformationFirstNameChanged('John'));
          bloc.add(const BasicInformationMiddleNameChanged('Middle'));
          bloc.add(const BasicInformationLastNameChanged('Doe'));
          bloc.add(const BasicInformationChineseNameChanged('Soe'));
          bloc.add(const BasicInformationGenderChanged('Male'));
          bloc.add(const BasicInformationDateOfBirthChanged('1990-09-10'));
          bloc.add(
              const BasicInformationCountryOfBirthChanged('HKG', 'Hong Kong'));
          bloc.add(const BasicInformationCountryCodeChanged('+62'));
          bloc.add(const BasicInformationPhoneNumberChanged('8765432190'));
          bloc.add(const BasicInformationCountryOfCitizenshipChanged(
              'HKG', 'Hong Kong'));
          bloc.add(
              const BasicInformationIsHongKongPermanentResidentChanged(true));
          bloc.add(const BasicInformationIdNumberChanged('666-55-4321'));
          bloc.add(const BasicInformationIsUnitedStateResidentChanged(false));
        },
        expect: () => {
              const BasicInformationState(
                firstName: 'John',
                middleName: null,
                lastName: '',
                chineseName: null,
                gender: '',
                dateOfBirth: '1990-01-01',
                countryCodeOfBirth: '',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: '',
                chineseName: null,
                gender: '',
                dateOfBirth: '1990-01-01',
                countryCodeOfBirth: '',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: null,
                gender: '',
                dateOfBirth: '1990-01-01',
                countryCodeOfBirth: '',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: '',
                dateOfBirth: '1990-01-01',
                countryCodeOfBirth: '',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-01-01',
                countryCodeOfBirth: '',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: '',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '+62',
                phoneNumber: '',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: '',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HKG',
                countryNameOfCitizenship: 'Hong Kong',
                isHongKongPermanentResident: null,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HKG',
                countryNameOfCitizenship: 'Hong Kong',
                isHongKongPermanentResident: true,
                idNumber: '',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HKG',
                countryNameOfCitizenship: 'Hong Kong',
                isHongKongPermanentResident: true,
                idNumber: '666-55-4321',
                isUnitedStateResident: null,
              ),
              const BasicInformationState(
                firstName: 'John',
                middleName: 'Middle',
                lastName: 'Doe',
                chineseName: 'Soe',
                gender: 'Male',
                dateOfBirth: '1990-09-10',
                countryCodeOfBirth: 'HKG',
                countryNameOfBirth: 'Hong Kong',
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HKG',
                countryNameOfCitizenship: 'Hong Kong',
                isHongKongPermanentResident: true,
                idNumber: '666-55-4321',
                isUnitedStateResident: false,
                isHkIdValid: false,
              )
            });

    tearDown(() => basicInformationBloc.close());
  });
}
