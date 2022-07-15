part of 'signing_broker_agreement_bloc.dart';

class SigningBrokerAgreementState extends Equatable {
  final bool isAlpacaCustomerAgreementOpened;
  final bool isUnderstoodAlpacaCustomAgreementChecked;
  final bool isSigningAgreementChecked;
  final bool isSignatureDrew;
  final String customerSignature;

  const SigningBrokerAgreementState({
    this.isAlpacaCustomerAgreementOpened = false,
    this.isUnderstoodAlpacaCustomAgreementChecked = false,
    this.isSigningAgreementChecked = false,
    this.isSignatureDrew = false,
    this.customerSignature = '',
  });

  @override
  List<Object?> get props => [
        isAlpacaCustomerAgreementOpened,
        isUnderstoodAlpacaCustomAgreementChecked,
        isSigningAgreementChecked,
        isSignatureDrew,
        customerSignature
      ];

  SigningBrokerAgreementState copyWith({
    bool? isAlpacaCustomerAgreementOpened,
    bool? isUnderstoodAlpacaCustomAgreementChecked,
    bool? isSigningAgreementChecked,
    bool? isSignatureDrew,
    String? customerSignature,
  }) {
    return SigningBrokerAgreementState(
      isAlpacaCustomerAgreementOpened: isAlpacaCustomerAgreementOpened ??
          this.isAlpacaCustomerAgreementOpened,
      isUnderstoodAlpacaCustomAgreementChecked:
          isUnderstoodAlpacaCustomAgreementChecked ??
              this.isUnderstoodAlpacaCustomAgreementChecked,
      isSigningAgreementChecked:
          isSigningAgreementChecked ?? this.isSigningAgreementChecked,
      isSignatureDrew: isSignatureDrew ?? this.isSignatureDrew,
      customerSignature: customerSignature ?? this.customerSignature,
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
