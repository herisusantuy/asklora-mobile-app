import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/extensions.dart';

part 'bot_active_order_model.g.dart';

@JsonSerializable()
class BotActiveOrderModel {
  final String uid;
  final String name;
  final String status;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'total_pnl')
  final double totalPnl;
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
  final String ticker;
  @JsonKey(name: 'bot_apps_name')
  final String botAppsName;

  String get expireDateStr => expireDate ?? '';

  const BotActiveOrderModel(
      this.uid,
      this.name,
      this.status,
      this.isActive,
      this.totalPnl,
      this.expireDate,
      this.tickerName,
      this.currentPrice,
      this.isDummy,
      this.spotDate,
      this.ticker,
      this.botAppsName);

  String get totalPnlRetString {
    double totalPnlDouble = checkDouble(totalPnl);
    return (totalPnlDouble > 0)
        ? '+$totalPnlDouble%'
        : (totalPnlDouble < 0)
        ? '$totalPnlDouble%'
        : '/';
  }

  factory BotActiveOrderModel.fromJson(Map<String, dynamic> json) =>
      _$BotActiveOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotActiveOrderModelToJson(this);
}
