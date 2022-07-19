import 'package:asklora_mobile_app/feature/user/account/bloc/basic_information/bloc/basic_information_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('*Basic Information Bloc Test', () {
    late BasicInformationBloc basicInformationBloc;

    setUp(() async {
      basicInformationBloc = BasicInformationBloc();
    });

    test(
        'init state all field should be empty string except for unrequired field it should be null',
        () {
      expect(
          basicInformationBloc.state,
          const BasicInformationState(
            firstName: '',
            middleName: '',
            lastName: '',
            chineseName: '',
            gender: '',
            dateOfBirth: '1990-01-01',
            countryCode: '',
            phoneNumber: '',
            countryOfCitizenship: '',
            isHongKongPermanentResident: null,
            idNumber: '',
            isUnitedStateResident: null,
          ));
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
          bloc.add(const BasicInformationCountryCodeChanged('+62'));
          bloc.add(const BasicInformationPhoneNumberChanged('8765432190'));
          bloc.add(
              const BasicInformationCountryOfCitizenshipChanged('HongKong'));
          bloc.add(
              const BasicInformationIsHongKongPermanentResidentChanged(true));
          bloc.add(const BasicInformationIdNumberChanged('666-55-4321'));
          bloc.add(const BasicInformationIsUnitedStateResidentChanged(false));
        },
        expect: () => {
              const BasicInformationState(
                firstName: 'John',
                middleName: '',
                lastName: '',
                chineseName: '',
                gender: '',
                dateOfBirth: '1990-01-01',
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
                chineseName: '',
                gender: '',
                dateOfBirth: '1990-01-01',
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
                chineseName: '',
                gender: '',
                dateOfBirth: '1990-01-01',
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
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HongKong',
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
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HongKong',
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
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HongKong',
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
                countryCode: '+62',
                phoneNumber: '8765432190',
                countryOfCitizenship: 'HongKong',
                isHongKongPermanentResident: true,
                idNumber: '666-55-4321',
                isUnitedStateResident: false,
              )
            });
    tearDown(() => basicInformationBloc.close());
  });
}
