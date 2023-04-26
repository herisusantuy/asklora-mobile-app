import 'package:equatable/equatable.dart';

import '../../../core/utils/extensions.dart';

enum TransactionHistoryType { all, botOrder, transfer, botOrderSummary }

abstract class TransactionModel extends Equatable {
  final TransactionHistoryType? transactionHistoryType;
  final String? id;
  final String? date;
  final String? title;
  final String? status;
  final double? amount;

  String get statusString => status ?? 'NA';

  String get titleString => title ?? 'NA';

  String get amountString {
    double amountDouble = checkDouble(amount);
    return (amountDouble > 0) ? amountDouble.convertToCurrencyDecimal() : 'NA';
  }

  const TransactionModel(
      {this.id,
      this.date,
      this.title,
      this.status,
      this.amount,
      this.transactionHistoryType});

  @override
  List<Object?> get props {
    return [id, date, title, status, amount, transactionHistoryType];
  }
}

class BotOrderTransactionModel extends TransactionModel {
  final bool isDummy;

  const BotOrderTransactionModel(
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

  @override
  List<Object?> get props {
    return [isDummy];
  }
}
