// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof_of_remittance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProofOfRemittanceRequest _$ProofOfRemittanceRequestFromJson(
        Map<String, dynamic> json) =>
    ProofOfRemittanceRequest(
      (json['deposit_amount'] as num).toDouble(),
      (json['proof_files'] as List<dynamic>)
          .map((e) => ProofFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProofOfRemittanceRequestToJson(
        ProofOfRemittanceRequest instance) =>
    <String, dynamic>{
      'deposit_amount': instance.depositAmount,
      'proof_files': instance.proofFiles,
    };

ProofFile _$ProofFileFromJson(Map<String, dynamic> json) => ProofFile(
      json['file'] as String,
    );

Map<String, dynamic> _$ProofFileToJson(ProofFile instance) => <String, dynamic>{
      'file': instance.file,
    };
