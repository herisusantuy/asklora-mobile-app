part of 'country_of_tax_residence_bloc.dart';

abstract class CountryOfTaxResidenceEvent extends Equatable {
  const CountryOfTaxResidenceEvent();

  @override
  List<Object> get props => [];
}

class TaxResidenceChanged extends CountryOfTaxResidenceEvent {
  final String taxResidence;
  const TaxResidenceChanged(this.taxResidence);

  @override
  List<Object> get props => [taxResidence];
}

class CountryOfTaxResidenceChanged extends CountryOfTaxResidenceEvent {
  final String countryOfTaxResidence;
  const CountryOfTaxResidenceChanged(this.countryOfTaxResidence);

  @override
  List<Object> get props => [countryOfTaxResidence];
}

class TinNumberChanged extends CountryOfTaxResidenceEvent {
  final String tinNumber;
  const TinNumberChanged(this.tinNumber);

  @override
  List<Object> get props => [tinNumber];
}
