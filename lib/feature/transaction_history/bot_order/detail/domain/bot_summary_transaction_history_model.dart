import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/date_utils.dart';
import '../../../../../../core/utils/extensions.dart';

part 'bot_summary_transaction_history_model.g.dart';

@JsonSerializable()
class BotSummaryTransactionHistoryModel extends Equatable {
  final String pk;
  final String created;
  final String updated;
  final String status;
  @JsonKey(name: 'investment_amount')
  final double investmentAmount;

  String get investmentAmountString {
    double investmentAmountDouble = checkDouble(investmentAmount);
    return (investmentAmountDouble > 0)
        ? 'HKD${investmentAmountDouble.convertToCurrencyDecimal()}'
        : 'NA';
  }

  String get createdFormattedString =>
      formatDateTimeAsString(created, dateFormat: 'yyyy-MM-dd HH:mm:ss');

  const BotSummaryTransactionHistoryModel(
      this.pk, this.created, this.updated, this.status, this.investmentAmount);

  factory BotSummaryTransactionHistoryModel.fromJson(
          Map<String, dynamic> json) =>
      _$BotSummaryTransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BotSummaryTransactionHistoryModelToJson(this);

  @override
  List<Object?> get props {
    return [pk, created, updated, status, investmentAmount];
  }
}
