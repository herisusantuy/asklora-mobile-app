import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/date_utils.dart';
import '../../../../../../core/utils/extensions.dart';

part 'bot_activities_transaction_model.g.dart';

@JsonSerializable()
class BotActivitiesTransactionModel extends Equatable {
  @JsonKey(name: 'bot_order__pk')
  final String pk;
  final String created;
  final String side;
  @JsonKey(name: 'filled_qty')
  final double filledQty;
  @JsonKey(name: 'filled_avg_price')
  final double filledAvgPrice;
  @JsonKey(name: 'invested')
  final double invested;

  String get investedString {
    double investmentAmountDouble = checkDouble(invested);
    return 'USD ${investmentAmountDouble.convertToCurrencyDecimal()}';
  }

  String get filledAvgPriceString {
    double filledAvgPriceDouble = checkDouble(filledAvgPrice);
    return (filledAvgPriceDouble > 0)
        ? 'USD ${filledAvgPriceDouble.toInt()}'
        : 'NA';
  }

  String get filledQtyString {
    double filledAvgQtyDouble = checkDouble(filledQty);
    return (filledAvgQtyDouble > 0)
        ? 'USD ${filledAvgQtyDouble.toInt()}'
        : 'NA';
  }

  String get createdFormattedString => formatDateTimeAsString(created, dateFormat: 'HH:mm:ss');

  const BotActivitiesTransactionModel(
    this.pk,
    this.created,
    this.side,
    this.filledQty,
    this.filledAvgPrice,
    this.invested,
  );

  factory BotActivitiesTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$BotActivitiesTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotActivitiesTransactionModelToJson(this);

  @override
  List<Object?> get props {
    return [pk, created, side, filledQty, filledAvgPrice, invested];
  }
}
