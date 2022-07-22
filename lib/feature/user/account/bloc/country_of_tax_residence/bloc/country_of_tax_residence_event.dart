part of 'country_of_tax_residence_bloc.dart';

abstract class CountryOfTaxResidenceEvent extends Equatable {
  const CountryOfTaxResidenceEvent();

  @override
  List<Object> get props => [];
}

class CountryOfTaxResidenceChanged extends CountryOfTaxResidenceEvent {
  final String countryOfTaxResidence;
  final String countryNameOfTaxResidence;

  const CountryOfTaxResidenceChanged(
      this.countryOfTaxResidence, this.countryNameOfTaxResidence);

  @override
  List<Object> get props => [countryOfTaxResidence];
}

class TinNumberChanged extends CountryOfTaxResidenceEvent {
  final String tinNumber;

  const TinNumberChanged(this.tinNumber);

  @override
  List<Object> get props => [tinNumber];
}
