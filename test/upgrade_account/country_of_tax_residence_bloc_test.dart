import 'package:asklora_mobile_app/feature/user/account/bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Country of Tax Residence bloc test', () {
    late CountryOfTaxResidenceBloc countryOfTaxResidenceBloc;

    setUp(() async {
      countryOfTaxResidenceBloc = CountryOfTaxResidenceBloc();
    });

    test('init state data should be empty "string"', () {
      expect(
        countryOfTaxResidenceBloc.state,
        const CountryOfTaxResidenceState(
          countryNameOfTaxResidence: '',
          countryOfTaxResidence: '',
          tinNumber: '',
        ),
      );
    });

    blocTest<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        'TIN Input fields for Hong Kong Residence with invalid HKID',
        build: () => countryOfTaxResidenceBloc,
        act: (bloc) {
          bloc.add(const CountryOfTaxResidenceChanged('HKG', 'Hong Kong'));
          bloc.add(const TinNumberChanged('123456789'));
        },
        expect: () => {
              const CountryOfTaxResidenceState(
                  countryNameOfTaxResidence: 'Hong Kong',
                  countryOfTaxResidence: 'HKG',
                  tinNumber: ''),
              const CountryOfTaxResidenceState(
                  countryNameOfTaxResidence: 'Hong Kong',
                  countryOfTaxResidence: 'HKG',
                  tinNumber: '123456789',
                  isHkIdValid: false)
            });

    blocTest<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        'TIN Input fields for Hong Kong Residence with valid HKID',
        build: () => countryOfTaxResidenceBloc,
        act: (bloc) {
          bloc.add(const CountryOfTaxResidenceChanged('HKG', 'Hong Kong'));
          bloc.add(const TinNumberChanged('f1234567'));
        },
        expect: () => {
              const CountryOfTaxResidenceState(
                  countryNameOfTaxResidence: 'Hong Kong',
                  countryOfTaxResidence: 'HKG',
                  tinNumber: ''),
              const CountryOfTaxResidenceState(
                  countryNameOfTaxResidence: 'Hong Kong',
                  countryOfTaxResidence: 'HKG',
                  tinNumber: 'f1234567',
                  isHkIdValid: true)
            });

    blocTest<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        'TIN Input fields for non Hong Kong Residence ',
        build: () => countryOfTaxResidenceBloc,
        act: (bloc) {
          bloc.add(const CountryOfTaxResidenceChanged('CAD', 'Canada'));
          bloc.add(const TinNumberChanged('123456789'));
        },
        expect: () => {
              const CountryOfTaxResidenceState(
                  countryNameOfTaxResidence: 'Canada',
                  countryOfTaxResidence: 'CAD',
                  tinNumber: ''),
              const CountryOfTaxResidenceState(
                  countryNameOfTaxResidence: 'Canada',
                  countryOfTaxResidence: 'CAD',
                  tinNumber: '123456789',
                  isHkIdValid: true)
            });
    tearDown(() => countryOfTaxResidenceBloc.close());
  });
}
