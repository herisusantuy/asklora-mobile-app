part of 'signing_agreement_bloc.dart';

class SigningAgreementState extends Equatable {
  final bool isAskLoraClientAgreementOpened;
  final bool isBoundByAskloraAgreementChecked;
  final bool isUnderstandOnTheAgreementChecked;
  final bool isRiskDisclosureAgreementChecked;
  final bool isSignatureChecked;
  final String legalName;
  final String? signedTime;

  const SigningAgreementState({
    this.isAskLoraClientAgreementOpened = false,
    this.isBoundByAskloraAgreementChecked = false,
    this.isUnderstandOnTheAgreementChecked = false,
    this.isRiskDisclosureAgreementChecked = false,
    this.isSignatureChecked = false,
    this.legalName = '',
    this.signedTime,
  });

  @override
  List<Object?> get props => [
        isAskLoraClientAgreementOpened,
        isRiskDisclosureAgreementChecked,
        isBoundByAskloraAgreementChecked,
        isUnderstandOnTheAgreementChecked,
        isSignatureChecked,
        legalName,
        signedTime ?? ''
      ];

  SigningAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isAskLoraClientAgreementOpened,
    bool? isBoundByAskloraAgreementChecked,
    bool? isUnderstandOnTheAgreementChecked,
    bool? isRiskDisclosureAgreementChecked,
    bool? isCertifyNotUSCitizenAgreementChecked,
    bool? isSignatureChecked,
    String? legalName,
    String? signedTime,
  }) {
    return SigningAgreementState(
      isAskLoraClientAgreementOpened:
          isAskLoraClientAgreementOpened ?? this.isAskLoraClientAgreementOpened,
      isRiskDisclosureAgreementChecked: isRiskDisclosureAgreementChecked ??
          this.isRiskDisclosureAgreementChecked,
      isBoundByAskloraAgreementChecked: isBoundByAskloraAgreementChecked ??
          this.isBoundByAskloraAgreementChecked,
      isUnderstandOnTheAgreementChecked: isUnderstandOnTheAgreementChecked ??
          this.isUnderstandOnTheAgreementChecked,
      isSignatureChecked: isSignatureChecked ?? this.isSignatureChecked,
      legalName: legalName ?? this.legalName,
      signedTime: signedTime ?? this.signedTime,
    );
  }

  bool disabledBrokerButton() {
    if (isBoundByAskloraAgreementChecked && isUnderstandOnTheAgreementChecked) {
      return false;
    }
    return true;
  }
}
