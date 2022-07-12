import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upgrade_account_event.dart';
part 'upgrade_account_state.dart';

class UpgradeAccountBloc
    extends Bloc<UpgradeAccountEvent, UpgradeAccountState> {
  UpgradeAccountBloc() : super(const UpgradeAccountState()) {
    on<UpgradeAccountFirstNameChanged>(_onFirstNameChanged);
    on<UpgradeAccountMiddleNameChanged>(_onMiddleNameChanged);
    on<UpgradeAccountLastNameChanged>(_onLastNameChanged);
    on<UpgradeAccountChineseNameChanged>(_onChineseNameChanged);
    on<UpgradeAccountGenderChanged>(_onGenderChanged);
    on<UpgradeAccountDateOfBirthChanged>(_onDateOfBirthChanged);
    on<UpgradeAccountCountryCodeChanged>(_onCountryCodeChanged);
    on<UpgradeAccountPhoneNumberChanged>(_onPhoneNumberChanged);
    on<UpgradeAccountCountryOfCitizenshipChanged>(
        _onCountryOfCitizenshipChanged);
    on<UpgradeAccountIsHongKongResidentChanged>(_onIsHongKongResidentChanged);
    on<UpgradeAccountIsUnitedStateResidentChanged>(
        _onIsUnitedStateResidentChanged);
  }

  _onFirstNameChanged(
      UpgradeAccountFirstNameChanged event, Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  _onMiddleNameChanged(UpgradeAccountMiddleNameChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(middleName: event.middleName));
  }

  _onLastNameChanged(
      UpgradeAccountLastNameChanged event, Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  _onChineseNameChanged(UpgradeAccountChineseNameChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(chineseName: event.chineseName));
  }

  _onGenderChanged(
      UpgradeAccountGenderChanged event, Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  _onDateOfBirthChanged(UpgradeAccountDateOfBirthChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  _onCountryCodeChanged(UpgradeAccountCountryCodeChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(countryCode: event.countryCode));
  }

  _onPhoneNumberChanged(UpgradeAccountPhoneNumberChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _onCountryOfCitizenshipChanged(
      UpgradeAccountCountryOfCitizenshipChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(countryOfCitizenship: event.countryOfCitizenship));
  }

  _onIsHongKongResidentChanged(UpgradeAccountIsHongKongResidentChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(isHongKongResident: event.isHongKongResident));
  }

  _onIsUnitedStateResidentChanged(
      UpgradeAccountIsUnitedStateResidentChanged event,
      Emitter<UpgradeAccountState> emit) {
    emit(state.copyWith(isUnitedStateResident: event.isUnitedStateResident));
  }
}
