import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/extensions.dart';

enum TransactionHistoryType { all, botOrder, transfer }

abstract class TransactionModel {
  TransactionHistoryType? transactionHistoryType;
  String? id;
  String? date;
  String? title;
  String? status;
  double? amount;

  TransactionModel(
      {this.id,
      this.date,
      this.title,
      this.status,
      this.amount,
      this.transactionHistoryType});
}

@JsonSerializable()
class BotOrderTransactionModel extends TransactionModel {
  final bool isDummy;

  BotOrderTransactionModel(
      {super.id,
      super.date,
      super.title,
      super.status,
      super.amount,
      super.transactionHistoryType = TransactionHistoryType.botOrder,
      this.isDummy = false});

  static BotOrderTransactionModel fromJson(Map<String, dynamic> json) =>
      BotOrderTransactionModel(
          transactionHistoryType: TransactionHistoryType.botOrder,
          id: json['pk'],
          date: json['updated'],
          title: json['ticker'],
          status: json['status'],
          amount: checkDouble(json['investment_amount']),
          isDummy: json['is_dummy']);
}
