import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/date_utils.dart';
import '../../../../../../core/utils/extensions.dart';

part 'bot_activities_transaction_history_model.g.dart';

@JsonSerializable()
class BotActivitiesTransactionHistoryModel {
  final String uid;
  final String created;
  final String side;
  final String action;
  final String status;
  final double price;
  final double qty;
  final double invested;
  @JsonKey(name: 'invested_currency')
  final String investedCurrency;
  @JsonKey(name: 'filled_qty')
  final double filledQty;
  @JsonKey(name: 'filled_avg_price')
  final double? filledAvgPrice;
  @JsonKey(name: 'filled_at')
  final String? filledAt;
  @JsonKey(name: 'filled_at_hkt')
  final String? filledAtHkt;
  @JsonKey(name: 'expire_at')
  final String? expiredAt;
  @JsonKey(name: 'canceled_at')
  final String? canceledAt;
  @JsonKey(name: 'failed_at')
  final String? failedAt;

  const BotActivitiesTransactionHistoryModel(
      this.uid,
      this.created,
      this.side,
      this.action,
      this.status,
      this.price,
      this.qty,
      this.invested,
      this.investedCurrency,
      this.filledQty,
      this.filledAvgPrice,
      this.filledAt,
      this.filledAtHkt,
      this.expiredAt,
      this.canceledAt,
      this.failedAt);

  String get investedString {
    final double investmentAmountDouble = checkDouble(invested);
    return 'USD ${investmentAmountDouble.convertToCurrencyDecimal()}';
  }

  String get dateFormattedString =>
      formatDateTimeAsString(created, dateFormat: 'HH:mm:ss');

  String get filledAvgPriceString {
    final double filledAvgPriceDouble = checkDouble(price);
    return (filledAvgPriceDouble > 0)
        ? 'USD ${filledAvgPriceDouble.toInt()}'
        : 'NA';
  }

  String get filledQtyString {
    final double filledAvgQtyDouble = checkDouble(filledQty);
    return (filledAvgQtyDouble > 0) ? filledAvgQtyDouble.toString() : 'NA';
  }

  factory BotActivitiesTransactionHistoryModel.fromJson(
          Map<String, dynamic> json) =>
      _$BotActivitiesTransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BotActivitiesTransactionHistoryModelToJson(this);
}
