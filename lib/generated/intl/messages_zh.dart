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

  static String m4(emailAddress) => "已發送電子郵件至\n ${emailAddress}\n\n請用手機點擊開通連結！";

  static String m5(minute) => " ~${minute} 分鐘";

  static String m6(currency) => "購買力 (${currency})";

  static String m7(currency) => "當前價格 ${currency}";

  static String m8(bot, startDate, endDate, duration) =>
      "${bot} 於過去 ${duration} 星期之表現  (${startDate} - ${endDate})";

  static String m9(dateTime) => "到期日期 ${dateTime}";

  static String m10(dateTime) => "${dateTime}日後到期";

  static String m11(currency) => "Botstock 總價值 (${currency})";

  static String m12(currency) => "可提取金額 (${currency})";

  static String m13(dateTime) => "銀行賬戶正在審批當中，並會於${dateTime} 完成。";

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
        "botTradeBottomSheetAccountNotYetApprovedSubTitle":
            MessageLookupByLibrary.simpleMessage("預計批核時間為 2 個工作天。"),
        "botTradeBottomSheetAccountNotYetApprovedTitle":
            MessageLookupByLibrary.simpleMessage("賬戶成功批核後就可以開始交易。"),
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
        "buttonAlreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("已有帳戶"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "buttonCancelTrade": MessageLookupByLibrary.simpleMessage("取消交易"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("確定"),
        "buttonContinue": MessageLookupByLibrary.simpleMessage("繼續"),
        "buttonDeposit": MessageLookupByLibrary.simpleMessage("入金"),
        "buttonDone": MessageLookupByLibrary.simpleMessage("完成"),
        "buttonHaveAnAccount": MessageLookupByLibrary.simpleMessage("已有賬戶？"),
        "buttonLetsBegin": MessageLookupByLibrary.simpleMessage("立即開始"),
        "buttonMaybeLater": MessageLookupByLibrary.simpleMessage("稍後再說"),
        "buttonNext": MessageLookupByLibrary.simpleMessage("下一步"),
        "buttonNotNow": MessageLookupByLibrary.simpleMessage("稍後再說"),
        "buttonReloadPage": MessageLookupByLibrary.simpleMessage("重新加載"),
        "buttonResendActivationLink":
            MessageLookupByLibrary.simpleMessage("再發送開通連結"),
        "buttonSignOut": MessageLookupByLibrary.simpleMessage("登出"),
        "buttonSignUp": MessageLookupByLibrary.simpleMessage("註冊"),
        "buttonSignUpAgain": MessageLookupByLibrary.simpleMessage("再次註冊"),
        "buttonViewTransactionHistory":
            MessageLookupByLibrary.simpleMessage("查看交易歷史"),
        "buttonWithdraw": MessageLookupByLibrary.simpleMessage("提取"),
        "carouselIntro1": MessageLookupByLibrary.simpleMessage("投資一樣\n要夠Fit"),
        "carouselIntro2":
            MessageLookupByLibrary.simpleMessage("FinFit教練，Lora 全程教路"),
        "carouselIntro3": MessageLookupByLibrary.simpleMessage("AI策略，\n自動交易"),
        "carouselIntro4": MessageLookupByLibrary.simpleMessage("個人化體驗，\n前所未見"),
        "changeBankAccount": MessageLookupByLibrary.simpleMessage("更改銀行戶口"),
        "changePassword": MessageLookupByLibrary.simpleMessage("更改密碼"),
        "confirmNewPassword": MessageLookupByLibrary.simpleMessage("確認新密碼"),
        "contactUs": MessageLookupByLibrary.simpleMessage("聯絡我們"),
        "continueAccountOpening":
            MessageLookupByLibrary.simpleMessage("開立投資賬戶"),
        "corePlan": MessageLookupByLibrary.simpleMessage("核心計劃"),
        "createAnAccount": MessageLookupByLibrary.simpleMessage("開立賬戶"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("當前價格"),
        "customerService": MessageLookupByLibrary.simpleMessage("客戶服務"),
        "dateJoined": MessageLookupByLibrary.simpleMessage("加入日期"),
        "defineInvestmentStyle": MessageLookupByLibrary.simpleMessage("界定投資風格"),
        "deposit": MessageLookupByLibrary.simpleMessage("存入資金"),
        "depositRequestSubmittedSubTitleFirstTime":
            MessageLookupByLibrary.simpleMessage(
                "我們會於 1 至 2 個工作天內檢視你的開戶申請及首次入金。當賬戶批核後會以電郵或應用程式通知。"),
        "depositRequestSubmittedSubTitleReturn":
            MessageLookupByLibrary.simpleMessage(
                "你已提交入金請求，當收到入金後，\n我們會盡快以電郵或應用程式通知。"),
        "depositRequestSubmittedTitle":
            MessageLookupByLibrary.simpleMessage("已收到入金申請"),
        "doAnyOfTheFollowingApply":
            MessageLookupByLibrary.simpleMessage("以下描述適用於你或你的直系親屬？"),
        "email": MessageLookupByLibrary.simpleMessage("電郵"),
        "emailActivationFailedTitle":
            MessageLookupByLibrary.simpleMessage("Sorry！你嘅請求已經逾時。\n請重新開通帳戶。"),
        "emailActivationSuccessTitle": m4,
        "emailAddress": MessageLookupByLibrary.simpleMessage("電郵地址"),
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
        "getTheFirstBotstockForFree":
            MessageLookupByLibrary.simpleMessage("獲取首個免費 Botstock "),
        "gotIt": MessageLookupByLibrary.simpleMessage("知道了"),
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
        "introduceBotPlank":
            MessageLookupByLibrary.simpleMessage("簡介 Bot - Plank"),
        "introduceBotPullup":
            MessageLookupByLibrary.simpleMessage("簡介 Bot - Pullup"),
        "introduceBotSquat":
            MessageLookupByLibrary.simpleMessage("簡介 Bot - Squat"),
        "investmentAmount": MessageLookupByLibrary.simpleMessage("投資金額"),
        "investmentPeriod": MessageLookupByLibrary.simpleMessage("投資期"),
        "investmentPreferences": MessageLookupByLibrary.simpleMessage("投資偏好"),
        "investmentStyleWelcomeTitle": MessageLookupByLibrary.simpleMessage(
            "想要 FinFit， 有咩投資秘技？\n界定投資風格先！\n"),
        "language": MessageLookupByLibrary.simpleMessage("語言"),
        "learnBotstockManagement":
            MessageLookupByLibrary.simpleMessage("學䲾 Botstock 管理"),
        "manageYourBotstock":
            MessageLookupByLibrary.simpleMessage("管理 Botstock"),
        "marketCap": MessageLookupByLibrary.simpleMessage("市值"),
        "masterAiTrading":
            MessageLookupByLibrary.simpleMessage("Master AI Trading"),
        "milestones": MessageLookupByLibrary.simpleMessage("目標"),
        "min": m5,
        "needHelp": MessageLookupByLibrary.simpleMessage("需要幫助？"),
        "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
        "no": MessageLookupByLibrary.simpleMessage(" 否"),
        "noteOnPaymentDetails": MessageLookupByLibrary.simpleMessage(
            "注意\n我們會與你所登記銀行協作藉以核實你的銀行資料（賬戶姓名、銀行編號、銀行賬戶 號碼）。我們亦可能會因核實交易，向你要求更多附加資料。"),
        "notificationSetting": MessageLookupByLibrary.simpleMessage("通知設定"),
        "notificationSettings": MessageLookupByLibrary.simpleMessage("通知設定"),
        "officeHours":
            MessageLookupByLibrary.simpleMessage("09:00-18:00 (HKT)"),
        "officeHoursLabel": MessageLookupByLibrary.simpleMessage("辦公時間"),
        "openInvestmentAccount": MessageLookupByLibrary.simpleMessage("開立投資賬戶"),
        "orderExpired": MessageLookupByLibrary.simpleMessage("訂單已過期"),
        "orderRollover": MessageLookupByLibrary.simpleMessage("訂單已續期"),
        "orderStarted": MessageLookupByLibrary.simpleMessage("訂單已開始"),
        "password": MessageLookupByLibrary.simpleMessage("密碼"),
        "payDepositToStartRealTrade":
            MessageLookupByLibrary.simpleMessage("入金以開始正式交易"),
        "paymentDetails": MessageLookupByLibrary.simpleMessage("銀行賬戶詳情"),
        "performance": MessageLookupByLibrary.simpleMessage("表現"),
        "personalisation": MessageLookupByLibrary.simpleMessage("個人化"),
        "phone": MessageLookupByLibrary.simpleMessage("電話"),
        "portfolioBuyingPower": m6,
        "portfolioBuyingPowerToolTip": MessageLookupByLibrary.simpleMessage(
            "購買力代表了你可以用來購買Botstock的現金額。你的可提取金額和購買力會出現不一樣的情況。例如，開始Botstock後，你的購買力會相對減少，而Botstock總價值會相對提高。或當你的Botstock已到期或被終止，其價值將會增加至購買力，而在「T+2」日，T為交易當日， 該價值也會同時顯示在可提取金額。 "),
        "portfolioCurrentPrice": m7,
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("取消BOTSTOCK"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("取消Botstock"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("續期Botstock"),
        "portfolioDetailChartCaption": m8,
        "portfolioDetailExpiredAt": m9,
        "portfolioDetailExpiredIn": m10,
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
        "portfolioPopUpContinueAccountOpeningSubTitle":
            MessageLookupByLibrary.simpleMessage("喺可以開始正式交易之前，你需要完成開戶。"),
        "portfolioPopUpContinueAccountOpeningTitle":
            MessageLookupByLibrary.simpleMessage("尚未完成開戶"),
        "portfolioPopUpCreateAnAccountSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "開始交易後，你可以喺度管理你所有投資。快啲建立賬戶進行交易啦！"),
        "portfolioPopUpCreateAnAccountTitle":
            MessageLookupByLibrary.simpleMessage("建立賬戶，開始交易"),
        "portfolioPopUpDefineInvestmentSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "你仲未界定你嘅投資風格。快啲去睇下咩\nBotstocks 最適合你喇！"),
        "portfolioPopUpDefineInvestmentTitle":
            MessageLookupByLibrary.simpleMessage("界定投資風格，立即交易！"),
        "portfolioPopUpFundAccountSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "你好似仲未入錢喎，入咗 HKD 10,000 就可以正式完成開戶手續！"),
        "portfolioPopUpFundAccountTitle":
            MessageLookupByLibrary.simpleMessage("尚未入金"),
        "portfolioPopUpNoTradingHasStartedTitle":
            MessageLookupByLibrary.simpleMessage("尚未開始任何交易!"),
        "portfolioPopUpNoTradingHasStartedtSubTitle":
            MessageLookupByLibrary.simpleMessage(" 開始交易後你就可以一次過管理所有投資。"),
        "portfolioTotalBotStock": m11,
        "portfolioTotalPL": MessageLookupByLibrary.simpleMessage("總盈虧"),
        "portfolioTotalValue": MessageLookupByLibrary.simpleMessage("總價值 "),
        "portfolioWithdrawableAmount": m12,
        "portfolioYourBotStock":
            MessageLookupByLibrary.simpleMessage("你的Botstocks"),
        "prevClose": MessageLookupByLibrary.simpleMessage("上日收市"),
        "privacyEvaluation": MessageLookupByLibrary.simpleMessage("私隱評估"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("私隱政策"),
        "pushNotification": MessageLookupByLibrary.simpleMessage("推送通知"),
        "relearn": MessageLookupByLibrary.simpleMessage("再次學習"),
        "saveForLater": MessageLookupByLibrary.simpleMessage("儲存並離開"),
        "sectors": MessageLookupByLibrary.simpleMessage("領域"),
        "setUpFinancialProfile": MessageLookupByLibrary.simpleMessage("設定財務概況"),
        "shares": MessageLookupByLibrary.simpleMessage("數量"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(" 真係要登出？"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage(
            "與 Lora --- 你嘅 FinFit 教練，\n展開全新投資之旅"),
        "startABotstock": MessageLookupByLibrary.simpleMessage("開始交易"),
        "startDate": MessageLookupByLibrary.simpleMessage("最佳開始日期"),
        "startInvesting": MessageLookupByLibrary.simpleMessage("開始投資 "),
        "subscription": MessageLookupByLibrary.simpleMessage("訂購計劃"),
        "summary": MessageLookupByLibrary.simpleMessage("摘要"),
        "terminateAccount": MessageLookupByLibrary.simpleMessage("終止賬戶"),
        "termsAndConditions": MessageLookupByLibrary.simpleMessage("條款與約束"),
        "to": MessageLookupByLibrary.simpleMessage("至"),
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
        "totalAmount": MessageLookupByLibrary.simpleMessage("總金額"),
        "totalPnlIs": MessageLookupByLibrary.simpleMessage("總盈虧"),
        "tradeFee": MessageLookupByLibrary.simpleMessage("交易費用"),
        "tradeWithANewBotstock":
            MessageLookupByLibrary.simpleMessage("以一隻新 Botstock 交易"),
        "tradeWithBots": MessageLookupByLibrary.simpleMessage("以 Bot 交易"),
        "tradeWithYourFirstBotstock":
            MessageLookupByLibrary.simpleMessage("以首隻 Botstock 交易"),
        "transactionFee": MessageLookupByLibrary.simpleMessage("交易費用"),
        "transactionHistory": MessageLookupByLibrary.simpleMessage("交易歷史"),
        "transactionHistoryTabAll": MessageLookupByLibrary.simpleMessage("全部"),
        "transactionHistoryTabOrders":
            MessageLookupByLibrary.simpleMessage("訂單"),
        "transactionHistoryTabTransfer":
            MessageLookupByLibrary.simpleMessage("提存 "),
        "transactionHistoryTitle": MessageLookupByLibrary.simpleMessage("交易歷史"),
        "transactionHistoryToday": MessageLookupByLibrary.simpleMessage("今日"),
        "transferTo": MessageLookupByLibrary.simpleMessage("轉賬至"),
        "userId": MessageLookupByLibrary.simpleMessage("用戶 ID"),
        "viewDepositGuide": MessageLookupByLibrary.simpleMessage("查看入金提示"),
        "website": MessageLookupByLibrary.simpleMessage("網站"),
        "welcomeScreenFirstBenefit":
            MessageLookupByLibrary.simpleMessage("FinFit 教練指導"),
        "welcomeScreenSecondBenefit":
            MessageLookupByLibrary.simpleMessage("個人化體驗"),
        "welcomeScreenSubTitle":
            MessageLookupByLibrary.simpleMessage("踢走投資壞習慣！投資夠FinFit，夠自信！"),
        "welcomeScreenThirdBenefit":
            MessageLookupByLibrary.simpleMessage("AI 全自動交易"),
        "welcomeScreenTitle":
            MessageLookupByLibrary.simpleMessage("投資，你夠 Fit 未？"),
        "withdrawalAmount": MessageLookupByLibrary.simpleMessage("提取金額"),
        "withdrawalRequestSubmittedSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "當資金已繳付至你戶口後，我們會盡快透過電郵或應用程式通知。"),
        "withdrawalRequestSubmittedTitle":
            MessageLookupByLibrary.simpleMessage("已收到提取申請"),
        "withdrawalWorkingDays":
            MessageLookupByLibrary.simpleMessage("提取款項最多需時2個工作天。"),
        "yes": MessageLookupByLibrary.simpleMessage("是"),
        "yourBankAccount": MessageLookupByLibrary.simpleMessage("銀行賬戶"),
        "yourBankAccountIsUnderReview": m13,
        "yourPaymentInformationIsUnderReview":
            MessageLookupByLibrary.simpleMessage(
                "您的銀行帳戶信息正在審核中。一旦您的開戶申請獲批，您的銀行帳戶詳細信息將顯示在此處。請注意，審核過程最多可能需要 2 個工作日。")
      };
}
