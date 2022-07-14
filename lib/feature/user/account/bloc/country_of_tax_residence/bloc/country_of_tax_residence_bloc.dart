import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'country_of_tax_residence_event.dart';
part 'country_of_tax_residence_state.dart';

class CountryOfTaxResidenceBloc
    extends Bloc<CountryOfTaxResidenceEvent, CountryOfTaxResidenceState> {
  CountryOfTaxResidenceBloc() : super(const CountryOfTaxResidenceState()) {
    on<TaxResidenceChanged>(_onTaxResidenceChange);
    on<CountryOfTaxResidenceChanged>(_onCountryOfTaxResidenceChange);
    on<TinNumberChanged>(_onTinNumberChange);
  }

  _onTaxResidenceChange(
      TaxResidenceChanged event, Emitter<CountryOfTaxResidenceState> emit) {
    emit(state.copyWith(taxResidence: event.taxResidence));
  }

  _onCountryOfTaxResidenceChange(CountryOfTaxResidenceChanged event,
      Emitter<CountryOfTaxResidenceState> emit) {
    emit(state.copyWith(countryOfTaxResidence: event.countryOfTaxResidence));
  }

  _onTinNumberChange(
      TinNumberChanged event, Emitter<CountryOfTaxResidenceState> emit) {
    emit(state.copyWith(tinNumber: event.tinNumber));
  }
}
