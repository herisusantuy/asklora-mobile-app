part of 'upload_proof_of_remittance_bloc.dart';

class UploadProofofRemittanceState extends Equatable {
  final BaseResponse response;
  final List<PlatformFile> documentFiles;
  final double depositAmount;

  const UploadProofofRemittanceState(
      {this.documentFiles = const [],
      this.depositAmount = 0,
      this.response = const BaseResponse()})
      : super();

  @override
  List<Object> get props => [documentFiles, depositAmount, response];

  UploadProofofRemittanceState copyWith({
    BaseResponse? response,
    List<PlatformFile>? documentFiles,
    double? depositAmount,
  }) {
    return UploadProofofRemittanceState(
        response: response ?? this.response,
        documentFiles: documentFiles ?? this.documentFiles,
        depositAmount: depositAmount ?? this.depositAmount);
  }
}
