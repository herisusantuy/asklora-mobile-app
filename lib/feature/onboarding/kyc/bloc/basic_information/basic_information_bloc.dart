import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/hkid_validation.dart';
import '../../../../../core/utils/age_validation.dart';

part 'basic_information_event.dart';

part 'basic_information_state.dart';

class BasicInformationBloc
    extends Bloc<BasicInformationEvent, BasicInformationState> {
  BasicInformationBloc() : super(const BasicInformationState()) {
    on<BasicInformationFirstNameChanged>(_onBasicInformationFirstNameChange);
    on<BasicInformationLastNameChanged>(_onBasicInformationLastNameChange);
    on<BasicInformationMiddleNameChanged>(_onBasicInformationMiddleNameChange);
    on<BasicInformationChineseNameChanged>(
        _onBasicInformationChineseNameChange);
    on<BasicInformationGenderChanged>(_onBasicInformationGenderChange);
    on<BasicInformationDateOfBirthChanged>(
        _onBasicInformationDateOfBirthChange);
    on<BasicInformationCountryCodeChanged>(
        _onBasicInformationCountryCodeChange);
    on<BasicInformationPhoneNumberChanged>(
        _onBasicInformationPhoneNumberChange);
    on<BasicInformationCountryOfCitizenshipChanged>(
        _onBasicInformationCountryOfCitizenshipChange);
    on<BasicInformationCountryOfBirthChanged>(
        _onBasicInformationCountryOfBirthChange);
    on<BasicInformationIsHongKongPermanentResidentChanged>(
        _onIsHongKongPermanentResidentChange);
    on<BasicInformationIdNumberChanged>(_onIdNumberChange);
    on<BasicInformationIsUnitedStateResidentChanged>(
        _onIsUnitedStateResidentChange);
    on<BasicInformationNext>(_onBasicInformationNext);
    on<BasicInformationReset>(_onBasicInformationReset);
  }

  _onBasicInformationFirstNameChange(BasicInformationFirstNameChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  _onBasicInformationLastNameChange(BasicInformationLastNameChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  _onBasicInformationMiddleNameChange(BasicInformationMiddleNameChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(middleName: event.middleName));
  }

  _onBasicInformationChineseNameChange(BasicInformationChineseNameChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(chineseName: event.chineseName));
  }

  _onBasicInformationGenderChange(BasicInformationGenderChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  _onBasicInformationDateOfBirthChange(BasicInformationDateOfBirthChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  _onBasicInformationCountryCodeChange(BasicInformationCountryCodeChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(
      countryCode: event.countryCode,
    ));
  }

  _onBasicInformationPhoneNumberChange(BasicInformationPhoneNumberChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _onBasicInformationCountryOfCitizenshipChange(
      BasicInformationCountryOfCitizenshipChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(
        countryOfCitizenship: event.countryOfCitizenship,
        countryNameOfCitizenship: event.countryNameOfCitizenship));
  }

  _onBasicInformationCountryOfBirthChange(
      BasicInformationCountryOfBirthChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(
        countryCodeOfBirth: event.countryCodeOfBirth,
        countryNameOfBirth: event.countryNameOfBirth));
  }

  _onIsHongKongPermanentResidentChange(
      BasicInformationIsHongKongPermanentResidentChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(
        isHongKongPermanentResident: event.isHongKongPermanentResident));
  }

  _onIdNumberChange(BasicInformationIdNumberChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(
        idNumber: event.idNumber, isHkIdValid: isHkIdValid(event.idNumber)));
  }

  _onIsUnitedStateResidentChange(
      BasicInformationIsUnitedStateResidentChanged event,
      Emitter<BasicInformationState> emit) {
    emit(state.copyWith(isUnitedStateResident: event.isUnitedStateResident));
  }

  _onBasicInformationNext(
      BasicInformationNext event, Emitter<BasicInformationState> emit) {
    emit(state.copyWith(status: ResponseState.unknown));
    if (state.isHongKongPermanentResident != null &&
            !state.isHongKongPermanentResident! ||
        state.isUnitedStateResident != null && state.isUnitedStateResident!) {
      emit(state.copyWith(
          status: ResponseState.error, message: r'You are not eligible!'));
    } else if (!isAdult(state.dateOfBirth)) {
      emit(state.copyWith(
          status: ResponseState.error,
          message: r'You must be over 18 to sign up for AskLORA!'));
    } else {
      emit(state.copyWith(status: ResponseState.success));
    }
  }

  _onBasicInformationReset(
      BasicInformationReset event, Emitter<BasicInformationState> emit) {
    emit(state.copyWith(status: ResponseState.unknown));
  }
}
