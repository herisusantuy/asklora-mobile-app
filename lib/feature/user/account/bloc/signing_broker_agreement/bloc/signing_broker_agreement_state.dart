part of 'signing_broker_agreement_bloc.dart';

class SigningBrokerAgreementState extends Equatable {
  final bool isAlpacaCustomerAgreementOpened;
  final bool isAskLoraClientAgreementOpened;
  final bool isUnderstoodAlpacaCustomAgreementChecked;
  final bool isSigningAgreementChecked;

  const SigningBrokerAgreementState({
    this.isAlpacaCustomerAgreementOpened = false,
    this.isAskLoraClientAgreementOpened = false,
    this.isUnderstoodAlpacaCustomAgreementChecked = false,
    this.isSigningAgreementChecked = false,
  });

  @override
  List<Object?> get props => [
        isAlpacaCustomerAgreementOpened,
        isAskLoraClientAgreementOpened,
        isUnderstoodAlpacaCustomAgreementChecked,
        isSigningAgreementChecked,
      ];

  SigningBrokerAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isAskLoraClientAgreementOpened,
    bool? isUnderstoodAlpacaCustomAgreementChecked,
    bool? isSigningAgreementChecked,
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
    );
  }

  bool disabledNextButton() {
    if (isAlpacaCustomerAgreementOpened &&
        isUnderstoodAlpacaCustomAgreementChecked &&
        isSigningAgreementChecked) {
      return false;
    }
    return true;
  }
}
