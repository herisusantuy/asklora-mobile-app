import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proof_of_remittance_response.g.dart';

@JsonSerializable()
class ProofOfRemittanceResponse extends Equatable {
  final String detail;

  const ProofOfRemittanceResponse(this.detail);

  factory ProofOfRemittanceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProofOfRemittanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProofOfRemittanceResponseToJson(this);

  @override
  List<Object?> get props => [detail];
}
