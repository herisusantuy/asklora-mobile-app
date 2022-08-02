import 'package:json_annotation/json_annotation.dart';

part 'list_bank.g.dart';

@JsonSerializable()
class ListBanks {
  @JsonKey(name: 'clearing_code')
  final int clearingCode;
  @JsonKey(name: 'bank_name')
  final String bankName;
  @JsonKey(name: 'chinese_name')
  final String chineseName;
  @JsonKey(name: 'swift_bic')
  final String? swiftBic;
  ListBanks(
    this.clearingCode,
    this.bankName,
    this.chineseName,
    this.swiftBic,
  );

  factory ListBanks.fromJson(Map<String, dynamic> json) =>
      _$ListBanksFromJson(json);

  Map<String, dynamic> toJson() => _$ListBanksToJson(this);
}
