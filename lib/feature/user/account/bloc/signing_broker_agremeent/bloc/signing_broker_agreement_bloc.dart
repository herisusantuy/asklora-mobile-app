import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    final Uri _url = Uri.parse(
        'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf');
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
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
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
      points: event.customerSignature.points,
    );
    final signature = await exportController.toPngBytes();
    exportController.dispose();
    emit(state.copyWith(customerSignature: signature));
  }

  _onCustomerSignatureReset(
      CustomerSignatureReset event, Emitter<SigningBrokerAgreementState> emit) {
    print('reset triggered');
    state.customerSignature!.clear();
    emit(state.copyWith(customerSignature: null));
  }
}
