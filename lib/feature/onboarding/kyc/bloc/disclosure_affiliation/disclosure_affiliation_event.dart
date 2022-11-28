part of 'disclosure_affiliation_bloc.dart';

abstract class DisclosuresAffiliationEvent extends Equatable {
  const DisclosuresAffiliationEvent();

  @override
  List<Object> get props => [];
}

class AffiliatedPersonChanged extends DisclosuresAffiliationEvent {
  final bool isAffiliatedPerson;

  const AffiliatedPersonChanged(this.isAffiliatedPerson) : super();

  @override
  List<Object> get props => [isAffiliatedPerson];
}

class AffiliatedCommissionChanged extends DisclosuresAffiliationEvent {
  final bool isAffiliatedCommission;

  const AffiliatedCommissionChanged(this.isAffiliatedCommission) : super();

  @override
  List<Object> get props => [isAffiliatedCommission];
}

class AffiliateAssociatesChanged extends DisclosuresAffiliationEvent {
  final bool isAffiliatedAssociates;

  const AffiliateAssociatesChanged(this.isAffiliatedAssociates) : super();

  @override
  List<Object> get props => [isAffiliatedAssociates];
}

class AffiliatePersonFirstNameChanged extends DisclosuresAffiliationEvent {

  final String firstName;

  const AffiliatePersonFirstNameChanged(this.firstName) : super();

  @override
  List<Object> get props => [firstName];
}

class AffiliatePersonLastNameChanged extends DisclosuresAffiliationEvent {
  final String lastName;

  const AffiliatePersonLastNameChanged(this.lastName) : super();

  @override
  List<Object> get props => [lastName];
}

class AffiliateAssociatesFirstNameChanged extends DisclosuresAffiliationEvent {

  final String firstName;

  const AffiliateAssociatesFirstNameChanged(this.firstName) : super();

  @override
  List<Object> get props => [firstName];
}

class AffiliateAssociatesLastNameChanged extends DisclosuresAffiliationEvent {
  final String lastName;

  const AffiliateAssociatesLastNameChanged(this.lastName) : super();

  @override
  List<Object> get props => [lastName];
}
