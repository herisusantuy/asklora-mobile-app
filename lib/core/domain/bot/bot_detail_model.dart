import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/extensions.dart';
import 'bot_info.dart';

part 'bot_detail_model.g.dart';

@JsonSerializable()
class BotDetailModel extends Equatable {
  final String uid;
  final String name;
  @JsonKey(name: 'bot_info')
  final BotInfo botInfo;
  @JsonKey(name: 'investment_amount')
  final double investmentAmount;
  @JsonKey(name: 'final_return')
  final double? finalReturn;
  @JsonKey(name: 'bot_duration')
  final String botDuration;
  @JsonKey(name: 'spot_date')
  final String spotDate;
  @JsonKey(name: 'expire_date')
  final String? expireDate;
  @JsonKey(name: 'est_max_loss')
  final double estMaxLoss;
  @JsonKey(name: 'est_max_profit')
  final double estMaxProfit;
  final String status;
  @JsonKey(name: 'rollover_count')
  final int rolloverCount;
  @JsonKey(name: 'bot_stock_value')
  final double botStockValue;
  @JsonKey(name: 'total_pnl_pct')
  final double totalPnLPct;

  const BotDetailModel(
      this.uid,
      this.name,
      this.botInfo,
      this.investmentAmount,
      this.finalReturn,
      this.botDuration,
      this.spotDate,
      this.expireDate,
      this.estMaxLoss,
      this.estMaxProfit,
      this.status,
      this.rolloverCount,
      this.botStockValue,
      this.totalPnLPct);

  String get rolloverCountString => rolloverCount.toString();

  String get botStockValueString {
    final double botStockValueDouble = checkDouble(botStockValue);
    return (botStockValueDouble > 0)
        ? botStockValueDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get estMaxProfitPctString {
    final double targetProfitPctDouble = checkDouble(estMaxProfit);
    return (targetProfitPctDouble > 0)
        ? targetProfitPctDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get estMaxLossPctString {
    final double maxLossPctDouble = checkDouble(estMaxLoss).abs();
    return (maxLossPctDouble > 0)
        ? maxLossPctDouble.convertToCurrencyDecimal()
        : '/';
  }

  String get investmentAmountString {
    final double investmentAmountDouble = checkDouble(investmentAmount);
    return (investmentAmountDouble > 0)
        ? investmentAmountDouble.convertToCurrencyDecimal()
        : 'NA';
  }

  String get spotDateFormatted =>
      formatDateTimeAsString(spotDate, dateFormat: 'dd/MM/yyyy');

  String get expireDateFormatted => expireDate != null
      ? formatDateTimeAsString(expireDate, dateFormat: 'dd/MM/yyyy')
      : 'NA';

  String get totalPnLPctString {
    final double totalPnlPctDouble = checkDouble(totalPnLPct);
    final String totalPnlPctFormatted =
        totalPnlPctDouble.convertToCurrencyDecimal();
    return (totalPnlPctDouble > 0)
        ? '+$totalPnlPctFormatted%'
        : (totalPnlPctDouble < 0)
            ? '$totalPnlPctFormatted%'
            : '/';
  }

  factory BotDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BotDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotDetailModelToJson(this);

  @override
  List<Object?> get props => [
        uid,
        name,
        botInfo,
        investmentAmount,
        finalReturn,
        botDuration,
        spotDate,
        expireDate,
        estMaxLoss,
        estMaxProfit,
        status,
        rolloverCount,
        botStockValue,
      ];
}
