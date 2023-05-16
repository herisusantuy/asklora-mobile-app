import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/extensions.dart';

part 'transaction_history_model.g.dart';

enum TransactionHistoryType { all, bot, transfer }

@JsonSerializable()
class TransactionHistoryModel extends Equatable {
  @JsonKey(name: 'transaction_history_type')
  final TransactionHistoryType transactionHistoryType;
  final dynamic id;
  final String created;
  final String updated;
  final String title;
  final String status;
  final dynamic amount;
  @JsonKey(name: 'is_dummy')
  final bool isDummy;

  const TransactionHistoryModel(
    this.id,
    this.transactionHistoryType,
    this.created,
    this.updated,
    this.title,
    this.status,
    this.amount, {
    this.isDummy = false,
  });

  String get amountString => checkDouble(amount).toString();
  String get idString => id.toString();

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
