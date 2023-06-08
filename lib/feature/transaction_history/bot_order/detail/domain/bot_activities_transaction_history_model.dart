import '../../../../../../core/utils/date_utils.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../chart/domain/chart_models.dart';

class BotActivitiesTransactionHistoryModel extends ChartDataSet {
  final String pk;
  final double pnlAmt;
  final String side;
  final double invested;

  const BotActivitiesTransactionHistoryModel(
    super.date,
    super.price,
    super.hedgeShare,
    super.currentPnlRet,
    this.pk,
    this.pnlAmt,
    this.side,
    this.invested, {
    super.index,
  });

  BotActivitiesTransactionHistoryModel copyWith({int? index}) =>
      BotActivitiesTransactionHistoryModel(
        date,
        price,
        hedgeShare,
        currentPnlRet,
        pk,
        pnlAmt,
        side,
        invested,
        index: index ?? this.index,
      );

  BotActivitiesTransactionHistoryModel.fromJson(Map<String, dynamic> json)
      : pk = json['pk'],
        pnlAmt = json['pnl_amt'],
        side = json['side'],
        invested = json['invested'],
        super(
            DateTime.parse(json['created']),
            checkDouble(json['filled_avg_price']),
            json['side'] == 'buy'
                ? checkDouble(json['filled_qty'])
                : -checkDouble(json['filled_qty']),
            checkDouble(json['pnl_ret']),
            index: json['i'] ?? 0);

  String get investedString {
    double investmentAmountDouble = checkDouble(invested);
    return 'USD ${investmentAmountDouble.convertToCurrencyDecimal()}';
  }

  String get dateFormattedString =>
      formatDateTimeAsString(date, dateFormat: 'HH:mm:ss');

  String get filledAvgPriceString {
    double filledAvgPriceDouble = checkDouble(price);
    return (filledAvgPriceDouble > 0)
        ? 'USD ${filledAvgPriceDouble.toInt()}'
        : 'NA';
  }

  String get filledQtyString {
    double filledAvgQtyDouble = checkDouble(hedgeShare);
    return (filledAvgQtyDouble > 0)
        ? 'USD ${filledAvgQtyDouble.toInt()}'
        : 'NA';
  }
}
