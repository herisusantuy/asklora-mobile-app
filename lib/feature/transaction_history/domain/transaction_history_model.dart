import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/date_utils.dart';
import '../../../core/utils/extensions.dart';
import '../utils/transaction_history_util.dart';

part 'transaction_history_model.g.dart';

enum TransactionHistoryType { all, bot, transfer }

@JsonSerializable()
class TransactionHistoryModel extends Equatable {
  @JsonKey(name: 'history_type')
  final TransactionHistoryType transactionHistoryType;
  final dynamic id;
  final String? created;
  final String updated;
  final String title;
  final String status;
  final dynamic amount;
  @JsonKey(name: 'bank_code')
  final String? bankCode;
  @JsonKey(name: 'bank_account_number')
  final String? bankAccountNumber;
  @JsonKey(name: 'time_complete')
  final String? timeComplete;
  @JsonKey(name: 'is_dummy')
  final bool isDummy;

  DateTime? get createdDateTimeFormat {
    if (created != null) {
      try {
        return DateTime.parse(created!);
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }

  const TransactionHistoryModel(
    this.id,
    this.transactionHistoryType,
    this.created,
    this.updated,
    this.title,
    this.status,
    this.amount, {
    this.timeComplete,
    this.bankCode,
    this.bankAccountNumber,
    this.isDummy = false,
  });

  String get amountString => checkDouble(amount).convertToCurrencyDecimal();

  String get idString => id.toString();

  TransferStatus get transferStatus => TransferStatus.findByString(status);

  TransferType get transferType => TransferType.findByString(title);

  String get createdFormatted =>
      formatDateTimeAsString(created, dateFormat: 'dd/MM/yyyy hh:mm');

  String get timeCompletedFormatted =>
      timeComplete != null && timeComplete!.isNotEmpty
          ? formatDateTimeAsString(timeComplete, dateFormat: 'dd/MM/yyyy hh:mm')
          : '';

  String get bankAccountNumberString => '$bankCode-$bankAccountNumber';

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHistoryModelToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      created,
      title,
      status,
      amount,
      transactionHistoryType,
      isDummy
    ];
  }
}
