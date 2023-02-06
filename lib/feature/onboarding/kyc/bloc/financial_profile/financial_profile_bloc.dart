import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/financial_profile_enum.dart';

part 'financial_profile_event.dart';

part 'financial_profile_state.dart';

class FinancialProfileBloc
    extends Bloc<FinancialProfileEvent, FinancialProfileState> {
  FinancialProfileBloc() : super(const FinancialProfileState()) {
    on<FinancialProfileEmploymentStatusChanged>(
        _onFinancialProfileEmploymentStatusChanged);
    on<FinancialProfileOccupationChanged>(_onFinancialProfileOccupationChanged);
    on<FinancialProfileOtherOccupationChanged>(
        _onFinancialProfileOtherOccupationChanged);
    on<FinancialProfileEmployerChanged>(_onFinancialProfileEmployerChanged);
    on<FinancialProfileEmployerAddressChanged>(
        _onFinancialProfileEmployerAddressChanged);
    on<FinancialProfileEmployerAddressTwoChanged>(
        _onFinancialProfileEmployerAddressTwoChanged);
    on<FinancialProfileNatureOfBusinessChanged>(
        _onFinancialProfileNatureOfBusinessChanged);
    on<FinancialProfileNatureOfBusinessDescriptionChanged>(
        _onFinancialProfileNatureOfBusinessDescriptionChanged);
    on<FinancialProfileDistrictChanged>(_onFinancialProfileDistrictChanged);
    on<FinancialProfileRegionChanged>(_onFinancialProfileRegionChanged);
    on<FinancialProfileCountryChanged>(_onFinancialProfileCountryChanged);
    on<FinancialProfileDetailInformationOfCountryChanged>(
        _onFinancialProfileDetailInformationOfCountryChanged);
  }

  _onFinancialProfileEmploymentStatusChanged(
      FinancialProfileEmploymentStatusChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(employmentStatus: event.employmentStatus));
  }

  _onFinancialProfileOccupationChanged(FinancialProfileOccupationChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(occupation: event.occupation));
  }

  _onFinancialProfileOtherOccupationChanged(
      FinancialProfileOtherOccupationChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(otherOccupation: event.otherOccupation));
  }

  _onFinancialProfileEmployerChanged(FinancialProfileEmployerChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(employer: event.employer));
  }

  _onFinancialProfileEmployerAddressChanged(
      FinancialProfileEmployerAddressChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(employerAddress: event.employerAddress));
  }

  _onFinancialProfileEmployerAddressTwoChanged(
      FinancialProfileEmployerAddressTwoChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(employerAddressTwo: event.employerAddressTwo));
  }

  _onFinancialProfileNatureOfBusinessChanged(
      FinancialProfileNatureOfBusinessChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(natureOfBusiness: event.natureOfBusiness));
  }

  _onFinancialProfileNatureOfBusinessDescriptionChanged(
      FinancialProfileNatureOfBusinessDescriptionChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(
        natureOfBusinessDescription: event.natureOfBusinessDescription));
  }

  _onFinancialProfileDistrictChanged(FinancialProfileDistrictChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(district: event.district));
  }

  _onFinancialProfileRegionChanged(FinancialProfileRegionChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(region: event.region));
  }

  _onFinancialProfileCountryChanged(FinancialProfileCountryChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(
        state.copyWith(country: event.country, countryName: event.countryName));
  }

  _onFinancialProfileDetailInformationOfCountryChanged(
      FinancialProfileDetailInformationOfCountryChanged event,
      Emitter<FinancialProfileState> emit) {
    emit(state.copyWith(
        detailInformationOfCountry: event.detailInformationOfCountry));
  }
}
