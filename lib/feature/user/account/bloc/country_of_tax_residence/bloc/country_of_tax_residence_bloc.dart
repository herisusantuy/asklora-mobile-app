import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'country_of_tax_residence_event.dart';

part 'country_of_tax_residence_state.dart';

class CountryOfTaxResidenceBloc
    extends Bloc<CountryOfTaxResidenceEvent, CountryOfTaxResidenceState> {
  CountryOfTaxResidenceBloc() : super(const CountryOfTaxResidenceState()) {
    on<CountryOfTaxResidenceChanged>(_onCountryOfTaxResidenceChange);
    on<TinNumberChanged>(_onTinNumberChange);
  }

  _onCountryOfTaxResidenceChange(CountryOfTaxResidenceChanged event,
      Emitter<CountryOfTaxResidenceState> emit) {
    emit(state.copyWith(
        countryOfTaxResidence: event.countryOfTaxResidence,
        countryNameOfTaxResidence: event.countryNameOfTaxResidence));
  }

  _onTinNumberChange(
      TinNumberChanged event, Emitter<CountryOfTaxResidenceState> emit) {
    emit(state.copyWith(tinNumber: event.tinNumber));
  }
}
