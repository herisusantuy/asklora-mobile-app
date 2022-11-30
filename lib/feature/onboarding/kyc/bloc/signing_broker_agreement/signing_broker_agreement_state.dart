part of 'signing_broker_agreement_bloc.dart';

class SigningBrokerAgreementState extends Equatable {
  final bool isAlpacaCustomerAgreementOpened;
  final bool isAskLoraClientAgreementOpened;
  final bool isBoundByAlpacaAndLoraAgreementChecked;
  final bool isUnderstandOnTheAgreementChecked;
  final bool isCertifyNotUSCitizenAgreementChecked;
  final bool isSignatureDrew;
  final String customerSignature;
  final String? signedTime;

  const SigningBrokerAgreementState({
    this.isAlpacaCustomerAgreementOpened = false,
    this.isAskLoraClientAgreementOpened = false,
    this.isCertifyNotUSCitizenAgreementChecked = false,
    this.isBoundByAlpacaAndLoraAgreementChecked = false,
    this.isUnderstandOnTheAgreementChecked = false,
    this.isSignatureDrew = false,
    this.customerSignature = '',
    this.signedTime,
  });

  @override
  List<Object?> get props => [
        isAlpacaCustomerAgreementOpened,
        isAskLoraClientAgreementOpened,
        isCertifyNotUSCitizenAgreementChecked,
        isBoundByAlpacaAndLoraAgreementChecked,
        isUnderstandOnTheAgreementChecked,
        isSignatureDrew,
        customerSignature,
        signedTime ?? ''
      ];

  SigningBrokerAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isAskLoraClientAgreementOpened,
    bool? isBoundByAlpacaAndLoraAgreementChecked,
    bool? isUnderstandOnTheAgreementChecked,
    bool? isCertifyNotUSCitizenAgreementChecked,
    bool? isSignatureDrew,
    String? customerSignature,
    String? signedTime,
  }) {
    return SigningBrokerAgreementState(
      isAlpacaCustomerAgreementOpened: isAlpacaCustomerAgreementOpened ??
          this.isAlpacaCustomerAgreementOpened,
      isAskLoraClientAgreementOpened:
          isAskLoraClientAgreementOpened ?? this.isAskLoraClientAgreementOpened,
      isCertifyNotUSCitizenAgreementChecked:
          isCertifyNotUSCitizenAgreementChecked ??
              this.isCertifyNotUSCitizenAgreementChecked,
      isBoundByAlpacaAndLoraAgreementChecked:
          isBoundByAlpacaAndLoraAgreementChecked ??
              this.isBoundByAlpacaAndLoraAgreementChecked,
      isUnderstandOnTheAgreementChecked: isUnderstandOnTheAgreementChecked ??
          this.isUnderstandOnTheAgreementChecked,
      isSignatureDrew: isSignatureDrew ?? this.isSignatureDrew,
      customerSignature: customerSignature ?? this.customerSignature,
      signedTime: signedTime ?? this.signedTime,
    );
  }

  bool disabledNextButton() {
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
