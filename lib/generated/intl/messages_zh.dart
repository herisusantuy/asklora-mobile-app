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

  static String m4(currency) => "購買力 (${currency})";

  static String m5(currency) => "當前價格 ${currency}";

  static String m6(bot, startDate, endDate, duration) =>
      "${bot} 於過去 ${duration} 星期之表現  (${startDate} - ${endDate})";

  static String m7(dateTime) => "到期日期 ${dateTime}";

  static String m8(dateTime) => "${dateTime}日後到期";

  static String m9(currency) => "Botstock 總價值 (${currency})";

  static String m10(currency) => "可提取金額 (${currency})";

  static String m11(dateTime) => "銀行賬戶正在審批當中，並會於${dateTime} 完成。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("關於"),
        "aboutAsklora": MessageLookupByLibrary.simpleMessage("關於 Asklora"),
        "accountInformation": MessageLookupByLibrary.simpleMessage("帳戶資訊"),
        "accountSettings": MessageLookupByLibrary.simpleMessage("帳戶設定"),
        "activities": MessageLookupByLibrary.simpleMessage("交易記錄"),
        "allSettings": MessageLookupByLibrary.simpleMessage("設定"),
        "askNameScreenPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Hi! 我係 Lora，你嘅 FinFit 投資教練，可以點叫你？"),
        "askNameScreenTextFieldHint":
            MessageLookupByLibrary.simpleMessage("你的名字"),
        "bestSuitedFor": MessageLookupByLibrary.simpleMessage("最適合"),
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
        "buttonSignOut": MessageLookupByLibrary.simpleMessage("登出"),
        "carouselIntro1": MessageLookupByLibrary.simpleMessage("投資一樣\n要夠Fit"),
        "carouselIntro2":
            MessageLookupByLibrary.simpleMessage("FinFit教練，Lora 全程教路"),
        "carouselIntro3": MessageLookupByLibrary.simpleMessage("AI策略，\n自動交易"),
        "carouselIntro4": MessageLookupByLibrary.simpleMessage("個人化體驗，\n前所未見"),
        "changeBankAccount": MessageLookupByLibrary.simpleMessage("更改銀行戶口"),
        "changePassword": MessageLookupByLibrary.simpleMessage("更改密碼"),
        "confirmNewPassword": MessageLookupByLibrary.simpleMessage("確認新密碼"),
        "contactUs": MessageLookupByLibrary.simpleMessage("聯絡我們"),
        "corePlan": MessageLookupByLibrary.simpleMessage("核心計劃"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("Current Price"),
        "customerService": MessageLookupByLibrary.simpleMessage("客戶服務"),
        "dateJoined": MessageLookupByLibrary.simpleMessage("加入日期"),
        "doAnyOfTheFollowingApply":
            MessageLookupByLibrary.simpleMessage("以下描述適用於你或你的直系親屬？"),
        "email": MessageLookupByLibrary.simpleMessage("電郵"),
        "employees": MessageLookupByLibrary.simpleMessage("員工人數"),
        "endedAmount": MessageLookupByLibrary.simpleMessage("到期價值"),
        "errorGettingInformationInvestmentDetailSubTitle":
            MessageLookupByLibrary.simpleMessage("載入你投資細節時出咗少少問題，Reload一次試下？"),
        "errorGettingInformationPortfolioSubTitle":
            MessageLookupByLibrary.simpleMessage("載入你投資組合時出咗少少問題，Reload一次試下？"),
        "errorGettingInformationTitle":
            MessageLookupByLibrary.simpleMessage("咦，無法獲取資料"),
        "estMaxLossPercent": MessageLookupByLibrary.simpleMessage("預計最大損失%"),
        "estMaxProfitPercent": MessageLookupByLibrary.simpleMessage("預計最大收益%"),
        "estStopLossPercent": MessageLookupByLibrary.simpleMessage("預計止損 %"),
        "estTakeProfitPercent": MessageLookupByLibrary.simpleMessage("預計止賺%"),
        "estimatedEndDate": MessageLookupByLibrary.simpleMessage("預計結束日期"),
        "filledPrice": MessageLookupByLibrary.simpleMessage("成交價格"),
        "founded": MessageLookupByLibrary.simpleMessage("成立年份"),
        "free": MessageLookupByLibrary.simpleMessage("免費"),
        "freeTrial": MessageLookupByLibrary.simpleMessage("免費試用期"),
        "fullName": MessageLookupByLibrary.simpleMessage("姓名"),
        "getHelp": MessageLookupByLibrary.simpleMessage("獲得幫助"),
        "greetingScreenSubTitle":
            MessageLookupByLibrary.simpleMessage("訓練開始，會問下基本問題先！記住，冇耐性，就輸梗！ "),
        "greetingScreenTitle":
            MessageLookupByLibrary.simpleMessage("Alright! 你準備開始 FinFit 未先？"),
        "headquarters": MessageLookupByLibrary.simpleMessage("總部地點"),
        "howItWorks": MessageLookupByLibrary.simpleMessage("如何運作"),
        "iAmADirector": MessageLookupByLibrary.simpleMessage(
            "我是香港證券及期貨事務監察委員會註冊持牌機構的董事、員工、或註冊持牌人士。(除了Lora Advisors Limited）"),
        "iAmAFamily": MessageLookupByLibrary.simpleMessage("我是高級政治人物的家庭成員或親屬。"),
        "iAmASeniorExecutive": MessageLookupByLibrary.simpleMessage(
            "我是上市公司的高級行政人員或持有 10% 或以上的股份。"),
        "iAmASeniorPolitical":
            MessageLookupByLibrary.simpleMessage("我是高級政治人物。"),
        "inApp": MessageLookupByLibrary.simpleMessage("In-app通知"),
        "industry": MessageLookupByLibrary.simpleMessage("行業"),
        "investmentAmount": MessageLookupByLibrary.simpleMessage("投資金額"),
        "investmentPeriod": MessageLookupByLibrary.simpleMessage("投資期"),
        "investmentPreferences": MessageLookupByLibrary.simpleMessage("投資偏好"),
        "language": MessageLookupByLibrary.simpleMessage("語言"),
        "marketCap": MessageLookupByLibrary.simpleMessage("市值"),
        "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
        "no": MessageLookupByLibrary.simpleMessage(" 否"),
        "noteOnPaymentDetails": MessageLookupByLibrary.simpleMessage(
            "注意\n我們會與你所登記銀行協作藉以核實你的銀行資料（賬戶姓名、銀行編號、銀行賬戶 號碼）。我們亦可能會因核實交易，向你要求更多附加資料。"),
        "notificationSetting": MessageLookupByLibrary.simpleMessage("通知設定"),
        "notificationSettings": MessageLookupByLibrary.simpleMessage("通知設定"),
        "officeHours":
            MessageLookupByLibrary.simpleMessage("09:00-18:00 (HKT)"),
        "officeHoursLabel": MessageLookupByLibrary.simpleMessage("辦公時間"),
        "orderExpired": MessageLookupByLibrary.simpleMessage("訂單已過期"),
        "orderRollover": MessageLookupByLibrary.simpleMessage("訂單已續期"),
        "orderStarted": MessageLookupByLibrary.simpleMessage("訂單已開始"),
        "password": MessageLookupByLibrary.simpleMessage("密碼"),
        "paymentDetails": MessageLookupByLibrary.simpleMessage("銀行賬戶詳情"),
        "phone": MessageLookupByLibrary.simpleMessage("電話"),
        "portfolioBuyingPower": m4,
        "portfolioBuyingPowerToolTip": MessageLookupByLibrary.simpleMessage(
            "購買力代表了你可以用來購買Botstock的現金額。你的可提取金額和購買力會出現不一樣的情況。例如，開始Botstock後，你的購買力會相對減少，而Botstock總價值會相對提高。或當你的Botstock已到期或被終止，其價值將會增加至購買力，而在「T+2」日，T為交易當日， 該價值也會同時顯示在可提取金額。 "),
        "portfolioCurrentPrice": m5,
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("取消BOTSTOCK"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("取消Botstock"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("續期Botstock"),
        "portfolioDetailChartCaption": m6,
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
        "prevClose": MessageLookupByLibrary.simpleMessage("上日收市"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("私隱政策"),
        "pushNotification": MessageLookupByLibrary.simpleMessage("推送通知"),
        "saveForLater": MessageLookupByLibrary.simpleMessage("儲存並離開"),
        "sectors": MessageLookupByLibrary.simpleMessage("領域"),
        "setUpFinancialProfile": MessageLookupByLibrary.simpleMessage("設定財務概況"),
        "shares": MessageLookupByLibrary.simpleMessage("數量"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(" 真係要登出？"),
        "startDate": MessageLookupByLibrary.simpleMessage("最佳開始日期"),
        "subscription": MessageLookupByLibrary.simpleMessage("訂購計劃"),
        "summary": MessageLookupByLibrary.simpleMessage("摘要"),
        "terminateAccount": MessageLookupByLibrary.simpleMessage("終止賬戶"),
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
        "totalPnlIs": MessageLookupByLibrary.simpleMessage("總盈虧"),
        "tradeFee": MessageLookupByLibrary.simpleMessage("交易費用"),
        "transactionHistory": MessageLookupByLibrary.simpleMessage("交易歷史"),
        "transactionHistoryTabAll": MessageLookupByLibrary.simpleMessage("全部"),
        "transactionHistoryTabOrders":
            MessageLookupByLibrary.simpleMessage("訂單"),
        "transactionHistoryTabTransfer":
            MessageLookupByLibrary.simpleMessage("提存 "),
        "transactionHistoryTitle": MessageLookupByLibrary.simpleMessage("交易歷史"),
        "transactionHistoryToday": MessageLookupByLibrary.simpleMessage("今日"),
        "userId": MessageLookupByLibrary.simpleMessage("用戶 ID"),
        "website": MessageLookupByLibrary.simpleMessage("網站"),
        "yes": MessageLookupByLibrary.simpleMessage("是"),
        "yourBankAccount": MessageLookupByLibrary.simpleMessage("銀行賬戶"),
        "yourBankAccountIsUnderReview": m11,
        "yourPaymentInformationIsUnderReview": MessageLookupByLibrary.simpleMessage(
            "Your payment information is under review. Your bank account details will be shown here once your account is approved.")
      };
}
