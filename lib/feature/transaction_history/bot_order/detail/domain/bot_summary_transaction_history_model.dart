import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/date_utils.dart';
import '../../../../../../core/utils/extensions.dart';

part 'bot_summary_transaction_history_model.g.dart';

@JsonSerializable()
class BotSummaryTransactionHistoryModel extends Equatable {
  final String uid;
  final String date;
  final String amount;
  final String fee;
  final String status;
  @JsonKey(name: 'total_pnl')
  final double totalPnL;

  String get totalPnLString {
    double finalPnlAmountDouble = checkDouble(totalPnL);
    return (finalPnlAmountDouble > 0)
        ? '+$finalPnlAmountDouble'
        : (finalPnlAmountDouble < 0)
            ? '$finalPnlAmountDouble'
            : 'NA';
  }

  String get investmentAmountString {
    double investmentAmountDouble = checkDouble(amount);
    return (investmentAmountDouble > 0)
        ? 'HKD${investmentAmountDouble.convertToCurrencyDecimal()}'
        : 'NA';
  }

  String get createdFormattedString =>
      formatDateTimeAsString(date, dateFormat: 'yyyy-MM-dd HH:mm:ss');

  const BotSummaryTransactionHistoryModel(
      this.uid, this.date, this.status, this.amount, this.fee, this.totalPnL);

  factory BotSummaryTransactionHistoryModel.fromJson(
          Map<String, dynamic> json) =>
      _$BotSummaryTransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BotSummaryTransactionHistoryModelToJson(this);

  @override
  List<Object?> get props {
    return [uid, date, status, amount];
  }
}
