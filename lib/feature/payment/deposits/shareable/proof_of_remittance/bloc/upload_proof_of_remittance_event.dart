part of 'upload_proof_of_remittance_bloc.dart';

abstract class UploadProofofRemittanceEvent extends Equatable {
  const UploadProofofRemittanceEvent() : super();

  @override
  List<Object?> get props => [];
}

class PickFile extends UploadProofofRemittanceEvent {
  const PickFile() : super();

  @override
  List<Object> get props => [];
}

class DepositAmountChanged extends UploadProofofRemittanceEvent {
  final double value;

  const DepositAmountChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class SubmitProofofRemittance extends UploadProofofRemittanceEvent {
  const SubmitProofofRemittance() : super();

  @override
  List<Object> get props => [];
}
