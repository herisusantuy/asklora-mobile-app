import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/date_utils.dart';
import '../../../core/utils/extensions.dart';
import '../../chart/domain/chart_models.dart';

part 'bot_detail_model.g.dart';

@JsonSerializable()
class BotDetailModel extends Equatable {
  final BotModel bot;
  final String symbol;
  final String ticker;

  @JsonKey(name: 'ticker_name')
  final String tickerName;

  @JsonKey(name: 'chinese_name')
  final String chineseName;

  @JsonKey(name: 'traditional_name')
  final String traditionalName;

  final double price;

  @JsonKey(name: 'estimated_expired_date')
  final String estimatedExpiredDate;

  @JsonKey(name: 'estimated_take_profit_pct')
  final double estimatedTakeProfitPct;

  @JsonKey(name: 'estimated_take_profit_price')
  final double estimatedTakeProfitPrice;

  @JsonKey(name: 'estimated_stop_loss_pct')
  final double estimatedStopLossPct;

  @JsonKey(name: 'estimated_stop_loss_price')
  final double estimatedStopLossPrice;

  final String description;

  @JsonKey(name: 'market_cap')
  final String? marketCap;

  final List<ChartDataSet> performance;
  @JsonKey(name: 'prev_close_price')
  final double prevClosePrice;

  @JsonKey(name: 'prev_close_date')
  final String prevCloseDate;

  @JsonKey(name: 'estimated_start_date')
  final String estimatedStartDate;

  @JsonKey(name: 'prev_close_changes')
  final double prevCloseChanges;

  @JsonKey(name: 'prev_close_pct')
  final double prevClosePct;

  @JsonKey(name: 'avg_return')
  final dynamic avgReturn;

  @JsonKey(name: 'avg_loss')
  final dynamic avgLoss;

  @JsonKey(name: 'avg_period')
  final dynamic avgPeriod;

  final String sector;
  final String industry;
  final String ceo;
  final int employees;
  final String founded;
  final String headquarters;

  const BotDetailModel(
      this.bot,
      this.symbol,
      this.ticker,
      this.tickerName,
      this.chineseName,
      this.traditionalName,
      this.price,
      this.estimatedExpiredDate,
      this.estimatedTakeProfitPct,
      this.estimatedTakeProfitPrice,
      this.estimatedStopLossPct,
      this.estimatedStopLossPrice,
      this.description,
      this.marketCap,
      this.performance,
      this.prevClosePrice,
      this.prevCloseChanges,
      this.prevClosePct,
      this.estimatedStartDate,
      this.avgLoss,
      this.avgPeriod,
      this.avgReturn,
      this.sector,
      this.industry,
      this.prevCloseDate,
      this.ceo,
      this.employees,
      this.founded,
      this.headquarters);

  String get formattedStartDate =>
      formatDateAsString(DateTime.parse(estimatedStartDate));

  String format(DateTime sourceDateTime) {
    try {
      var outputFormat = DateFormat('dd/MM/yy');
      var outputDate = outputFormat.format(sourceDateTime);
      return outputDate;
    } catch (e) {
      return '';
    }
  }

  String get botPerformanceStartDate => format(performance[0].date!);

  String get botPerformanceEndDate =>
      format(performance[performance.length - 1].date!);

  factory BotDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BotDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotDetailModelToJson(this);

  String get avgReturnString {
    double avgReturnDouble = checkDouble(avgReturn);
    return (avgReturnDouble > 0) ? '+$avgReturnDouble%' : 'NA';
  }

  String get avgLossString {
    double avgLossDouble = checkDouble(avgLoss);
    return (avgLossDouble > 0) ? '+$avgLossDouble%' : 'NA';
  }

  String get avgPeriodString {
    double avgPeriodString = checkDouble(avgPeriod);
    return (avgPeriodString > 0) ? '$avgPeriodString' : 'NA';
  }

  @override
  List<Object?> get props => [
        bot,
        symbol,
        ticker,
        tickerName,
        chineseName,
        traditionalName,
        price,
        estimatedExpiredDate,
        estimatedTakeProfitPct,
        estimatedTakeProfitPrice,
        estimatedStopLossPct,
        estimatedStopLossPrice,
        description,
        marketCap,
        performance,
        prevClosePrice,
        prevCloseChanges,
        prevClosePct,
        estimatedStartDate,
        avgPeriod,
        avgLoss,
        avgReturn,
        sector,
        industry,
        prevCloseDate,
        ceo,
        employees,
        founded,
        headquarters,
      ];
}

@JsonSerializable()
class BotModel extends Equatable {
  @JsonKey(name: 'bot_id')
  final String botId;
  final String duration;
  @JsonKey(name: 'bot_name')
  final String botName;
  @JsonKey(name: 'bot_description')
  final BotDescriptionModel botDescription;

  const BotModel(this.botId, this.duration, this.botName, this.botDescription);

  factory BotModel.fromJson(Map<String, dynamic> json) =>
      _$BotModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotModelToJson(this);

  @override
  List<Object?> get props => [botId, duration, botName];
}

@JsonSerializable()
class BotDescriptionModel extends Equatable {
  final String detail;
  final String suited;
  final String works;

  const BotDescriptionModel(this.detail, this.suited, this.works);

  factory BotDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$BotDescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotDescriptionModelToJson(this);

  @override
  List<Object?> get props => [detail, suited, works];
}

@JsonSerializable()
class PerformanceModel extends Equatable {
  final List<ChartDataSet>? data;

  const PerformanceModel(this.data);

  factory PerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$PerformanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerformanceModelToJson(this);

  @override
  List<Object?> get props => [data];
}
