import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disclosure_affiliation_event.dart';

part 'disclosure_affiliation_state.dart';

class DisclosureAffiliationBloc
    extends Bloc<DisclosuresAffiliationEvent, DisclosureAffiliationState> {
  DisclosureAffiliationBloc() : super(const DisclosureAffiliationState()) {
    on<AffiliatedPersonChanged>(_onAffiliatedPersonChanged);
    on<AffiliateAssociatesChanged>(_onAffiliateAssociatesChanged);
    on<AffiliatedCommissionChanged>(_onAffiliateCommissionChanged);
    on<AffiliatePersonFirstNameChanged>(_onAffiliatePersonFirstNameChanged);
    on<AffiliatePersonLastNameChanged>(_onAffiliatePersonLastNameChanged);
    on<AffiliateAssociatesFirstNameChanged>(
        _onAffiliateAssociatesFirstNameChanged);
    on<AffiliateAssociatesLastNameChanged>(
        _onAffiliateAssociatesLastNameChanged);
  }

  _onAffiliatedPersonChanged(
      AffiliatedPersonChanged event, Emitter<DisclosureAffiliationState> emit) {
    if (event.isAffiliatedPerson) {
      emit(state.copyWith(isAffiliatedPerson: event.isAffiliatedPerson));
    } else {
      emit(state.copyWith(isAffiliatedPerson: event.isAffiliatedPerson));
    }
  }

  _onAffiliateAssociatesChanged(AffiliateAssociatesChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isAffiliatedAssociates: event.isAffiliatedAssociates));
  }

  _onAffiliateCommissionChanged(AffiliatedCommissionChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(isAffiliatedCommission: event.isAffiliatedCommission));
  }

  _onAffiliatePersonFirstNameChanged(AffiliatePersonFirstNameChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliatedPersonFirstName: event.firstName));
  }

  _onAffiliatePersonLastNameChanged(AffiliatePersonLastNameChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliatedPersonLastName: event.lastName));
  }

  _onAffiliateAssociatesFirstNameChanged(
      AffiliateAssociatesFirstNameChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliatedAssociatesFirstName: event.firstName));
  }

  _onAffiliateAssociatesLastNameChanged(
      AffiliateAssociatesLastNameChanged event,
      Emitter<DisclosureAffiliationState> emit) {
    emit(state.copyWith(affiliatedAssociatesLastName: event.lastName));
  }
}
