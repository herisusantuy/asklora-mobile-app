// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(availableAmount, minimumAmount) =>
      "你有  ${availableAmount} 可供使用，每單交易最小金額為 ${minimumAmount} 。";

  static String m1(botInformation) =>
      "你可以選擇依家結束，所有 ${botInformation} 嘅交易活動會立即停止。";

  static String m2(minimumAmount) => "每單交易最小金額為 ${minimumAmount} 。";

  static String m3(expiryTime) => "更新到期時間為 ${expiryTime}";

  static String m4(detail) => "載入你投資細節時出咗少少問題，Reload一次試下？";

  static String m5(currency) => "購買力 (${currency})";

  static String m6(currency) => "當前價格 ${currency}";

  static String m7(dateTime) => "到期日期 ${dateTime}";

  static String m8(dateTime) => "${dateTime}日後到期";

  static String m9(currency) => "Botstock 總價值 (${currency})";

  static String m10(currency) => "可提取金額 (${currency})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutAsklora": MessageLookupByLibrary.simpleMessage("關於 Asklora"),
        "askNameScreenPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Hi! 我係 Lora，你嘅 FinFit 投資教練，可以點叫你？"),
        "askNameScreenTextFieldHint":
            MessageLookupByLibrary.simpleMessage("你的名字"),
        "botTradeBottomSheetAmountMinimum": m0,
        "botTradeBottomSheetAmountTitle":
            MessageLookupByLibrary.simpleMessage("你想投資嘅金額係？"),
        "botTradeBottomSheetCancelBotStockConfirmationTitle":
            MessageLookupByLibrary.simpleMessage(
                "投資額及交易費用 (HKD1,500) 會自動轉至你嘅賬戶。"),
        "botTradeBottomSheetEndBotStockConfirmationSubTitle":
            MessageLookupByLibrary.simpleMessage(" Botstock 的總價值會自動轉至你的賬戶。"),
        "botTradeBottomSheetEndBotStockConfirmationTitle": m1,
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle":
            MessageLookupByLibrary.simpleMessage("存入資金正式交易"),
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle":
            MessageLookupByLibrary.simpleMessage("免費 Botstock 已成功加至\n你嘅投資組合！"),
        "botTradeBottomSheetInsufficientBalanceSubTitle": m2,
        "botTradeBottomSheetInsufficientBalanceTitle":
            MessageLookupByLibrary.simpleMessage("唔夠資金，幫你唔到，係時候入錢入戶口！"),
        "botTradeBottomSheetRolloverConfirmationButton":
            MessageLookupByLibrary.simpleMessage("延長"),
        "botTradeBottomSheetRolloverConfirmationSubTitle": m3,
        "botTradeBottomSheetRolloverConfirmationTitle":
            MessageLookupByLibrary.simpleMessage(
                "你想延長 Botstock 投資期\n以繼續交易？\n\n2 星期"),
        "botTradeBottomSheetRolloverDisclosureSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "延長期費用為每個Botstock 每月 HKD40， \n如你賬戶裡金額不足，收費金額將會在你有\n足夠的購買力的時候扣除。"),
        "botTradeBottomSheetRolloverDisclosureTitle":
            MessageLookupByLibrary.simpleMessage(
                "你將延長 Botstock 投資期，\n 並需繳付額外延長費用。"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "buttonCancelTrade": MessageLookupByLibrary.simpleMessage("取消交易"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("確定"),
        "buttonCreateAnAccount": MessageLookupByLibrary.simpleMessage("建立帳戶"),
        "buttonDeposit": MessageLookupByLibrary.simpleMessage("入金"),
        "buttonHaveAnAccount": MessageLookupByLibrary.simpleMessage("已有賬戶？"),
        "buttonLetsBegin": MessageLookupByLibrary.simpleMessage("立即開始"),
        "buttonNext": MessageLookupByLibrary.simpleMessage("下一步"),
        "buttonNotNow": MessageLookupByLibrary.simpleMessage("稍後再說"),
        "buttonReloadPage": MessageLookupByLibrary.simpleMessage("重新加載"),
        "carouselIntro1": MessageLookupByLibrary.simpleMessage("投資一樣\n要夠Fit"),
        "carouselIntro2":
            MessageLookupByLibrary.simpleMessage("FinFit教練，Lora 全程教路"),
        "carouselIntro3": MessageLookupByLibrary.simpleMessage("AI策略，\n自動交易"),
        "carouselIntro4": MessageLookupByLibrary.simpleMessage("個人化體驗，\n前所未見"),
        "contactUs": MessageLookupByLibrary.simpleMessage("聯絡我們"),
        "customerService": MessageLookupByLibrary.simpleMessage("客戶服務"),
        "email": MessageLookupByLibrary.simpleMessage("電郵"),
        "errorGettingInformationSubTitle": m4,
        "errorGettingInformationTitle":
            MessageLookupByLibrary.simpleMessage("咦，無法獲取資料"),
        "getHelp": MessageLookupByLibrary.simpleMessage("獲得幫助"),
        "greetingScreenSubTitle":
            MessageLookupByLibrary.simpleMessage("訓練開始，會問下基本問題先！記住，冇耐性，就輸梗！ "),
        "greetingScreenTitle":
            MessageLookupByLibrary.simpleMessage("Alright! 你準備開始 FinFit 未先？"),
        "officeHours":
            MessageLookupByLibrary.simpleMessage("09:00-18:00 (HKT)"),
        "officeHoursLabel": MessageLookupByLibrary.simpleMessage("辦公時間"),
        "portfolioBuyingPower": m5,
        "portfolioCurrentPrice": m6,
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("取消BOTSTOCK"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("取消Botstock"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("續期Botstock"),
        "portfolioDetailExpiredAt": m7,
        "portfolioDetailExpiredIn": m8,
        "portfolioDetailKeyInfoAvgLoss":
            MessageLookupByLibrary.simpleMessage("平均虧損"),
        "portfolioDetailKeyInfoAvgPeriod":
            MessageLookupByLibrary.simpleMessage("平均時期 (日數)"),
        "portfolioDetailKeyInfoAvgReturn":
            MessageLookupByLibrary.simpleMessage("平均回報"),
        "portfolioDetailKeyInfoBotStockNumberOfRollover":
            MessageLookupByLibrary.simpleMessage("Number of Rollovers"),
        "portfolioDetailKeyInfoBotStockStatus":
            MessageLookupByLibrary.simpleMessage("Botstock 狀態"),
        "portfolioDetailKeyInfoDaysTillExpiry":
            MessageLookupByLibrary.simpleMessage("續期時間"),
        "portfolioDetailKeyInfoEndTime":
            MessageLookupByLibrary.simpleMessage("結束時間"),
        "portfolioDetailKeyInfoEstimatedMaxLoss":
            MessageLookupByLibrary.simpleMessage("預計最大損失%"),
        "portfolioDetailKeyInfoEstimatedMaxProfit":
            MessageLookupByLibrary.simpleMessage("預計最大收益% "),
        "portfolioDetailKeyInfoEstimatedStopLoss":
            MessageLookupByLibrary.simpleMessage("預計止損 %"),
        "portfolioDetailKeyInfoEstimatedTakeProfit":
            MessageLookupByLibrary.simpleMessage("預計止賺%"),
        "portfolioDetailKeyInfoInvestmentPeriod":
            MessageLookupByLibrary.simpleMessage("投資期"),
        "portfolioDetailKeyInfoStartTime":
            MessageLookupByLibrary.simpleMessage("開始時間"),
        "portfolioDetailKeyInfoTitle":
            MessageLookupByLibrary.simpleMessage("主要資訊"),
        "portfolioDetailPerformanceBotAssetsInStock":
            MessageLookupByLibrary.simpleMessage("股票/現金比例"),
        "portfolioDetailPerformanceBotStockValues":
            MessageLookupByLibrary.simpleMessage("Botstock 價值 (HKD)"),
        "portfolioDetailPerformanceCash":
            MessageLookupByLibrary.simpleMessage("現金 (HKD)"),
        "portfolioDetailPerformanceInvestmentAmount":
            MessageLookupByLibrary.simpleMessage("投資金額 (HKD)"),
        "portfolioDetailPerformanceNumberOfShares":
            MessageLookupByLibrary.simpleMessage("持股數量"),
        "portfolioDetailPerformanceStockValues":
            MessageLookupByLibrary.simpleMessage("股票價值 (HKD)"),
        "portfolioDetailPerformanceTitle":
            MessageLookupByLibrary.simpleMessage("表現"),
        "portfolioDetailPerformanceTotalPL":
            MessageLookupByLibrary.simpleMessage("總盈虧"),
        "portfolioTotalBotStock": m9,
        "portfolioTotalPL": MessageLookupByLibrary.simpleMessage("總盈虧"),
        "portfolioTotalValue": MessageLookupByLibrary.simpleMessage("總價值 "),
        "portfolioWithdrawableAmount": m10,
        "portfolioYourBotStock":
            MessageLookupByLibrary.simpleMessage("你的Botstocks"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("私隱政策"),
        "termsAndConditions": MessageLookupByLibrary.simpleMessage("條款與約束"),
        "tooltipBotDetailsEstMaxLoss":
            MessageLookupByLibrary.simpleMessage("Bot將出售以限制損失的最低股票價位。"),
        "tooltipBotDetailsEstMaxProfit":
            MessageLookupByLibrary.simpleMessage("Bot將出售以獲取最大利潤的股票價位。"),
        "tooltipBotDetailsEstStopLoss": MessageLookupByLibrary.simpleMessage(
            "Plank Bot將出售以限制過分損失的預設最低股票價位"),
        "tooltipBotDetailsEstTakeProfit":
            MessageLookupByLibrary.simpleMessage("Plank Bot將出售以獲取利潤的預設最高股票價位"),
        "tooltipBotDetailsInvestmentPeriod":
            MessageLookupByLibrary.simpleMessage(
                "你定下的投資時間，Botstock將會於此期間內自動買賣股票。"),
        "tooltipBotDetailsStartDate":
            MessageLookupByLibrary.simpleMessage("Lora開始Botstocks交易"),
        "website": MessageLookupByLibrary.simpleMessage("網站")
      };
}
