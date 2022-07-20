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
          taxResidence: '',
          countryOfTaxResidence: '',
          tinNumber: '',
        ),
      );
    });

    blocTest<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        'Input field for Country of Tax Residence form',
        build: () => countryOfTaxResidenceBloc,
        act: (bloc) {
          bloc.add(const TaxResidenceChanged('20 N San Mateo Dr'));
          bloc.add(const CountryOfTaxResidenceChanged('HKG'));
          bloc.add(const TinNumberChanged('123456789'));
        },
        expect: () => {
              const CountryOfTaxResidenceState(
                  taxResidence: '20 N San Mateo Dr',
                  countryOfTaxResidence: '',
                  tinNumber: ''),
              const CountryOfTaxResidenceState(
                  taxResidence: '20 N San Mateo Dr',
                  countryOfTaxResidence: 'HKG',
                  tinNumber: ''),
              const CountryOfTaxResidenceState(
                  taxResidence: '20 N San Mateo Dr',
                  countryOfTaxResidence: 'HKG',
                  tinNumber: '123456789')
            });
    tearDown(() => countryOfTaxResidenceBloc.close());
  });
}
