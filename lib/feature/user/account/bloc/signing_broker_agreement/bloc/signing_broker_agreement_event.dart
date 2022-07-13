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
  final Uint8List? customerSignature;
  const CustomerSignatureDrew(this.customerSignature) : super();

  @override
  List<Object?> get props => [customerSignature];
}

class CustomerSignatureReset extends SigningBrokerAgreementEvent {
  final SignatureController resetCustomerSignature;
  const CustomerSignatureReset(this.resetCustomerSignature) : super();

  @override
  List<Object> get props => [resetCustomerSignature];
}
