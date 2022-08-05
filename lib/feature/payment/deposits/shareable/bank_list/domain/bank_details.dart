import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetails extends Equatable {
  @JsonKey(name: 'clearing_code')
  final int clearingCode;
  @JsonKey(name: 'bank_name')
  final String bankName;
  @JsonKey(name: 'chinese_name')
  final String chineseName;
  @JsonKey(name: 'swift_bic')
  final String? swiftBic;

  const BankDetails(
    this.clearingCode,
    this.bankName,
    this.chineseName,
    this.swiftBic,
  );

  factory BankDetails.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);

  @override
  List<Object?> get props => [clearingCode, bankName, chineseName, swiftBic];

  @override
  String toString() {
    return '$clearingCode $bankName $chineseName $swiftBic';
  }
}
