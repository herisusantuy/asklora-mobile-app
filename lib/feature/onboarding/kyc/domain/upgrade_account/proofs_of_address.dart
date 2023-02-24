import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proofs_of_address.g.dart';

@JsonSerializable()
class ProofsOfAddress extends Equatable {
  @JsonKey(name: 'proof_file')
  final String? proofFile;

  const ProofsOfAddress({
    this.proofFile,
  });

  factory ProofsOfAddress.fromJson(Map<String, dynamic> json) =>
      _$ProofsOfAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ProofsOfAddressToJson(this);

  @override
  List<Object> get props => [
        proofFile ?? '',
      ];
}
