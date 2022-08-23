import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/extensions.dart';

part 'disclosure_affiliation_event.dart';

part 'disclosure_affiliation_state.dart';

class DisclosureAffiliationBloc
    extends Bloc<DisclosuresAffiliationEvent, DisclosureAffiliationState> {
  DisclosureAffiliationBloc() : super(const DisclosureAffiliationState()) {
    on<QuestionNo1Changed>(_onQuestionNo1Changed);
    on<AffiliateCompanyNameChanged>(_onAffiliateCompanyNameChanged);
    on<AffiliateCompanyAddressChanged>(_onAffiliateCompanyAddressChanged);
    on<AffiliateCompanyCityChanged>(_onAffiliateCompanyCityChanged);
    on<AffiliateCompanyStateChanged>(_onAffiliateCompanyStateChanged);
    on<AffiliateCompanyCountryChanged>(_onAffiliateCompanyCountryChanged);
    on<AffiliateCompanyEmailChanged>(_onAffiliateCompanyEmailChanged);
    on<QuestionNo2Changed>(_onQuestionNo2Changed);
    on<ControlledPersonCompanyNameChanged>(
        _onControlledPersonCompanyNameChanged);
    on<ControlledPersonCompanyAddressChanged>(
        _onControlledPersonCompanyAddressChanged);
    on<ControlledPersonCompanyCityChanged>(
        _onControlledPersonCompanyCityChanged);
    on<ControlledPersonCompanyStateChanged>(
        _onControlledPersonCompanyStateChanged);
    on<ControlledPersonCompanyCountryChanged>(
        _onControlledPersonCompanyCountryChanged);
    on<ControlledPersonCompanyEmailChanged>(
        _onControlledPersonCompanyEmailChanged);
    on<QuestionNo3Changed>(_onQuestionNo3Changed);
    on<QuestionNo4Changed>(_onQuestionNo4Changed);
    on<FirstNameOfFamilyMemberChanged>(_onFirstNameOfFamilyMemberChanged);
    on<LastNameOfFamilyMemberChanged>(_onLastNameOfFamilyMemberChanged);
    on<QuestionNo5Changed>(_onQuestionNo5Changed);
    on<NameOfAffiliatedChanged>(_onNameOfAffiliatedChanged);
    on<QuestionNo6Changed>(_onQuestionNo6Changed);
    on<NameOfJointAccountChanged>(_onNameOfJointAccountChanged);
    on<QuestionNo7Changed>(_onQuestionNo7Changed);
  }

  _onQuestionNo1Changed(
      QuestionNo1Changed event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isAffiliated) {
      emit(state.copyWith(isAffiliated: event.isAffiliated));
    } else {
      emit(state.copyWith(
          isAffiliated: event.isAffiliated,
          affiliateCompanyName: '',
          affiliateCompanyAddress: '',
          affiliateCompanyCity: '',
          affiliateCompanyState: '',
          affiliateCompanyCountry: '',
          affiliateCompanyEmail: ''));
    }
  }

  _onAffiliateCompanyNameChanged(AffiliateCompanyNameChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliateCompanyName: event.affiliateCompanyName));
  }

  _onAffiliateCompanyAddressChanged(AffiliateCompanyAddressChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(
        state.copyWith(affiliateCompanyAddress: event.affiliateCompanyAddress));
  }

  _onAffiliateCompanyCityChanged(AffiliateCompanyCityChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliateCompanyCity: event.affiliateCompanyCity));
  }

  _onAffiliateCompanyStateChanged(AffiliateCompanyStateChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliateCompanyState: event.affiliateCompanyState));
  }

  _onAffiliateCompanyCountryChanged(AffiliateCompanyCountryChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(
        state.copyWith(affiliateCompanyCountry: event.affiliateCompanyCountry));
  }

  _onAffiliateCompanyEmailChanged(AffiliateCompanyEmailChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        affiliateCompanyEmail: event.affiliateCompanyEmail,
        affiliateCompanyEmailErrorText:
            (event.affiliateCompanyEmail.isValidEmail() ||
                    event.affiliateCompanyEmail.isEmpty)
                ? ''
                : 'Enter valid email'));
  }

  _onQuestionNo2Changed(
      QuestionNo2Changed event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isSeniorExecutive) {
      emit(state.copyWith(isSeniorExecutive: event.isSeniorExecutive));
    } else {
      emit(state.copyWith(
        isSeniorExecutive: event.isSeniorExecutive,
        controlledPersonCompanyName: '',
        controlledPersonCompanyAddress: '',
        controlledPersonCompanyCity: '',
        controlledPersonCompanyState: '',
        controlledPersonCompanyCountry: '',
        controlledPersonCompanyEmail: '',
      ));
    }
  }

  _onControlledPersonCompanyNameChanged(
      ControlledPersonCompanyNameChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        controlledPersonCompanyName: event.controlledPersonCompanyName));
  }

  _onControlledPersonCompanyAddressChanged(
      ControlledPersonCompanyAddressChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        controlledPersonCompanyAddress: event.controlledPersonCompanyAddress));
  }

  _onControlledPersonCompanyCityChanged(
      ControlledPersonCompanyCityChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        controlledPersonCompanyCity: event.controlledPersonCompanyCity));
  }

  _onControlledPersonCompanyStateChanged(
      ControlledPersonCompanyStateChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        controlledPersonCompanyState: event.controlledPersonCompanyState));
  }

  _onControlledPersonCompanyCountryChanged(
      ControlledPersonCompanyCountryChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        controlledPersonCompanyCountry: event.controlledPersonCompanyCountry));
  }

  _onControlledPersonCompanyEmailChanged(
      ControlledPersonCompanyEmailChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        controlledPersonCompanyEmail: event.controlledPersonCompanyEmail,
        controlledPersonCompanyEmailErrorText:
            (event.controlledPersonCompanyEmail.isValidEmail() ||
                    event.controlledPersonCompanyEmail.isEmpty)
                ? ''
                : 'Please enter valid email'));
  }

  _onQuestionNo3Changed(
      QuestionNo3Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isSeniorPolitical: event.isSeniorPolitical));
  }

  _onQuestionNo4Changed(
      QuestionNo4Changed event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isFamilyMember == true) {
      emit(state.copyWith(isFamilyMember: event.isFamilyMember));
    } else {
      emit(state.copyWith(
        isFamilyMember: event.isFamilyMember,
        firstNameOfFamilyMember: '',
        lastNameOfFamilyMember: '',
      ));
    }
  }

  _onFirstNameOfFamilyMemberChanged(FirstNameOfFamilyMemberChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(
        state.copyWith(firstNameOfFamilyMember: event.firstNameOfFamilyMember));
  }

  _onLastNameOfFamilyMemberChanged(LastNameOfFamilyMemberChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(lastNameOfFamilyMember: event.lastNameOfFamilyMember));
  }

  _onQuestionNo5Changed(
      QuestionNo5Changed event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isAssociates) {
      emit(state.copyWith(isAssociates: event.isAssociates));
    } else {
      emit(state.copyWith(
          isAssociates: event.isAssociates, nameOfAffiliatedPerson: ''));
    }
  }

  _onNameOfAffiliatedChanged(
      NameOfAffiliatedChanged event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
      nameOfAffiliatedPerson: event.nameOfAffiliatedPerson,
    ));
  }

  _onQuestionNo6Changed(
      QuestionNo6Changed event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isOwner) {
      emit(state.copyWith(isOwner: event.isOwner, nameOfJointAccount: ''));
    } else {
      emit(state.copyWith(
        isOwner: event.isOwner,
      ));
    }
  }

  _onNameOfJointAccountChanged(NameOfJointAccountChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(nameOfJointAccount: event.nameOfJointAccount));
  }

  _onQuestionNo7Changed(
      QuestionNo7Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isEmployee: event.isEmployee));
  }
}
