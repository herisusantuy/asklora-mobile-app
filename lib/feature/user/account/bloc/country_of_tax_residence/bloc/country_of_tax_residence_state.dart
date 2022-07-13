part of 'country_of_tax_residence_bloc.dart';

class CountryOfTaxResidenceState extends Equatable {
  const CountryOfTaxResidenceState(
      {this.taxResidence = '',
      this.countryOfTaxResidence = '',
      this.tinNumber = ''});

  final String taxResidence;
  final String countryOfTaxResidence;
  final String tinNumber;

  @override
  List<Object> get props => [taxResidence, countryOfTaxResidence, tinNumber];

  CountryOfTaxResidenceState copyWith({
    String? taxResidence,
    String? countryOfTaxResidence,
    String? tinNumber,
  }) {
    return CountryOfTaxResidenceState(
      taxResidence: taxResidence ?? this.taxResidence,
      countryOfTaxResidence:
          countryOfTaxResidence ?? this.countryOfTaxResidence,
      tinNumber: tinNumber ?? this.tinNumber,
    );
  }

  bool enableNextButton() =>
      taxResidence.isNotEmpty &&
      countryOfTaxResidence.isNotEmpty &&
      tinNumber.isNotEmpty;
}
