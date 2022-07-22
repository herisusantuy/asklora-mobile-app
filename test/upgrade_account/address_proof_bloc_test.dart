import 'package:asklora_mobile_app/feature/user/account/bloc/address_proof/bloc/address_proof_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Address Proof Bloc Test', () {
    late AddressProofBloc addressProofBloc;

    setUp(() async {
      addressProofBloc = AddressProofBloc();
    });

    test(
        'init state data should be empty string except for unrequired field it should be null.',
        () {
      expect(
          addressProofBloc.state,
          const AddressProofState(
            unitNumber: '',
            residentialAddress: '',
            city: '',
            country: '',
            isSameMailingAddress: null,
            mailUnitNumber: '',
            mailResidentialAddress: '',
            mailCity: '',
            mailCountry: '',
          ));
    });

    blocTest<AddressProofBloc, AddressProofState>('Input field on state',
        build: () => addressProofBloc,
        act: (bloc) => {
              bloc.add(const AddressProofUnitNumberChanged('Apt 1A')),
              bloc.add(
                  const AddressProofResidentialChanged('20 N San Mateo Dr')),
              bloc.add(const AddressProofCityChanged('San Mateo')),
              bloc.add(const AddressProofCountryChanged('HKG', 'Hong Kong')),
              bloc.add(const AddressProofIsSameMailingAddressChanged(false)),
              bloc.add(const AddressProofMailUnitNumberChanged('Apt 1B')),
              bloc.add(const AddressProofMailResidentialAddressChanged(
                  '25 N San Mateo Dr')),
              bloc.add(const AddressProofMailCityChanged('San Jose')),
              bloc.add(const AddressProofMailCountryChanged('HKG'))
            },
        expect: () => {
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '',
                city: '',
                country: '',
                isSameMailingAddress: null,
                mailUnitNumber: '',
                mailResidentialAddress: '',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: '',
                country: '',
                isSameMailingAddress: null,
                mailUnitNumber: '',
                mailResidentialAddress: '',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: '',
                isSameMailingAddress: null,
                mailUnitNumber: '',
                mailResidentialAddress: '',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: 'HKG',
                countryName: 'Hong Kong',
                isSameMailingAddress: null,
                mailUnitNumber: '',
                mailResidentialAddress: '',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: 'HKG',
                countryName: 'Hong Kong',
                isSameMailingAddress: false,
                mailUnitNumber: '',
                mailResidentialAddress: '',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: 'HKG',
                countryName: 'Hong Kong',
                isSameMailingAddress: false,
                mailUnitNumber: 'Apt 1B',
                mailResidentialAddress: '',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: 'HKG',
                countryName: 'Hong Kong',
                isSameMailingAddress: false,
                mailUnitNumber: 'Apt 1B',
                mailResidentialAddress: '25 N San Mateo Dr',
                mailCity: '',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: 'HKG',
                countryName: 'Hong Kong',
                isSameMailingAddress: false,
                mailUnitNumber: 'Apt 1B',
                mailResidentialAddress: '25 N San Mateo Dr',
                mailCity: 'San Jose',
                mailCountry: '',
              ),
              const AddressProofState(
                unitNumber: 'Apt 1A',
                residentialAddress: '20 N San Mateo Dr',
                city: 'San Mateo',
                country: 'HKG',
                countryName: 'Hong Kong',
                isSameMailingAddress: false,
                mailUnitNumber: 'Apt 1B',
                mailResidentialAddress: '25 N San Mateo Dr',
                mailCity: 'San Jose',
                mailCountry: 'HKG',
              ),
            });
    tearDown(() => {addressProofBloc.close()});
  });
}
