part of 'signing_agreement_bloc.dart';

class SigningAgreementState extends Equatable {
  final bool isAskLoraClientAgreementOpened;
  final bool isBoundByAskloraAgreementChecked;
  final bool isUnderstandOnTheAgreementChecked;
  final bool isRiskDisclosureAgreementChecked;
  final String customerSignature;
  final String? signedTime;
  final SignatureController signatureController;

  const SigningAgreementState({
    required this.signatureController,
    this.isAskLoraClientAgreementOpened = false,
    this.isBoundByAskloraAgreementChecked = false,
    this.isUnderstandOnTheAgreementChecked = false,
    this.isRiskDisclosureAgreementChecked = false,
    this.customerSignature = '',
    this.signedTime,
  });

  @override
  List<Object?> get props => [
        signatureController,
        isAskLoraClientAgreementOpened,
        isRiskDisclosureAgreementChecked,
        isBoundByAskloraAgreementChecked,
        isUnderstandOnTheAgreementChecked,
        customerSignature,
        signedTime ?? ''
      ];

  SigningAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isAskLoraClientAgreementOpened,
    bool? isBoundByAskloraAgreementChecked,
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
      isAskLoraClientAgreementOpened:
          isAskLoraClientAgreementOpened ?? this.isAskLoraClientAgreementOpened,
      isRiskDisclosureAgreementChecked: isRiskDisclosureAgreementChecked ??
          this.isRiskDisclosureAgreementChecked,
      isBoundByAskloraAgreementChecked: isBoundByAskloraAgreementChecked ??
          this.isBoundByAskloraAgreementChecked,
      isUnderstandOnTheAgreementChecked: isUnderstandOnTheAgreementChecked ??
          this.isUnderstandOnTheAgreementChecked,
      customerSignature: customerSignature ?? this.customerSignature,
      signedTime: signedTime ?? this.signedTime,
    );
  }

  bool disabledBrokerButton() {
    if (isBoundByAskloraAgreementChecked &&
        isUnderstandOnTheAgreementChecked &&
        customerSignature.isNotEmpty) {
      return false;
    }
    return true;
  }
}
