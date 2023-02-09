import 'package:equatable/equatable.dart';
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
    on<AskLoraClientAgreementOpened>(_onAskLoraClientAgreementOpened);
    on<BoundByAskloraAgreementChecked>(_onBoundByAskloraAgreementChecked);
    on<UnderstandOnTheAgreementChecked>(_onUnderstandOnTheAgreementChecked);
    on<RiskDisclosureAgreementChecked>(_onRiskDisclosureAgreementChecked);
    on<CustomerSignatureDrew>(_onCustomerSignatureDrew);
    on<CustomerSignatureReset>(_onCustomerSignatureReset);
  }

  final SigningBrokerAgreementRepository _signingBrokerAgreementRepository;
  final SignatureController _signatureController;

  _onAskLoraClientAgreementOpened(AskLoraClientAgreementOpened event,
      Emitter<SigningAgreementState> emit) async {
    emit(state.copyWith(isAskLoraClientAgreementOpened: true));
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

  _onCustomerSignatureDrew(
      CustomerSignatureDrew event, Emitter<SigningAgreementState> emit) async {
    emit(state.copyWith(
        customerSignature: await _signingBrokerAgreementRepository
            .getCustomerSignature(state.signatureController.points),
        isSignatureDrew: true,
        signedTime: DateFormat('yyyy-MM-ddThh:mm').format(DateTime.now())));
  }

  _onCustomerSignatureReset(
      CustomerSignatureReset event, Emitter<SigningAgreementState> emit) {
    _signatureController.clear();
    emit(state.copyWith(
        customerSignature: '', isSignatureDrew: false, signedTime: ''));
  }
}
