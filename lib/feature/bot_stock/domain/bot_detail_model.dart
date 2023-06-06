import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/date_utils.dart';
import '../../../core/utils/extensions.dart';
import '../../chart/domain/bot_recommendation_chart_model.dart';

part 'bot_detail_model.g.dart';

@JsonSerializable()
class BotDetailModel extends Equatable {
  @JsonKey(name: 'bot_id')
  final String botId;
  @JsonKey(name: 'bot_info')
  final BotInfo botInfo;
  @JsonKey(name: 'stock_info')
  final StockInfo stockInfo;
  final double price;
  @JsonKey(name: 'prev_close_amt')
  final double prevCloseAmt;
  @JsonKey(name: 'prev_close_price')
  final double prevClosePrice;
  @JsonKey(name: 'est_stop_loss_price')
  final double estStopLossPrice;
  @JsonKey(name: 'est_take_profit_price')
  final double estTakeProfitPrice;
  @JsonKey(name: 'prev_close_pct')
  final double prevClosePct;
  @JsonKey(name: 'est_stop_loss_pct')
  final double estStopLossPct;
  @JsonKey(name: 'est_take_profit_pct')
  final double estTakeProfitPct;
  @JsonKey(name: 'prev_close_date')
  final String prevCloseDate;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'est_end_date')
  final String estEndDate;
  final List<BotRecommendationChartModel> performance;
  @JsonKey(name: 'bot_duration')
  final String botDuration;
  @JsonKey(name: 'market_cap')
  final String marketCap;

  double get estStopLossPriceFormatted =>
      double.parse(checkDouble(estStopLossPrice).convertToCurrencyDecimal(decimalDigits: 2));

  double get estTakeProfitPriceFormatted =>
      double.parse(checkDouble(estTakeProfitPrice).convertToCurrencyDecimal(decimalDigits: 2));

  const BotDetailModel(
    this.botId,
    this.botInfo,
    this.stockInfo,
    this.price,
    this.prevCloseAmt,
    this.prevClosePrice,
    this.estStopLossPrice,
    this.estTakeProfitPrice,
    this.prevClosePct,
    this.estStopLossPct,
    this.estTakeProfitPct,
    this.prevCloseDate,
    this.startDate,
    this.estEndDate,
    this.performance,
    this.botDuration,
    this.marketCap,
  );

  String get formattedStartDate =>
      formatDateTimeAsString(DateTime.parse(startDate));

  String format(DateTime sourceDateTime) {
    try {
      var outputFormat = DateFormat('dd/MM/yy');
      var outputDate = outputFormat.format(sourceDateTime);
      return outputDate;
    } catch (e) {
      return '';
    }
  }

  String get botPerformanceStartDate => format(performance[0].date);

  String get botPerformanceEndDate =>
      format(performance[performance.length - 1].date);

  factory BotDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BotDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BotDetailModelToJson(this);

  @override
  List<Object?> get props => [
        botId,
        botInfo,
        stockInfo,
        price,
        prevCloseAmt,
        prevClosePrice,
        estStopLossPrice,
        estTakeProfitPrice,
        prevClosePct,
        estStopLossPct,
        estTakeProfitPct,
        prevCloseDate,
        startDate,
        estEndDate,
        performance,
        botDuration,
        marketCap,
      ];
}

@JsonSerializable()
class BotInfo extends Equatable {
  @JsonKey(name: 'bot_type')
  final String botType;
  @JsonKey(name: 'bot_name')
  final String botName;
  @JsonKey(name: 'bot_description')
  final BotDescriptionModel botDescription;

  const BotInfo(this.botType, this.botName, this.botDescription);

  factory BotInfo.fromJson(Map<String, dynamic> json) =>
      _$BotInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BotInfoToJson(this);

  @override
  List<Object?> get props => [botDescription, botType, botName];
}

@JsonSerializable()
class StockInfo extends Equatable {
  final String symbol;
  final String ticker;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'chinese_name')
  final String chineseName;
  @JsonKey(name: 'traditional_name')
  final String traditionalName;
  final String description;
  final String sector;
  final String industry;
  final String ceo;
  final int employees;
  final String headquarter;
  final String founded;

  const StockInfo(
      this.symbol,
      this.ticker,
      this.tickerName,
      this.chineseName,
      this.traditionalName,
      this.description,
      this.sector,
      this.industry,
      this.ceo,
      this.employees,
      this.headquarter,
      this.founded);

  factory StockInfo.fromJson(Map<String, dynamic> json) =>
      _$StockInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StockInfoToJson(this);

  @override
  List<Object?> get props => [
        symbol,
        ticker,
        tickerName,
        chineseName,
        traditionalName,
        description,
        sector,
        industry,
        ceo,
        employees,
        headquarter,
        founded
      ];
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
