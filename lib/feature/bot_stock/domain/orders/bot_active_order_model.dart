import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../generated/l10n.dart';
import '../../utils/bot_stock_utils.dart';

part 'bot_active_order_model.g.dart';

@JsonSerializable()
class BotActiveOrderModel extends Equatable {
  final String uid;
  final String status;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'total_pnl_pct')
  final double totalPnLPct;
  @JsonKey(name: 'expire_date')
  final String? expireDate;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @JsonKey(name: 'is_dummy')
  final bool isDummy;
  @JsonKey(name: 'spot_date')
  final String spotDate;
  final String symbol;
  @JsonKey(name: 'bot_apps_name')
  final String botAppsName;
  @JsonKey(name: 'bot_duration')
  final String botDuration;
  @JsonKey(name: 'optimal_time')
  final String optimalTime;
  final String ticker;

  String startOrExpireDateStr(BuildContext context) {
    if (botStatus == BotStatus.pending) {
      return '${S.of(context).startsAt} ${convertDateToHktString(optimalTime, dateFormat: 'HH:mm, dd/MM')}';
    } else {
      return '${S.of(context).expiresAt} ${formatDateTimeAsString(expireDate, dateFormat: 'dd/MM')}';
    }
  }

  String get botName =>
      '${BotType.findByString(botAppsName).upperCaseName} $symbol';

  BotStatus get botStatus => BotStatus.findByOmsStatus(status);

  const BotActiveOrderModel(
      this.uid,
      this.status,
      this.isActive,
      this.totalPnLPct,
      this.expireDate,
      this.tickerName,
      this.currentPrice,
      this.isDummy,
      this.spotDate,
      this.symbol,
      this.botAppsName,
      this.botDuration,
      this.ticker,
      this.optimalTime);

  String get totalPnLPctString {
    final double totalPnLPctDouble = checkDouble(totalPnLPct);
    final String totalPnLPctString =
        totalPnLPctDouble.convertToCurrencyDecimal();
    return (totalPnLPctDouble > 0)
        ? '+$totalPnLPctString%'
        : (totalPnLPctDouble < 0)
            ? '$totalPnLPctString%'
            : '/';
  }

  factory BotActiveOrderModel.fromJson(Map<String, dynamic> json) =>
      _$BotActiveOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotActiveOrderModelToJson(this);

  @override
  List<Object> get props => [
        uid,
        status,
        isActive,
        totalPnLPct,
        tickerName,
        currentPrice,
        isDummy,
        spotDate,
        symbol,
        botAppsName,
        ticker,
      ];
}
