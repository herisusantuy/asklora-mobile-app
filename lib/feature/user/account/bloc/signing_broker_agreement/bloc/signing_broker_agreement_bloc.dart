import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';

import '../../../repository/signing_broker_agreement_repository.dart';

part 'signing_broker_agreement_event.dart';
part 'signing_broker_agreement_state.dart';

class SigningBrokerAgreementBloc
    extends Bloc<SigningBrokerAgreementEvent, SigningBrokerAgreementState> {
  SigningBrokerAgreementBloc(
      SigningBrokerAgreementRepository signingBrokerAgreementRepository)
      : _signingBrokerAgreementRepository = signingBrokerAgreementRepository,
        super(const SigningBrokerAgreementState()) {
    on<AlpacaCustomerAgreementOpened>(_onAlpacaCustomerAgreementOpened);
    on<UnderstoodAlpacaCustomAgreementChecked>(
        _onUnderstoodAlpacaCustomAgreementChecked);
    on<SigningAgreementChecked>(_onSigningAgreementChecked);
    on<CustomerSignatureDrew>(_onCustomerSignatureDrew);
    on<CustomerSignatureReset>(_onCustomerSignatureReset);
  }

  final SigningBrokerAgreementRepository _signingBrokerAgreementRepository;
  _onAlpacaCustomerAgreementOpened(AlpacaCustomerAgreementOpened event,
      Emitter<SigningBrokerAgreementState> emit) async {
    await _signingBrokerAgreementRepository.openAlpacaCustomerAgreement(
        'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf');
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
