class ChartDataSet {
  int? index;
  DateTime? date;
  double? price;
  int? hedgeShare;
  double? currentPnlRet;

  ChartDataSet(
      {this.index, this.date, this.price, this.hedgeShare, this.currentPnlRet});

  ChartDataSet.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    index = json['i'];
    price = json['price'];
    hedgeShare = json['hedge_share'];
    currentPnlRet = json['current_pnl_ret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['i'] = index;
    data['date'] = date;
    data['price'] = price;
    data['hedge_share'] = hedgeShare;
    data['current_pnl_ret'] = currentPnlRet;
    return data;
  }
}

class ChartDataStudioSet {
  int? index;
  DateTime? date;
  double? price;
  double? hedgeShare;
  String? hedgeStatus;
  double? targetMaxLossLevel;
  double? targetProfitLevel;

  ChartDataStudioSet(
      {this.index,
      this.date,
      this.price,
      this.hedgeShare,
      this.targetMaxLossLevel,
      this.targetProfitLevel});

  ChartDataStudioSet.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['hedge_date']);
    price = json['hedge_price'];
    hedgeShare = json['hedge_share'];
    hedgeStatus = json['hedge_status'];
    targetMaxLossLevel = json['target_max_loss_level'];
    targetProfitLevel = json['target_profit_level'];
  }
}

class UiData {
  String? text;
  List<OptionModel>? options;
  DateTime? date;
  String? buttonLabel;

  UiData(
      {required this.text, required this.date, this.options, this.buttonLabel});

  UiData.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    text = json['text'];
    options = List<OptionModel>.from(
        json['options'].map((model) => OptionModel.fromJson(model)));
    buttonLabel = json['button_label'];
  }
}

class OptionModel {
  int? index;
  String? text;
  String? infoText;

  OptionModel(this.index, this.text, this.infoText);

  OptionModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    text = json['text'];
    infoText = json['info_text'];
  }
}
