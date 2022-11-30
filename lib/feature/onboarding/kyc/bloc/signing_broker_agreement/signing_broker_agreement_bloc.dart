import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signing_broker_agreement_repository.dart';

part 'signing_broker_agreement_event.dart';

part 'signing_broker_agreement_state.dart';

class SigningBrokerAgreementBloc
    extends Bloc<SigningBrokerAgreementEvent, SigningBrokerAgreementState> {
  SigningBrokerAgreementBloc(
      {required SigningBrokerAgreementRepository
          signingBrokerAgreementRepository})
      : _signingBrokerAgreementRepository = signingBrokerAgreementRepository,
        super(const SigningBrokerAgreementState()) {
    on<AlpacaCustomerAgreementOpened>(_onAlpacaCustomerAgreementOpened);
    on<AskLoraClientAgreementOpened>(_onAskLoraClientAgreementOpened);
    on<BoundByAlpacaAndLoraAgreementChecked>(
        _onBoundByAlpacaAndLoraAgreementChecked);
    on<UnderstandOnTheAgreementChecked>(_onUnderstandOnTheAgreementChecked);
    on<CertifyNotUSCitizenAgreementChecked>(
        _onCertifyNotUSCitizenAgreementChecked);
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

  _onAskLoraClientAgreementOpened(AskLoraClientAgreementOpened event,
      Emitter<SigningBrokerAgreementState> emit) async {
    emit(state.copyWith(isAskLoraClientAgreementOpened: true));
  }

  _onBoundByAlpacaAndLoraAgreementChecked(
      BoundByAlpacaAndLoraAgreementChecked event,
      Emitter<SigningBrokerAgreementState> emit) {
    emit(state.copyWith(
        isBoundByAlpacaAndLoraAgreementChecked: event.isChecked));
  }

  _onUnderstandOnTheAgreementChecked(UnderstandOnTheAgreementChecked event,
      Emitter<SigningBrokerAgreementState> emit) {
    emit(state.copyWith(isUnderstandOnTheAgreementChecked: event.isChecked));
  }

  _onCertifyNotUSCitizenAgreementChecked(
      CertifyNotUSCitizenAgreementChecked event,
      Emitter<SigningBrokerAgreementState> emit) {
    emit(
        state.copyWith(isCertifyNotUSCitizenAgreementChecked: event.isChecked));
  }

  _onCustomerSignatureDrew(CustomerSignatureDrew event,
      Emitter<SigningBrokerAgreementState> emit) async {
    if (event.customerSignature != null) {
      emit(state.copyWith(
          customerSignature: event.customerSignature,
          isSignatureDrew: true,
          signedTime: event.signedTime));
    }
  }

  _onCustomerSignatureReset(
      CustomerSignatureReset event, Emitter<SigningBrokerAgreementState> emit) {
    emit(state.copyWith(
        customerSignature: '', isSignatureDrew: false, signedTime: ''));
  }
}
