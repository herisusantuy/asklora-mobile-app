import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_bank_account_request.g.dart';

@JsonSerializable()
class AddBankAccountRequest extends Equatable {
  @JsonKey(name: 'bank_code_type')
  final String bankCodeType;
  @JsonKey(name: 'bank_transfer_type')
  final String bankTransferType;
  @JsonKey(name: 'bank_code')
  final String bankCode;
  @JsonKey(name: 'account_name')
  final String accountName;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  final String? country;
  final String? name;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? city;
  @JsonKey(name: 'street_address')
  final String? streetAddress;

  const AddBankAccountRequest(
      {required this.bankCodeType,
      required this.bankCode,
      required this.accountName,
      required this.accountNumber,
      required this.bankTransferType,
      this.country,
      this.name,
      this.postalCode,
      this.city,
      this.streetAddress});

  factory AddBankAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AddBankAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddBankAccountRequestToJson(this);

  @override
  List<Object?> get props => [
        bankCodeType,
        bankTransferType,
        bankCode,
        accountName,
        accountNumber,
        country,
        name,
        postalCode,
        city,
        streetAddress
      ];
}
