import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signing_agreement_tax_state.dart';
part 'signing_agreement_tax_event.dart';

class SigningAgreementTaxBloc
    extends Bloc<SigningAgreementTaxEvent, SigningAgreementTaxState> {
  SigningAgreementTaxBloc() : super(const SigningAgreementTaxState()) {
    on<CertifyNotUsCitizenChecked>(_onCertifyNotUsCitizenChecked);
    on<DeclareCorrectInformationChecked>(_onDeclareCorrectInformationChecked);
    on<FormW8BenOpened>(_onFormW8BenOpened);
  }
  _onCertifyNotUsCitizenChecked(CertifyNotUsCitizenChecked event,
      Emitter<SigningAgreementTaxState> emit) {
    if (event.isCertifyChecked) {
      emit(state.copyWith(isCheckedCertify: event.isCertifyChecked));
    } else {
      emit(const SigningAgreementTaxState());
    }
  }

  _onDeclareCorrectInformationChecked(DeclareCorrectInformationChecked event,
          Emitter<SigningAgreementTaxState> emit) =>
      emit(state.copyWith(isCheckedDeclare: event.isDeclareChecked));

  _onFormW8BenOpened(
          FormW8BenOpened event, Emitter<SigningAgreementTaxState> emit) =>
      emit(state.copyWith(isFormW8BenOpened: event.isFormW8BenOpened));
}
