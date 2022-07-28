part of 'deposit_upload_proof_of_remittance_bloc.dart';

class DepositUploadProofofRemittanceState extends Equatable {
  final PlatformFile? documentFile;

  const DepositUploadProofofRemittanceState({this.documentFile}) : super();

  @override
  List<Object> get props => [documentFile ?? ''];

  DepositUploadProofofRemittanceState copyWith({
    PlatformFile? documentFile,
  }) {
    return DepositUploadProofofRemittanceState(
        documentFile: documentFile ?? this.documentFile);
  }
}
