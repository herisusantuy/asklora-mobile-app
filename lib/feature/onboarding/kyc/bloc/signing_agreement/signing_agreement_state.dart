part of 'signing_agreement_bloc.dart';

class SigningAgreementState extends Equatable {
  final bool isAlpacaCustomerAgreementOpened;
  final bool isAskLoraClientAgreementOpened;
  final bool isBoundByAlpacaAndLoraAgreementChecked;
  final bool isUnderstandOnTheAgreementChecked;
  final bool isCertifyNotUSCitizenAgreementChecked;
  final bool isRiskDisclosureAgreementChecked;
  final String customerSignature;
  final String? signedTime;
  final SignatureController signatureController;

  const SigningAgreementState({
    required this.signatureController,
    this.isAlpacaCustomerAgreementOpened = false,
    this.isAskLoraClientAgreementOpened = false,
    this.isCertifyNotUSCitizenAgreementChecked = false,
    this.isBoundByAlpacaAndLoraAgreementChecked = false,
    this.isUnderstandOnTheAgreementChecked = false,
    this.isRiskDisclosureAgreementChecked = false,
    this.customerSignature = '',
    this.signedTime,
  });

  @override
  List<Object?> get props => [
        signatureController,
        isAlpacaCustomerAgreementOpened,
        isAskLoraClientAgreementOpened,
        isCertifyNotUSCitizenAgreementChecked,
        isRiskDisclosureAgreementChecked,
        isBoundByAlpacaAndLoraAgreementChecked,
        isUnderstandOnTheAgreementChecked,
        customerSignature,
        signedTime ?? ''
      ];

  SigningAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isAskLoraClientAgreementOpened,
    bool? isBoundByAlpacaAndLoraAgreementChecked,
    bool? isUnderstandOnTheAgreementChecked,
    bool? isTaxAgreementChecked,
    bool? isRiskDisclosureAgreementChecked,
    bool? isCertifyNotUSCitizenAgreementChecked,
    bool? isSignatureDrew,
    String? customerSignature,
    String? signedTime,
  }) {
    return SigningAgreementState(
      signatureController: signatureController,
      isAlpacaCustomerAgreementOpened: isAlpacaCustomerAgreementOpened ??
          this.isAlpacaCustomerAgreementOpened,
      isAskLoraClientAgreementOpened:
          isAskLoraClientAgreementOpened ?? this.isAskLoraClientAgreementOpened,
      isCertifyNotUSCitizenAgreementChecked:
          isCertifyNotUSCitizenAgreementChecked ??
              this.isCertifyNotUSCitizenAgreementChecked,
      isRiskDisclosureAgreementChecked: isRiskDisclosureAgreementChecked ??
          this.isRiskDisclosureAgreementChecked,
      isBoundByAlpacaAndLoraAgreementChecked:
          isBoundByAlpacaAndLoraAgreementChecked ??
              this.isBoundByAlpacaAndLoraAgreementChecked,
      isUnderstandOnTheAgreementChecked: isUnderstandOnTheAgreementChecked ??
          this.isUnderstandOnTheAgreementChecked,
      customerSignature: customerSignature ?? this.customerSignature,
      signedTime: signedTime ?? this.signedTime,
    );
  }

  bool disabledBrokerButton() {
    if (isAlpacaCustomerAgreementOpened &&
        isBoundByAlpacaAndLoraAgreementChecked &&
        isUnderstandOnTheAgreementChecked &&
        isCertifyNotUSCitizenAgreementChecked &&
        customerSignature.isNotEmpty) {
      return false;
    }
    return true;
  }
}
