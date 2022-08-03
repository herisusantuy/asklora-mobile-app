import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_bank.g.dart';

@JsonSerializable()
class ListBanks extends Equatable {
  @JsonKey(name: 'clearing_code')
  final int clearingCode;
  @JsonKey(name: 'bank_name')
  final String bankName;
  @JsonKey(name: 'chinese_name')
  final String chineseName;
  @JsonKey(name: 'swift_bic')
  final String? swiftBic;
  const ListBanks(
    this.clearingCode,
    this.bankName,
    this.chineseName,
    this.swiftBic,
  );

  factory ListBanks.fromJson(Map<String, dynamic> json) =>
      _$ListBanksFromJson(json);

  Map<String, dynamic> toJson() => _$ListBanksToJson(this);

  @override
  List<Object?> get props => [clearingCode, bankName, chineseName, swiftBic];
}
