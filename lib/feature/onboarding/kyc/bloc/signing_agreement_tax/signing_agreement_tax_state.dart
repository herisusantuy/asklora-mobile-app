part of 'signing_agreement_tax_bloc.dart';

class SigningAgreementTaxState extends Equatable {
  final bool isCheckedCertify;
  final bool isCheckedDeclare;
  final bool isFormW8BenOpened;

  const SigningAgreementTaxState({
    this.isCheckedCertify = false,
    this.isCheckedDeclare = false,
    this.isFormW8BenOpened = false,
  });

  @override
  List<Object?> get props => [
        isCheckedCertify,
        isCheckedDeclare,
        isFormW8BenOpened,
      ];

  SigningAgreementTaxState copyWith({
    bool? isCheckedCertify,
    bool? isCheckedDeclare,
    bool? isFormW8BenOpened,
  }) {
    return SigningAgreementTaxState(
      isCheckedCertify: isCheckedCertify ?? this.isCheckedCertify,
      isCheckedDeclare: isCheckedDeclare ?? this.isCheckedDeclare,
      isFormW8BenOpened: isFormW8BenOpened ?? this.isFormW8BenOpened,
    );
  }

  bool disabledNextButton() {
    if (isCheckedCertify && isCheckedDeclare && isFormW8BenOpened) {
      return false;
    }
    return true;
  }
}
