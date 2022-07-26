import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/util.dart';

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
    on<BasicInformationIsHongKongPermanentResidentChanged>(
        _onIsHongKongPermanentResidentChange);
    on<BasicInformationIdNumberChanged>(_onIdNumberChange);
    on<BasicInformationIsUnitedStateResidentChanged>(
        _onIsUnitedStateResidentChange);
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
}
