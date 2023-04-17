import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/extensions.dart';

part 'bot_summary_transaction_model.g.dart';

@JsonSerializable()
class BotSummaryTransactionModel extends Equatable {
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

  String get createdFormattedString => formatDateTimeAsString(created);

  const BotSummaryTransactionModel(
      this.pk, this.created, this.updated, this.status, this.investmentAmount);

  factory BotSummaryTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$BotSummaryTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotSummaryTransactionModelToJson(this);

  @override
  List<Object?> get props {
    return [pk, created, updated, status, investmentAmount];
  }
}
