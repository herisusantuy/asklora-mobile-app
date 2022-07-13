import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disclosure_affiliation_state.dart';
part 'disclosure_affiliation_event.dart';

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
    on<QuestionNo3Changed>(_onQuestionNo3Changed);
    on<QuestionNo4Changed>(_onQuestionNo4Changed);
    on<QuestionNo5Changed>(_onQuestionNo5Changed);
    on<NameOfAffiliatedChanged>(_onNameOfAffiliatedChanged);
    on<NameOfAffiliatedSubmitted>(_onNameOfAffiliatedSubmitted);
    on<QuestionNo6Changed>(_onQuestionNo6Changed);
    on<NameOfJointAccountChanged>(_onNameOfJointAccountChanged);
    on<NameOfJointAccountSubmitted>(_onNameOfJointAccountSubmitted);
    on<QuestionNo7Changed>(_onQuestionNo7Changed);
  }

  _onQuestionNo1Changed(
      QuestionNo1Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isAffiliated: event.isAffiliated));
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
    emit(state.copyWith(affiliateCompanyEmail: event.affiliateCompanyEmail));
  }

  _onQuestionNo2Changed(
      QuestionNo2Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isSeniorExecutive: event.isSeniorExecutive));
  }

  _onQuestionNo3Changed(
      QuestionNo3Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isSeniorPolitical: event.isSeniorPolitical));
  }

  _onQuestionNo4Changed(
      QuestionNo4Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isFamilyMember: event.isFamilyMember));
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
        isNameOfAffiliatedPersonSubmitted: false));
  }

  _onNameOfAffiliatedSubmitted(NameOfAffiliatedSubmitted event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isNameOfAffiliatedPersonSubmitted: true));
  }

  _onQuestionNo6Changed(
      QuestionNo6Changed event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isOwner) {
      emit(state.copyWith(isOwner: event.isOwner));
    }
    emit(state.copyWith(isOwner: event.isOwner, nameOfJointAccount: ''));
  }

  _onNameOfJointAccountChanged(NameOfJointAccountChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(
        nameOfJointAccount: event.nameOfJointAccount,
        isNameOfJointAccountSubmitted: false));
  }

  _onNameOfJointAccountSubmitted(NameOfJointAccountSubmitted event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isNameOfJointAccountSubmitted: true));
  }

  _onQuestionNo7Changed(
      QuestionNo7Changed event, Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isEmployee: event.isEmployee));
  }
}
