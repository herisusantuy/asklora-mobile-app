part of 'signing_agreement_bloc.dart';

abstract class SigningBrokerAgreementEvent extends Equatable {
  const SigningBrokerAgreementEvent();

  @override
  List<Object?> get props => [];
}

class AskLoraClientAgreementOpened extends SigningBrokerAgreementEvent {
  const AskLoraClientAgreementOpened() : super();

  @override
  List<Object> get props => [];
}

class W8BenFormOpened extends SigningBrokerAgreementEvent {
  const W8BenFormOpened() : super();

  @override
  List<Object> get props => [];
}

class BoundByAskloraAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const BoundByAskloraAgreementChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class UnderstandOnTheAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const UnderstandOnTheAgreementChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class RiskDisclosureAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const RiskDisclosureAgreementChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class LegalNameSignatureChanged extends SigningBrokerAgreementEvent {
  final String legalName;
  const LegalNameSignatureChanged(this.legalName) : super();

  @override
  List<Object> get props => [legalName];
}

class SignatureChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const SignatureChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class SignAgreementScreenRendered extends SigningBrokerAgreementEvent {
  final String legalName;

  const SignAgreementScreenRendered(this.legalName) : super();
  @override
  List<Object> get props => [legalName];
}
