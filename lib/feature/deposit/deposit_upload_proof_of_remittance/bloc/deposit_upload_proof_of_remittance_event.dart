part of 'deposit_upload_proof_of_remittance_bloc.dart';

abstract class DepositUploadProofofRemittanceEvent extends Equatable {
  const DepositUploadProofofRemittanceEvent() : super();

  @override
  List<Object?> get props => [];
}

class PickFile extends DepositUploadProofofRemittanceEvent {
  const PickFile() : super();

  @override
  List<Object> get props => [];
}
