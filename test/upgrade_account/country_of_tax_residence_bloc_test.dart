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
        'Input field for Country of Tax Residence form',
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
                  tinNumber: '123456789')
            });
    tearDown(() => countryOfTaxResidenceBloc.close());
  });
}
