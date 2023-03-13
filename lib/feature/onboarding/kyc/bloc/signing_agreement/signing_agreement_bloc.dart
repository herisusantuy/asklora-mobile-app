import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signing_broker_agreement_repository.dart';
import '../personal_info/personal_info_bloc.dart';

part 'signing_agreement_event.dart';
part 'signing_agreement_state.dart';

class SigningAgreementBloc
    extends Bloc<SigningBrokerAgreementEvent, SigningAgreementState> {
  SigningAgreementBloc({
    required SigningBrokerAgreementRepository signingBrokerAgreementRepository,
    required PersonalInfoBloc personalInfoBloc,
  })  : _signingBrokerAgreementRepository = signingBrokerAgreementRepository,
        _personalInfoBloc = personalInfoBloc,
        super(const SigningAgreementState()) {
    on<AskLoraClientAgreementOpened>(_onAskLoraClientAgreementOpened);
    on<BoundByAskloraAgreementChecked>(_onBoundByAskloraAgreementChecked);
    on<UnderstandOnTheAgreementChecked>(_onUnderstandOnTheAgreementChecked);
    on<RiskDisclosureAgreementChecked>(_onRiskDisclosureAgreementChecked);
    on<SignatureChecked>(_onSignatureChecked);
    on<LegalNameSignatureChanged>(_onLegalNameSignatureChanged);
    on<W8BenFormOpened>(_onW8BenFormOpened);
    on<SignAgreementScreenRendered>(_onSignAgreementRendered);
  }

  final SigningBrokerAgreementRepository _signingBrokerAgreementRepository;
  final PersonalInfoBloc _personalInfoBloc;

  _onAskLoraClientAgreementOpened(AskLoraClientAgreementOpened event,
      Emitter<SigningAgreementState> emit) async {
    emit(state.copyWith(isAskLoraClientAgreementOpened: true));
  }

  _onW8BenFormOpened(
      W8BenFormOpened event, Emitter<SigningAgreementState> emit) async {
    await _signingBrokerAgreementRepository
        .openW8BenForm('https://www.irs.gov/pub/irs-pdf/fw8ben.pdf');
  }

  _onBoundByAskloraAgreementChecked(BoundByAskloraAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(isBoundByAskloraAgreementChecked: event.isChecked));
  }

  _onUnderstandOnTheAgreementChecked(UnderstandOnTheAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(isUnderstandOnTheAgreementChecked: event.isChecked));
  }

  _onRiskDisclosureAgreementChecked(RiskDisclosureAgreementChecked event,
      Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(isRiskDisclosureAgreementChecked: event.isChecked));
  }

  _onSignatureChecked(
      SignatureChecked event, Emitter<SigningAgreementState> emit) {
    emit(state.copyWith(isSignatureChecked: event.isChecked));
  }

  _onLegalNameSignatureChanged(
      LegalNameSignatureChanged event, Emitter<SigningAgreementState> emit) {
    String fullName =
        '${_personalInfoBloc.state.firstName} ${_personalInfoBloc.state.lastName}';
    print('personalInfo state >> $fullName');
    if (event.legalName != fullName) {
      emit(state.copyWith(
        legalName: event.legalName,
        legalNameErrorText: 'Your input does not match',
        isInputNameValid: false,
      ));
    } else {
      emit(state.copyWith(
        legalName: event.legalName,
        legalNameErrorText: '',
        isInputNameValid: true,
      ));
    }
  }

  _onSignAgreementRendered(
      SignAgreementScreenRendered event, Emitter<SigningAgreementState> emit) {
    String fullName =
        '${_personalInfoBloc.state.firstName} ${_personalInfoBloc.state.lastName}';
    if (event.legalName != fullName) {
      emit(state.copyWith(
        legalName: event.legalName,
        legalNameErrorText: 'Your input does not match',
        isInputNameValid: false,
      ));
    } else {
      emit(state.copyWith(
        legalName: event.legalName,
        legalNameErrorText: '',
        isInputNameValid: true,
      ));
    }
  }
}
