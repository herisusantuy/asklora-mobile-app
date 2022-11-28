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

class UnderstoodAlpacaCustomAgreementChecked
    extends SigningBrokerAgreementEvent {
  final bool isUnderstoodAlpacaCustomAgreementChecked;

  const UnderstoodAlpacaCustomAgreementChecked(
      this.isUnderstoodAlpacaCustomAgreementChecked)
      : super();

  @override
  List<Object> get props => [isUnderstoodAlpacaCustomAgreementChecked];
}

class SigningAgreementChecked extends SigningBrokerAgreementEvent {
  final bool isSigningAgreementChecked;

  const SigningAgreementChecked(this.isSigningAgreementChecked) : super();

  @override
  List<Object> get props => [isSigningAgreementChecked];
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
