import '../../../../../../core/utils/date_utils.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../chart/domain/chart_models.dart';

class BotActivitiesTransactionHistoryModel extends ChartDataSet {
  String? pk;
  double? pnlAmt;
  String? side;
  double? invested;

  BotActivitiesTransactionHistoryModel(
      {super.index,
      super.date,
      super.price,
      super.hedgeShare,
      super.currentPnlRet,
      this.pk,
      this.pnlAmt,
      this.side,
      this.invested});

  BotActivitiesTransactionHistoryModel copyWith({int? index}) =>
      BotActivitiesTransactionHistoryModel(
          index: index ?? this.index,
          date: date,
          price: price,
          hedgeShare: hedgeShare,
          currentPnlRet: currentPnlRet,
          pk: pk,
          pnlAmt: pnlAmt,
          side: side,
          invested: invested);

  BotActivitiesTransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    pnlAmt = json['pnl_amt'];
    side = json['side'];
    invested = json['invested'];
    date = DateTime.parse(formatDateTimeAsString(json['created']));
    index = json['i'] ?? 0;
    price = checkDouble(json['filled_avg_price']);
    hedgeShare = side == 'sell'
        ? -checkDouble(json['filled_qty'])
        : checkDouble(json['filled_qty']);
    currentPnlRet = checkDouble(json['pnl_ret']);
  }

  String get sideString => side ?? '';

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

// @JsonSerializable()
// class BotActivitiesTransactionHistoryModel extends Equatable {
//   @JsonKey(name: 'pk')
//   final String pk;
//   final String created;
//   final String side;
//   @JsonKey(name: 'filled_qty')
//   final double filledQty;
//   @JsonKey(name: 'filled_avg_price')
//   final double filledAvgPrice;
//   @JsonKey(name: 'invested')
//   final double invested;
//   @JsonKey(name: 'pnl_ret')
//   final double pnlRet;
//   @JsonKey(name: 'pnl_amt')
//   final double pnlAmt;
//
//   String get investedString {
//     double investmentAmountDouble = checkDouble(invested);
//     return 'USD ${investmentAmountDouble.convertToCurrencyDecimal()}';
//   }
//
//   String get filledAvgPriceString {
//     double filledAvgPriceDouble = checkDouble(filledAvgPrice);
//     return (filledAvgPriceDouble > 0)
//         ? 'USD ${filledAvgPriceDouble.toInt()}'
//         : 'NA';
//   }
//
//   String get filledQtyString {
//     double filledAvgQtyDouble = checkDouble(filledQty);
//     return (filledAvgQtyDouble > 0)
//         ? 'USD ${filledAvgQtyDouble.toInt()}'
//         : 'NA';
//   }
//
//   String get createdFormattedString =>
//       formatDateTimeAsString(created, dateFormat: 'HH:mm:ss');
//
//   const BotActivitiesTransactionHistoryModel(
//       this.pk,
//       this.created,
//       this.side,
//       this.filledQty,
//       this.filledAvgPrice,
//       this.invested,
//       this.pnlRet,
//       this.pnlAmt);
//
//   factory BotActivitiesTransactionHistoryModel.fromJson(
//           Map<String, dynamic> json) =>
//       _$BotActivitiesTransactionHistoryModelFromJson(json);
//
//   Map<String, dynamic> toJson() =>
//       _$BotActivitiesTransactionHistoryModelToJson(this);
//
//   @override
//   List<Object?> get props {
//     return [pk, created, side, filledQty, filledAvgPrice, invested];
//   }
// }
