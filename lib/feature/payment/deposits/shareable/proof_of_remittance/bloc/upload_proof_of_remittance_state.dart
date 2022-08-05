part of 'upload_proof_of_remittance_bloc.dart';

class UploadProofofRemittanceState extends Equatable {
  final PlatformFile? documentFile;

  const UploadProofofRemittanceState({this.documentFile}) : super();

  @override
  List<Object> get props => [documentFile ?? ''];

  UploadProofofRemittanceState copyWith({
    PlatformFile? documentFile,
  }) {
    return UploadProofofRemittanceState(
        documentFile: documentFile ?? this.documentFile);
  }
}
