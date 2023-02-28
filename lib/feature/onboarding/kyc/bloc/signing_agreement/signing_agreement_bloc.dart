import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signing_broker_agreement_repository.dart';

part 'signing_agreement_event.dart';

part 'signing_agreement_state.dart';

class SigningAgreementBloc
    extends Bloc<SigningBrokerAgreementEvent, SigningAgreementState> {
  SigningAgreementBloc({
    required SigningBrokerAgreementRepository signingBrokerAgreementRepository,
  })  : _signingBrokerAgreementRepository = signingBrokerAgreementRepository,
        super(const SigningAgreementState()) {
    on<AskLoraClientAgreementOpened>(_onAskLoraClientAgreementOpened);
    on<BoundByAskloraAgreementChecked>(_onBoundByAskloraAgreementChecked);
    on<UnderstandOnTheAgreementChecked>(_onUnderstandOnTheAgreementChecked);
    on<RiskDisclosureAgreementChecked>(_onRiskDisclosureAgreementChecked);
    on<SignatureChecked>(_onSignatureChecked);
    on<LegalNameSignatureChanged>(_onLegalNameSignatureChanged);
    on<W8BenFormOpened>(_onW8BenFormOpened);
  }

  final SigningBrokerAgreementRepository _signingBrokerAgreementRepository;

  _onAskLoraClientAgreementOpened(AskLoraClientAgreementOpened event,
      Emitter<SigningAgreementState> emit) async {
    emit(state.copyWith(isAskLoraClientAgreementOpened: true));
  }

  _onW8BenFormOpened(
      W8BenFormOpened event, Emitter<SigningAgreementState> emit) async {
    await _signingBrokerAgreementRepository.openAlpacaCustomerAgreement(
        'https://www.irs.gov/pub/irs-pdf/fw8ben.pdf');
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
    emit(state.copyWith(legalName: event.legalName));
  }
}
