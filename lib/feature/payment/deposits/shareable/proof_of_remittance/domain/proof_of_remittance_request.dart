import 'package:json_annotation/json_annotation.dart';

part 'proof_of_remittance_request.g.dart';

@JsonSerializable()
class ProofOfRemittanceRequest {
  @JsonKey(name: 'deposit_amount')
  final double depositAmount;
  @JsonKey(name: 'proof_files')
  final List<ProofFile> proofFiles;

  ProofOfRemittanceRequest(this.depositAmount, this.proofFiles);

  factory ProofOfRemittanceRequest.fromJson(Map<String, dynamic> json) =>
      _$ProofOfRemittanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProofOfRemittanceRequestToJson(this);
}

@JsonSerializable()
class ProofFile {
  final String file;

  ProofFile(this.file);

  factory ProofFile.fromJson(Map<String, dynamic> json) =>
      _$ProofFileFromJson(json);

  Map<String, dynamic> toJson() => _$ProofFileToJson(this);
}
