part of 'signing_broker_agreement_bloc.dart';

abstract class SigningBrokerAgreementEvent extends Equatable {
  const SigningBrokerAgreementEvent();

  @override
  List<Object?> get props => [];
}

class AlpacaCustomerAgreementOpened extends SigningBrokerAgreementEvent {
  final bool isAlpacaCustomerAgreementOpened;

  const AlpacaCustomerAgreementOpened(this.isAlpacaCustomerAgreementOpened)
      : super();

  @override
  List<Object> get props => [isAlpacaCustomerAgreementOpened];
}

class AskLoraClientAgreementOpened extends SigningBrokerAgreementEvent {
  const AskLoraClientAgreementOpened() : super();

  @override
  List<Object> get props => [];
}

class BoundByAlpacaAndLoraAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const BoundByAlpacaAndLoraAgreementChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class UnderstandOnTheAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const UnderstandOnTheAgreementChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class CertifyNotUSCitizenAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isChecked;

  const CertifyNotUSCitizenAgreementChecked(this.isChecked) : super();

  @override
  List<Object> get props => [isChecked];
}

class CustomerSignatureDrew extends SigningBrokerAgreementEvent {
  final String? customerSignature;
  final String? signedTime;

  const CustomerSignatureDrew(this.customerSignature, this.signedTime)
      : super();

  @override
  List<Object?> get props => [customerSignature];
}

class CustomerSignatureReset extends SigningBrokerAgreementEvent {
  const CustomerSignatureReset() : super();

  @override
  List<Object> get props => [];
}
