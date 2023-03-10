import 'package:collection/collection.dart';
import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/hkid_validation.dart';
import '../../../../../core/utils/age_validation.dart';
import '../../domain/upgrade_account/personal_info_request.dart';
import '../../repository/account_repository.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc({required AccountRepository accountRepository})
      : _accountRepository = accountRepository,
        super(const PersonalInfoState()) {
    on<PersonalInfoFirstNameChanged>(_onPersonalInfoFirstNameChange);
    on<PersonalInfoLastNameChanged>(_onPersonalInfoLastNameChange);
    on<PersonalInfoGenderChanged>(_onPersonalInfoGenderChange);
    on<PersonalInfoDateOfBirthChanged>(_onPersonalInfoDateOfBirthChange);
    on<PersonalInfoPhoneCountryCodeChanged>(
        _onPersonalInfoPhoneCountryCodeChange);
    on<PersonalInfoPhoneNumberChanged>(_onPersonalInfoPhoneNumberChange);
    on<PersonalInfoNationalityChanged>(_onPersonalInfoNationalityChange);
    on<PersonalInfoCountryOfBirthChanged>(_onPersonalInfoCountryOfBirthChange);
    on<PersonalInfoIsHongKongPermanentResidentChanged>(
        _onIsHongKongPermanentResidentChange);
    on<PersonalInfoHkIdNumberChanged>(_onHkIdNumberChange);
    on<PersonalInfoIsUnitedStateResidentChanged>(
        _onIsUnitedStateResidentChange);
    on<PersonalInfoNext>(_onPersonalInfoNext);
    on<PersonalInfoReset>(_onPersonalInfoReset);
    on<PersonalInfoSubmitted>(_onPersonalInfoSubmitted);
    on<InitiatePersonalInfo>(_onInitiatePersonalInfo);
  }

  final AccountRepository _accountRepository;

  _onInitiatePersonalInfo(
      InitiatePersonalInfo event, Emitter<PersonalInfoState> emit) {
    PersonalInfoRequest? personalInfoRequest = event.personalInfoRequest;

    emit(
      state.copyWith(
        firstName: personalInfoRequest?.firstName,
        lastName: personalInfoRequest?.lastName,
        gender: personalInfoRequest?.gender,
        dateOfBirth: personalInfoRequest?.dateOfBirth,
        hkIdNumber: personalInfoRequest?.hkIdNumber,
        isHkIdValid: isHkIdValid(personalInfoRequest?.hkIdNumber ?? ''),
        nationalityCode: personalInfoRequest?.nationality,
        nationalityName:
            getCountryByIso3(personalInfoRequest?.nationality ?? '')?.name,
        phoneCountryCode: personalInfoRequest?.phoneCountryCode,
        phoneNumber: personalInfoRequest?.phoneNumber,
        countryCodeOfBirth: personalInfoRequest?.countryOfBirth,
        countryNameOfBirth:
            getCountryByIso3(personalInfoRequest?.countryOfBirth ?? '')?.name,
      ),
    );
  }

  _onPersonalInfoFirstNameChange(
      PersonalInfoFirstNameChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  _onPersonalInfoLastNameChange(
      PersonalInfoLastNameChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  _onPersonalInfoGenderChange(
      PersonalInfoGenderChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  _onPersonalInfoDateOfBirthChange(
      PersonalInfoDateOfBirthChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(dateOfBirth: _formatDate(event.dateOfBirth)));
  }

  String _formatDate(String date) {
    DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(date);
    final inputDate = DateTime.parse(parseDate.toString());
    final outputFormat = DateFormat('yyyy-MM-dd');
    final outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  _onPersonalInfoPhoneCountryCodeChange(
      PersonalInfoPhoneCountryCodeChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
      phoneCountryCode: event.phoneCountryCode,
    ));
  }

  _onPersonalInfoPhoneNumberChange(
      PersonalInfoPhoneNumberChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _onPersonalInfoNationalityChange(
      PersonalInfoNationalityChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        nationalityCode: event.nationalityCode,
        nationalityName: event.nationalityName));
  }

  _onPersonalInfoCountryOfBirthChange(PersonalInfoCountryOfBirthChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        countryCodeOfBirth: event.countryCodeOfBirth,
        countryNameOfBirth: event.countryNameOfBirth));
  }

  _onIsHongKongPermanentResidentChange(
      PersonalInfoIsHongKongPermanentResidentChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        isHongKongPermanentResident: event.isHongKongPermanentResident));
  }

  _onHkIdNumberChange(
      PersonalInfoHkIdNumberChanged event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
        hkIdNumber: event.hkIdNumber,
        isHkIdValid: isHkIdValid(event.hkIdNumber)));
  }

  _onIsUnitedStateResidentChange(PersonalInfoIsUnitedStateResidentChanged event,
      Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(
      isUnitedStateResident: event.isUnitedStateResident,
    ));
  }

  _onPersonalInfoNext(PersonalInfoNext event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(response: BaseResponse.unknown()));
    if (state.isHongKongPermanentResident != null &&
            !state.isHongKongPermanentResident! ||
        state.isUnitedStateResident != null && state.isUnitedStateResident!) {
      emit(state.copyWith(
          response: BaseResponse.error(message: 'You are not eligible!'),
          message: r'You are not eligible!'));
    } else if (!isAdult(state.dateOfBirth)) {
      emit(state.copyWith(
          response: BaseResponse.error(
              message: 'You must be over 18 to sign up for AskLORA!'),
          message: r'You must be over 18 to sign up for AskLORA!'));
    } else {
      emit(state.copyWith(response: BaseResponse.complete('')));
    }
  }

  _onPersonalInfoReset(
      PersonalInfoReset event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(response: BaseResponse.unknown()));
  }

  _onPersonalInfoSubmitted(
      PersonalInfoSubmitted event, Emitter<PersonalInfoState> emit) async {
    try {
      emit(state.copyWith(
        response: BaseResponse.loading(),
      ));
      var data = await _accountRepository
          .submitPersonalInfo(event.personalInfoRequest);
      emit(state.copyWith(response: BaseResponse.complete(data)));
    } catch (e) {
      emit(state.copyWith(
        response: BaseResponse.error(),
      ));
    }
  }

  Country? getCountryByIso3(String iso3) {
    List<Country> countries = CountryService().getAll();
    return countries
        .firstWhereOrNull((element) => element.countryCodeIso3 == iso3);
  }
}
