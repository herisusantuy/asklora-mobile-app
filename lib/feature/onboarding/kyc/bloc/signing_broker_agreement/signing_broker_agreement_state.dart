part of 'signing_broker_agreement_bloc.dart';

class SigningBrokerAgreementState extends Equatable {
  final bool isAlpacaCustomerAgreementOpened;
  final bool isAskLoraClientAgreementOpened;
  final bool isUnderstoodAlpacaCustomAgreementChecked;
  final bool isSigningAgreementChecked;
  final bool isSignatureDrew;
  final String customerSignature;
  final String? signedTime;

  const SigningBrokerAgreementState({
    this.isAlpacaCustomerAgreementOpened = false,
    this.isAskLoraClientAgreementOpened = false,
    this.isUnderstoodAlpacaCustomAgreementChecked = false,
    this.isSigningAgreementChecked = false,
    this.isSignatureDrew = false,
    this.customerSignature = '',
    this.signedTime,
  });

  @override
  List<Object?> get props => [
        isAlpacaCustomerAgreementOpened,
        isAskLoraClientAgreementOpened,
        isUnderstoodAlpacaCustomAgreementChecked,
        isSigningAgreementChecked,
        isSignatureDrew,
        customerSignature,
        signedTime ?? ''
      ];

  SigningBrokerAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isAskLoraClientAgreementOpened,
    bool? isUnderstoodAlpacaCustomAgreementChecked,
    bool? isSigningAgreementChecked,
    bool? isSignatureDrew,
    String? customerSignature,
    String? signedTime,
  }) {
    return SigningBrokerAgreementState(
      isAlpacaCustomerAgreementOpened: isAlpacaCustomerAgreementOpened ??
          this.isAlpacaCustomerAgreementOpened,
      isAskLoraClientAgreementOpened:
          isAskLoraClientAgreementOpened ?? this.isAskLoraClientAgreementOpened,
      isUnderstoodAlpacaCustomAgreementChecked:
          isUnderstoodAlpacaCustomAgreementChecked ??
              this.isUnderstoodAlpacaCustomAgreementChecked,
      isSigningAgreementChecked:
          isSigningAgreementChecked ?? this.isSigningAgreementChecked,
      isSignatureDrew: isSignatureDrew ?? this.isSignatureDrew,
      customerSignature: customerSignature ?? this.customerSignature,
      signedTime: signedTime ?? this.signedTime,
    );
  }

  bool disabledNextButton() {
    if (isAlpacaCustomerAgreementOpened &&
        isUnderstoodAlpacaCustomAgreementChecked &&
        isSigningAgreementChecked &&
        customerSignature.isNotEmpty) {
      return false;
    }
    return true;
  }
}
