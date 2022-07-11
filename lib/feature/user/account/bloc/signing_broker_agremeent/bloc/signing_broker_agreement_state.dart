part of 'signing_broker_agreement_bloc.dart';

class SigningBrokerAgreementState extends Equatable {
  final bool isAlpacaCustomerAgreementOpened;
  final bool isUnderstoodAlpacaCustomAgreementChecked;
  final bool isSigningAgreementChecked;
  final Uint8List? customerSignature;

  const SigningBrokerAgreementState({
    this.isAlpacaCustomerAgreementOpened = false,
    this.isUnderstoodAlpacaCustomAgreementChecked = false,
    this.isSigningAgreementChecked = false,
    this.customerSignature,
  });

  @override
  List<Object?> get props => [
        isAlpacaCustomerAgreementOpened,
        isUnderstoodAlpacaCustomAgreementChecked,
        isSigningAgreementChecked,
        customerSignature
      ];

  SigningBrokerAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isUnderstoodAlpacaCustomAgreementChecked,
    bool? isSigningAgreementChecked,
    Uint8List? customerSignature,
  }) {
    return SigningBrokerAgreementState(
      isAlpacaCustomerAgreementOpened: isAlpacaCustomerAgreementOpened ??
          this.isAlpacaCustomerAgreementOpened,
      isUnderstoodAlpacaCustomAgreementChecked:
          isUnderstoodAlpacaCustomAgreementChecked ??
              this.isUnderstoodAlpacaCustomAgreementChecked,
      isSigningAgreementChecked:
          isSigningAgreementChecked ?? this.isSigningAgreementChecked,
      customerSignature: customerSignature ?? this.customerSignature,
    );
  }

  bool disabledNextButton() {
    if (isAlpacaCustomerAgreementOpened &&
        isUnderstoodAlpacaCustomAgreementChecked &&
        isSigningAgreementChecked &&
        customerSignature != null) {
      return false;
    }
    return true;
  }
}
