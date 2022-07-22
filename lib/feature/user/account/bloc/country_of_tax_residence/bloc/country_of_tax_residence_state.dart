part of 'country_of_tax_residence_bloc.dart';

class CountryOfTaxResidenceState extends Equatable {
  const CountryOfTaxResidenceState(
      {this.countryNameOfTaxResidence = '',
      this.countryOfTaxResidence = '',
      this.tinNumber = ''});

  final String countryNameOfTaxResidence;
  final String countryOfTaxResidence;
  final String tinNumber;

  @override
  List<Object> get props =>
      [countryNameOfTaxResidence, countryOfTaxResidence, tinNumber];

  CountryOfTaxResidenceState copyWith({
    String? countryNameOfTaxResidence,
    String? countryOfTaxResidence,
    String? tinNumber,
  }) {
    return CountryOfTaxResidenceState(
      countryNameOfTaxResidence:
          countryNameOfTaxResidence ?? this.countryNameOfTaxResidence,
      countryOfTaxResidence:
          countryOfTaxResidence ?? this.countryOfTaxResidence,
      tinNumber: tinNumber ?? this.tinNumber,
    );
  }

  bool enableNextButton() =>
      countryNameOfTaxResidence.isNotEmpty &&
      countryOfTaxResidence.isNotEmpty &&
      tinNumber.isNotEmpty;
}
