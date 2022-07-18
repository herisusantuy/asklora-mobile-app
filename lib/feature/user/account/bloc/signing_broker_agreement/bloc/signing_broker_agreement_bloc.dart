import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

part 'signing_broker_agreement_event.dart';

part 'signing_broker_agreement_state.dart';

class SigningBrokerAgreementBloc
    extends Bloc<SigningBrokerAgreementEvent, SigningBrokerAgreementState> {
  SigningBrokerAgreementBloc() : super(const SigningBrokerAgreementState()) {
    on<AlpacaCustomerAgreementOpened>(_onAlpacaCustomerAgreementOpened);
    on<UnderstoodAlpacaCustomAgreementChecked>(
        _onUnderstoodAlpacaCustomAgreementChecked);
    on<SigningAgreementChecked>(_onSigningAgreementChecked);
    on<CustomerSignatureDrew>(_onCustomerSignatureDrew);
    on<CustomerSignatureReset>(_onCustomerSignatureReset);
  }

  _onAlpacaCustomerAgreementOpened(AlpacaCustomerAgreementOpened event,
      Emitter<SigningBrokerAgreementState> emit) async {
    final Uri url = Uri.parse(
        'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf');
    if (!await launchUrl(url)) throw 'Could not launch $url';
    emit(state.copyWith(
        isAlpacaCustomerAgreementOpened:
            event.isAlpacaCustomerAgreementOpened));
  }

  _onUnderstoodAlpacaCustomAgreementChecked(
      UnderstoodAlpacaCustomAgreementChecked event,
      Emitter<SigningBrokerAgreementState> emit) {
    emit(state.copyWith(
        isUnderstoodAlpacaCustomAgreementChecked:
            event.isUnderstoodAlpacaCustomAgreementChecked));
  }

  _onSigningAgreementChecked(SigningAgreementChecked event,
      Emitter<SigningBrokerAgreementState> emit) {
    emit(state.copyWith(
        isSigningAgreementChecked: event.isSigningAgreementChecked));
  }

  _onCustomerSignatureDrew(CustomerSignatureDrew event,
      Emitter<SigningBrokerAgreementState> emit) async {
    if (event.customerSignature != null) {
      emit(state.copyWith(
          customerSignature: event.customerSignature, isSignatureDrew: true));
    }
  }

  _onCustomerSignatureReset(
      CustomerSignatureReset event, Emitter<SigningBrokerAgreementState> emit) {
    emit(state.copyWith(customerSignature: '', isSignatureDrew: false));
  }
}
