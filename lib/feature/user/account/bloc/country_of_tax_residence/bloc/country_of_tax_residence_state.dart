part of 'country_of_tax_residence_bloc.dart';

class CountryOfTaxResidenceState extends Equatable {
  const CountryOfTaxResidenceState({
    this.countryNameOfTaxResidence = '',
    this.countryOfTaxResidence = '',
    this.tinNumber = '',
    this.isHkIdValid = false,
  });

  final String countryNameOfTaxResidence;
  final String countryOfTaxResidence;
  final String tinNumber;
  final bool isHkIdValid;

  @override
  List<Object> get props => [
        countryNameOfTaxResidence,
        countryOfTaxResidence,
        tinNumber,
        isHkIdValid
      ];

  CountryOfTaxResidenceState copyWith({
    String? countryNameOfTaxResidence,
    String? countryOfTaxResidence,
    String? tinNumber,
    bool? isHkIdValid,
  }) {
    return CountryOfTaxResidenceState(
      countryNameOfTaxResidence:
          countryNameOfTaxResidence ?? this.countryNameOfTaxResidence,
      countryOfTaxResidence:
          countryOfTaxResidence ?? this.countryOfTaxResidence,
      tinNumber: tinNumber ?? this.tinNumber,
      isHkIdValid: isHkIdValid ?? this.isHkIdValid,
    );
  }

  bool enableNextButton() =>
      countryNameOfTaxResidence.isNotEmpty &&
      countryOfTaxResidence.isNotEmpty &&
      tinNumber.isNotEmpty &&
      isHkIdValid;
}
