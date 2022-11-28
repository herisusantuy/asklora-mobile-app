import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/hkid_validation.dart';

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
    if (event.countryOfTaxResidence == 'HKG' &&
        !isHkIdValid(state.tinNumber) &&
        state.tinNumber.isNotEmpty) {
      emit(state.copyWith(
          countryOfTaxResidence: event.countryOfTaxResidence,
          countryNameOfTaxResidence: event.countryNameOfTaxResidence,
          isHkIdValid: false));
    } else {
      emit(state.copyWith(
        countryOfTaxResidence: event.countryOfTaxResidence,
        countryNameOfTaxResidence: event.countryNameOfTaxResidence,
        isHkIdValid: true,
      ));
    }
  }

  _onTinNumberChange(
      TinNumberChanged event, Emitter<CountryOfTaxResidenceState> emit) {
    emit(state.copyWith(
        tinNumber: event.tinNumber,
        isHkIdValid: isHkIdValid(event.tinNumber)));
  }
}
