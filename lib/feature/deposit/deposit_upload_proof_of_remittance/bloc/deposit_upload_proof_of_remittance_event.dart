part of 'deposit_upload_proof_of_remittance_bloc.dart';

abstract class DepositUploadProofofRemittanceEvent extends Equatable {
  const DepositUploadProofofRemittanceEvent() : super();

  @override
  List<Object?> get props => [];
}

class PickDocumentFile extends DepositUploadProofofRemittanceEvent {
  const PickDocumentFile() : super();

  @override
  List<Object> get props => [];
}
