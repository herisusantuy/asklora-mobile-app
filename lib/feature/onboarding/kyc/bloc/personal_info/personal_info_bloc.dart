import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/hkid_validation.dart';
import '../../../../../core/utils/age_validation.dart';
import '../../domain/upgrade_account/personal_info_request.dart';
import '../../domain/upgrade_account/personal_info_response.dart';
import '../../repository/account_repository.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc({required AccountRepository accountRepository})
      : _accountRepository = accountRepository,
        super(const PersonalInfoState()) {
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
    on<BasicInformationSubmitted>(_onBasicInformationSubmitted);
  }

  final AccountRepository _accountRepository;

  _onBasicInformationFirstNameChange(
      BasicInformationFirstNameChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  _onBasicInformationLastNameChange(
      BasicInformationLastNameChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  _onBasicInformationMiddleNameChange(BasicInformationMiddleNameChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(middleName: event.middleName));
  }

  _onBasicInformationChineseNameChange(BasicInformationChineseNameChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(chineseName: event.chineseName));
  }

  _onBasicInformationGenderChange(
      BasicInformationGenderChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  _onBasicInformationDateOfBirthChange(BasicInformationDateOfBirthChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  _onBasicInformationCountryCodeChange(BasicInformationCountryCodeChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
      countryCode: event.countryCode,
    ));
  }

  _onBasicInformationPhoneNumberChange(BasicInformationPhoneNumberChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _onBasicInformationCountryOfCitizenshipChange(
      BasicInformationCountryOfCitizenshipChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        countryOfCitizenship: event.countryOfCitizenship,
        countryNameOfCitizenship: event.countryNameOfCitizenship));
  }

  _onBasicInformationCountryOfBirthChange(
      BasicInformationCountryOfBirthChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        countryCodeOfBirth: event.countryCodeOfBirth,
        countryNameOfBirth: event.countryNameOfBirth));
  }

  _onIsHongKongPermanentResidentChange(
      BasicInformationIsHongKongPermanentResidentChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        isHongKongPermanentResident: event.isHongKongPermanentResident));
  }

  _onIdNumberChange(
      BasicInformationIdNumberChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        idNumber: event.idNumber, isHkIdValid: isHkIdValid(event.idNumber)));
  }

  _onIsUnitedStateResidentChange(
      BasicInformationIsUnitedStateResidentChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(isUnitedStateResident: event.isUnitedStateResident));
  }

  _onBasicInformationNext(
      BasicInformationNext event, Emitter<PersonalInfoState> emit) {
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
      BasicInformationReset event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(status: ResponseState.unknown));
  }

  _onBasicInformationSubmitted(
      BasicInformationSubmitted event, Emitter<PersonalInfoState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _accountRepository
          .submitPersonalInfo(const PersonalInfoRequest());
    } catch (_) {}
  }
}
