part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {}

class UpgradeAccount extends AccountEvent {
  final UpgradeAccountRequest? upgradeAccountRequest;

  const UpgradeAccount(this.upgradeAccountRequest);
}

class GetSdkToken extends AccountEvent {}

class AccountCurrentStepChanged extends AccountEvent {
  final String type;

  const AccountCurrentStepChanged(
    this.type,
  ) : super();

  @override
  List<Object> get props => [type];
}

class UpdateOnfidoResult extends AccountEvent {
  final String outcome;
  final String reason;
  final String token;

  const UpdateOnfidoResult(this.outcome, this.reason, this.token);
}

class AccountQuestion1ofAffiliationChanged extends AccountEvent {
  final bool isAffiliated;
  const AccountQuestion1ofAffiliationChanged(this.isAffiliated) : super();
  @override
  List<Object> get props => [isAffiliated];
}

class AccountQuestion2ofAffiliationChanged extends AccountEvent {
  final bool isSeniorExecutive;
  const AccountQuestion2ofAffiliationChanged(this.isSeniorExecutive) : super();
  @override
  List<Object> get props => [isSeniorExecutive];
}

class AccountQuestion3ofAffiliationChanged extends AccountEvent {
  final bool isSeniorPolitical;
  const AccountQuestion3ofAffiliationChanged(this.isSeniorPolitical) : super();
  @override
  List<Object> get props => [isSeniorPolitical];
}

class AccountQuestion4ofAffiliationChanged extends AccountEvent {
  final bool isFamilyMember;
  const AccountQuestion4ofAffiliationChanged(this.isFamilyMember) : super();
  @override
  List<Object> get props => [isFamilyMember];
}

class AccountQuestion5ofAffiliationChanged extends AccountEvent {
  final bool isAssociates;
  const AccountQuestion5ofAffiliationChanged(this.isAssociates) : super();
  @override
  List<Object> get props => [isAssociates];
}

class AccountNameOfAffiliatedPersonChanged extends AccountEvent {
  final String nameOfAffiliatedPerson;
  const AccountNameOfAffiliatedPersonChanged(this.nameOfAffiliatedPerson)
      : super();
  @override
  List<Object> get props => [nameOfAffiliatedPerson];
}

class AccountQuestion6ofAffiliationChanged extends AccountEvent {
  final bool isOwner;
  const AccountQuestion6ofAffiliationChanged(this.isOwner) : super();
  @override
  List<Object> get props => [isOwner];
}

class AccountNameOfJointAccountChanged extends AccountEvent {
  final String nameOfJointAccount;
  const AccountNameOfJointAccountChanged(this.nameOfJointAccount) : super();
  @override
  List<Object> get props => [nameOfJointAccount];
}

class AccountQuestion7ofAffiliationChanged extends AccountEvent {
  final bool isEmployee;
  const AccountQuestion7ofAffiliationChanged(this.isEmployee) : super();
  @override
  List<Object> get props => [isEmployee];
}
