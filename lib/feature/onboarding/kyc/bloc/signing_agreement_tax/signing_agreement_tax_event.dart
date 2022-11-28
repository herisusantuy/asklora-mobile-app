part of 'signing_agreement_tax_bloc.dart';

abstract class SigningAgreementTaxEvent extends Equatable {
  const SigningAgreementTaxEvent();

  @override
  List<Object?> get props => [];
}

class FormW8BenOpened extends SigningAgreementTaxEvent {
  final bool isFormW8BenOpened;

  const FormW8BenOpened(
    this.isFormW8BenOpened,
  ) : super();

  @override
  List<Object> get props => [isFormW8BenOpened];
}

class CertifyNotUsCitizenChecked extends SigningAgreementTaxEvent {
  final bool isCertifyChecked;

  const CertifyNotUsCitizenChecked(
    this.isCertifyChecked,
  ) : super();

  @override
  List<Object> get props => [isCertifyChecked];
}

class DeclareCorrectInformationChecked extends SigningAgreementTaxEvent {
  final bool isDeclareChecked;

  const DeclareCorrectInformationChecked(
    this.isDeclareChecked,
  ) : super();

  @override
  List<Object> get props => [isDeclareChecked];
}
