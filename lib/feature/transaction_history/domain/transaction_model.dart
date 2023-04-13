import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/extensions.dart';
import '../../chart/domain/chart_models.dart';

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

class BotOrderTransactionModel extends TransactionModel {
  BotOrderTransactionModel(
      {super.id,
      super.date,
      super.title,
      super.status,
      super.amount,
      super.transactionHistoryType});

  BotOrderTransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['pk'];
    date = json['updated'];
    title = json['ticker'];
    status = json['status'];
    amount = checkDouble(json['investment_amount']);
    transactionHistoryType = TransactionHistoryType.botOrder;
  }
}
