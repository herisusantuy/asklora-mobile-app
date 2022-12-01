import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

import '../../repository/signing_broker_agreement_repository.dart';

part 'signing_agreement_event.dart';

part 'signing_agreement_state.dart';

class SigningAgreementBloc
    extends Bloc<SigningBrokerAgreementEvent, SigningAgreementState> {
  SigningAgreementBloc(
      {required SigningBrokerAgreementRepository
          signingBrokerAgreementRepository,
      required SignatureController signatureController})
      : _signingBrokerAgreementRepository = signingBrokerAgreementRepository,
        _signatureController = signatureController,
        super(SigningAgreementState(signatureController: signatureController)) {
    on<AlpacaCustomerAgreementOpened>(_onAlpacaCustomerAgreementOpened);
    on<AskLoraClientAgreementOpened>(_onAskLoraClientAgreementOpened);
    on<BoundByAlpacaAndLoraAgreementChecked>(
        _onBoundByAlpacaAndLoraAgreementChecked);
    on<UnderstandOnTheAgreementChecked>(_onUnderstandOnTheAgreementChecked);
    on<CertifyNotUSCitizenAgreementChecked>(
        _onCertifyNotUSCitizenAgreementChecked);
    on<RiskDisclosureAgreementChecked>(_onRiskDisclosureAgreementChecked);
    on<CustomerSignatureDrew>(_onCustomerSignatureDrew);
    on<CustomerSignatureReset>(_onCustomerSignatureReset);
  }

  final SigningBrokerAgreementRepository _signingBrokerAgreementRepository;
  final SignatureController _signatureController;

  _onAlpacaCustomerAgreementOpened(AlpacaCustomerAgreementOpened event,
      Emitter<SigningAgreementState> emit) async {
    await _signingBrokerAgreementRepository.openAlpacaCustomerAgreement(
        'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf');

    emit(state.copyWith(
        isAlpacaCustomerAgreementOpened:
            event.isAlpacaCustomerAgreementOpened));
  }

  _onAskLoraClientAgreementOpened(AskLoraClientAgreementOpened event,
      Emitter<SigningAgreementState> emit) async {
    emit(state.copyWith(isAskLoraClientAgreementOpened: true));
  }

  _onBoundByAlpacaAndLoraAgreementChecked(
      BoundByAlpacaAndLoraAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(
        isBoundByAlpacaAndLoraAgreementChecked: event.isChecked));
  }

  _onUnderstandOnTheAgreementChecked(UnderstandOnTheAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(isUnderstandOnTheAgreementChecked: event.isChecked));
  }

  _onCertifyNotUSCitizenAgreementChecked(
      CertifyNotUSCitizenAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(
        state.copyWith(isCertifyNotUSCitizenAgreementChecked: event.isChecked));
  }

  _onRiskDisclosureAgreementChecked(RiskDisclosureAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(isRiskDisclosureAgreementChecked: event.isChecked));
  }

  _onCustomerSignatureDrew(
      CustomerSignatureDrew event, Emitter<SigningAgreementState> emit) async {
    emit(state.copyWith(
        customerSignature: await _getCustomerSignature(),
        isSignatureDrew: true,
        signedTime: DateFormat('yyyy-MM-ddThh:mm').format(DateTime.now())));
  }

  _onCustomerSignatureReset(
      CustomerSignatureReset event, Emitter<SigningAgreementState> emit) {
    _signatureController.clear();
    emit(state.copyWith(
        customerSignature: '', isSignatureDrew: false, signedTime: ''));
  }

  Future<String> _getCustomerSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
      points: _signatureController.points,
    );
    final bytes = await exportController.toPngBytes();
    return bytes != null ? base64Encode(bytes) : '';
  }
}
