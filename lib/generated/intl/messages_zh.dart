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

  static String m0(name) => "離AI投資之道\n又近左一步，${name}！";

  static String m1(name) => "進度好好吖,\n${name}！";

  static String m2(availableAmount, minimumAmount) =>
      "你有  ${availableAmount} 可供使用，每單交易最小金額為 ${minimumAmount} 。";

  static String m3(amount) => "投資額及交易費用 (HKD${amount}) 會自動轉至你嘅賬戶。";

  static String m4(botInformation) =>
      "你可以選擇依家結束，所有 ${botInformation} 嘅交易活動會立即停止。";

  static String m5(minimumAmount) => "每單交易最小金額為 ${minimumAmount} 。";

  static String m6(expiryTime) => "更新到期時間為 ${expiryTime}";

  static String m7(amount) => "基於監管要求，如要更改銀行戶口，你必須重新入金最少HKD\$${amount}";

  static String m8(emailAddress) => "已發送電子郵件至\n ${emailAddress}\n\n請用手機點擊開通連結！";

  static String m9(botName, botSymbol, dateTime) =>
      "${botName} ${botSymbol} 將會在 ${dateTime} 開始";

  static String m10(minDeposit) =>
      "複製 Asklora 銀行資料，並從你銀行戶口透過 FPS 或 電匯 轉賬不少於 HK\$${minDeposit}。";

  static String m11(minute) => " ~${minute} 分鐘";

  static String m12(currency) => "購買力 (${currency})";

  static String m13(currency) => "當前價格 ${currency}";

  static String m14(bot, startDate, endDate, duration) =>
      "${bot} 於過去 ${duration} 星期之表現  (${startDate} - ${endDate})";

  static String m15(dateTime) => "到期日期 ${dateTime}";

  static String m16(dateTime) => "${dateTime}日後到期";

  static String m17(currency) => "Botstock 總價值 (${currency})";

  static String m18(currency) => "可提取金額 (${currency})";

  static String m19(botName, botSymbol, dateTime) =>
      "${botName} ${botSymbol} 將於 ${dateTime} 開始";

  static String m20(minDeposit) =>
      "請轉賬最少 HK\$${minDeposit} 至 Asklora 銀行戶口。任何少於 HK\$${minDeposit} 的首次入金均會被拒收，並會被徵收手續費。";

  static String m21(minDeposit) =>
      "我們會提取由你銀行透過 API 或匯款通知書收集的資訊， 確定你指定的銀行戶口。我們只會接受透過此指定戶口進行所有將來的入金與提取。你可轉換指定銀行戶口，但你需要完成最少匯款 HK\$${minDeposit} 以通過相同的認證。";

  static String m22(dateTime) => "銀行賬戶正在審批當中，並會於${dateTime} 完成。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("關於"),
        "aboutAsklora": MessageLookupByLibrary.simpleMessage("關於 Asklora"),
        "accountInformation": MessageLookupByLibrary.simpleMessage("帳戶資訊"),
        "accountIsNotActive": MessageLookupByLibrary.simpleMessage(
            "Your account is not active yet."),
        "accountSettings": MessageLookupByLibrary.simpleMessage("帳戶設定"),
        "activities": MessageLookupByLibrary.simpleMessage("交易記錄"),
        "afterPayDepositHeaderTitle":
            MessageLookupByLibrary.simpleMessage("投資賬戶\n即將 Ready！"),
        "agreements": MessageLookupByLibrary.simpleMessage("Agreements"),
        "allSettings": MessageLookupByLibrary.simpleMessage("設定"),
        "almostFinished": MessageLookupByLibrary.simpleMessage("馬上就好"),
        "askNameScreenPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Hi! 我係 Lora，你嘅 FinFit 投資教練，可以點叫你？"),
        "askNameScreenTextFieldHint":
            MessageLookupByLibrary.simpleMessage("你的名字"),
        "atLeast1Lowercase":
            MessageLookupByLibrary.simpleMessage("最少 1 個小寫英文字母"),
        "atLeast1Number": MessageLookupByLibrary.simpleMessage("最少 1 個數字"),
        "atLeast1Uppercase":
            MessageLookupByLibrary.simpleMessage("最少 1 個大寫英文字母"),
        "beforeDepositHeaderTitle": m0,
        "beforeKYCHeaderTitle": m1,
        "bestSuitedFor": MessageLookupByLibrary.simpleMessage("最適合"),
        "botDuration": MessageLookupByLibrary.simpleMessage("Bot 期限"),
        "botManagementFee": MessageLookupByLibrary.simpleMessage("Bot 管理費用"),
        "botTradeBottomSheetAccountNotYetApprovedSubTitle":
            MessageLookupByLibrary.simpleMessage("預計批核時間為 2 個工作天。"),
        "botTradeBottomSheetAccountNotYetApprovedTitle":
            MessageLookupByLibrary.simpleMessage("賬戶成功批核後就可以開始交易。"),
        "botTradeBottomSheetAmountMinimum": m2,
        "botTradeBottomSheetAmountTitle":
            MessageLookupByLibrary.simpleMessage("你想投資嘅金額係？"),
        "botTradeBottomSheetCancelBotStockConfirmationTitle": m3,
        "botTradeBottomSheetEndBotStockConfirmationSubTitle":
            MessageLookupByLibrary.simpleMessage(" Botstock 的總價值會自動轉至你的賬戶。"),
        "botTradeBottomSheetEndBotStockConfirmationTitle": m4,
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle":
            MessageLookupByLibrary.simpleMessage("存入資金正式交易"),
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle":
            MessageLookupByLibrary.simpleMessage("免費 Botstock 已成功加至\n你嘅投資組合！"),
        "botTradeBottomSheetInsufficientBalanceSubTitle": m5,
        "botTradeBottomSheetInsufficientBalanceTitle":
            MessageLookupByLibrary.simpleMessage("唔夠資金，幫你唔到，係時候入錢入戶口！"),
        "botTradeBottomSheetRolloverConfirmationButton":
            MessageLookupByLibrary.simpleMessage("延長"),
        "botTradeBottomSheetRolloverConfirmationSubTitle": m6,
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
        "buttonBackToHome": MessageLookupByLibrary.simpleMessage("返回主頁"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "buttonCancelTrade": MessageLookupByLibrary.simpleMessage("取消交易"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("確定"),
        "buttonContinue": MessageLookupByLibrary.simpleMessage("繼續"),
        "buttonDeposit": MessageLookupByLibrary.simpleMessage("入金"),
        "buttonDone": MessageLookupByLibrary.simpleMessage("完成"),
        "buttonForgetPassword": MessageLookupByLibrary.simpleMessage("忘記密碼？"),
        "buttonHaveAnAccount": MessageLookupByLibrary.simpleMessage("已有賬戶？"),
        "buttonLetsBegin": MessageLookupByLibrary.simpleMessage("立即開始"),
        "buttonMaybeLater": MessageLookupByLibrary.simpleMessage("稍後再說"),
        "buttonNext": MessageLookupByLibrary.simpleMessage("下一步"),
        "buttonNotNow": MessageLookupByLibrary.simpleMessage("稍後再說"),
        "buttonReloadPage": MessageLookupByLibrary.simpleMessage("重新加載"),
        "buttonResendActivationLink":
            MessageLookupByLibrary.simpleMessage("再發送開通連結"),
        "buttonSave": MessageLookupByLibrary.simpleMessage("儲存"),
        "buttonSignOut": MessageLookupByLibrary.simpleMessage("登出"),
        "buttonSignUp": MessageLookupByLibrary.simpleMessage("註冊"),
        "buttonSignUpAgain": MessageLookupByLibrary.simpleMessage("再次註冊"),
        "buttonSubmit": MessageLookupByLibrary.simpleMessage("提交"),
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
        "checkBotStockDetails":
            MessageLookupByLibrary.simpleMessage("查看 Botstock 資訊"),
        "confirmNewPassword": MessageLookupByLibrary.simpleMessage("確認新密碼"),
        "confirmTrade": MessageLookupByLibrary.simpleMessage("確認買入"),
        "contactUs": MessageLookupByLibrary.simpleMessage("聯絡我們"),
        "continueAccountOpening":
            MessageLookupByLibrary.simpleMessage("開立投資賬戶"),
        "copyAskloraBankDetails": MessageLookupByLibrary.simpleMessage(
            "複製 Asklora 銀行資料，並從你銀行戶口透過 FPS或電匯轉。"),
        "corePlan": MessageLookupByLibrary.simpleMessage("核心計劃"),
        "createAnAccount": MessageLookupByLibrary.simpleMessage("開立賬戶"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("當前價格"),
        "customerService": MessageLookupByLibrary.simpleMessage("客戶服務"),
        "dateJoined": MessageLookupByLibrary.simpleMessage("加入日期"),
        "defineInvestmentStyle": MessageLookupByLibrary.simpleMessage("界定投資風格"),
        "deposit": MessageLookupByLibrary.simpleMessage("存入資金"),
        "depositAmount": MessageLookupByLibrary.simpleMessage("存入金額"),
        "depositFundToStartInvesting":
            MessageLookupByLibrary.simpleMessage("存入資金開始投資"),
        "depositRegulatoryRequirements": m7,
        "depositRequestSubmittedSubTitleFirstTime":
            MessageLookupByLibrary.simpleMessage(
                "我們會於 1 至 2 個工作天內檢視你的開戶申請及首次入金。當賬戶批核後會以電郵或應用程式通知。"),
        "depositRequestSubmittedSubTitleReturn":
            MessageLookupByLibrary.simpleMessage(
                "你已提交入金請求，當收到入金後，\n我們會盡快以電郵或應用程式通知。"),
        "depositRequestSubmittedTitle":
            MessageLookupByLibrary.simpleMessage("已收到入金申請"),
        "depositViaFpsOrWireTransfer":
            MessageLookupByLibrary.simpleMessage("以 FPS 或電匯入金"),
        "doAnyOfTheFollowingApply":
            MessageLookupByLibrary.simpleMessage("以下描述適用於你或你的直系親屬？"),
        "email": MessageLookupByLibrary.simpleMessage("電郵"),
        "emailActivationFailedTitle":
            MessageLookupByLibrary.simpleMessage("Sorry！你嘅請求已經逾時。\n請重新開通帳戶。"),
        "emailActivationSuccessTitle": m8,
        "emailAddress": MessageLookupByLibrary.simpleMessage("電郵地址"),
        "emailNotExist": MessageLookupByLibrary.simpleMessage("此電郵地址的用戶不存在"),
        "emailNotVerified": MessageLookupByLibrary.simpleMessage("用戶電郵未認證"),
        "employees": MessageLookupByLibrary.simpleMessage("員工人數"),
        "endBotStockAcknowledgement": m9,
        "endDate": MessageLookupByLibrary.simpleMessage("結束日期"),
        "endedAmount": MessageLookupByLibrary.simpleMessage("到期價值"),
        "enterValidEmail": MessageLookupByLibrary.simpleMessage("無效電郵地址"),
        "enterValidPassword": MessageLookupByLibrary.simpleMessage("無效電郵地址"),
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
        "existingPassword": MessageLookupByLibrary.simpleMessage("現有密碼"),
        "filledPrice": MessageLookupByLibrary.simpleMessage("成交價格"),
        "financialProfile":
            MessageLookupByLibrary.simpleMessage("Financial Profile"),
        "firstTimeCopyAskloraBankDetails": m10,
        "founded": MessageLookupByLibrary.simpleMessage("成立年份"),
        "free": MessageLookupByLibrary.simpleMessage("免費"),
        "freeTrial": MessageLookupByLibrary.simpleMessage("免費試用期"),
        "fullName": MessageLookupByLibrary.simpleMessage("姓名"),
        "getHelp": MessageLookupByLibrary.simpleMessage("獲得幫助"),
        "getTheFirstBotstockForFree":
            MessageLookupByLibrary.simpleMessage("獲取首個免費 Botstock "),
        "go": MessageLookupByLibrary.simpleMessage("繼續"),
        "gotIt": MessageLookupByLibrary.simpleMessage("知道了"),
        "greatStart": MessageLookupByLibrary.simpleMessage("開始投資"),
        "greetingScreenSubTitle":
            MessageLookupByLibrary.simpleMessage("訓練開始，會問下基本問題先！記住，冇耐性，就輸梗！ "),
        "greetingScreenTitle":
            MessageLookupByLibrary.simpleMessage("Alright! 你準備開始 FinFit 未先？"),
        "halfWayThere": MessageLookupByLibrary.simpleMessage("進展順利"),
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
        "inputDepositAmount": MessageLookupByLibrary.simpleMessage("輸入金額"),
        "introduceBotPlank":
            MessageLookupByLibrary.simpleMessage("簡介 Bot - Plank"),
        "introduceBotPullup":
            MessageLookupByLibrary.simpleMessage("簡介 Bot - Pullup"),
        "introduceBotSquat":
            MessageLookupByLibrary.simpleMessage("簡介 Bot - Squat"),
        "invalidOtp": MessageLookupByLibrary.simpleMessage("Invalid OTP"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage("無效密碼"),
        "investmentAmount": MessageLookupByLibrary.simpleMessage("投資金額"),
        "investmentPeriod": MessageLookupByLibrary.simpleMessage("投資期"),
        "investmentPreferences": MessageLookupByLibrary.simpleMessage("投資偏好"),
        "investmentStyleWelcomeTitle": MessageLookupByLibrary.simpleMessage(
            "想要 FinFit， 有咩投資秘技？\n界定投資風格先！\n"),
        "language": MessageLookupByLibrary.simpleMessage("語言"),
        "learnBotstockManagement":
            MessageLookupByLibrary.simpleMessage("學䲾 Botstock 管理"),
        "licenseeName":
            MessageLookupByLibrary.simpleMessage("Licensee: Chang Yung Ching"),
        "licenseeNumber": MessageLookupByLibrary.simpleMessage("CE 編號: AFF918"),
        "linkPasswordResetIsSent": MessageLookupByLibrary.simpleMessage(
            "Link for Password reset is sent to email."),
        "manageYourBotstock":
            MessageLookupByLibrary.simpleMessage("管理 Botstock"),
        "marketCap": MessageLookupByLibrary.simpleMessage("市值"),
        "marketPrice": MessageLookupByLibrary.simpleMessage("市場價格"),
        "masterAiTrading":
            MessageLookupByLibrary.simpleMessage("Master AI Trading"),
        "milestones": MessageLookupByLibrary.simpleMessage("目標"),
        "min": m11,
        "min8Character": MessageLookupByLibrary.simpleMessage("最少 8 個字母"),
        "needHelp": MessageLookupByLibrary.simpleMessage("需要幫助？"),
        "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
        "nextStep": MessageLookupByLibrary.simpleMessage("下一步"),
        "no": MessageLookupByLibrary.simpleMessage(" 否"),
        "noteOnPaymentDetails": MessageLookupByLibrary.simpleMessage(
            "注意\n我們會與你所登記銀行協作藉以核實你的銀行資料（賬戶姓名、銀行編號、銀行賬戶 號碼）。我們亦可能會因核實交易，向你要求更多附加資料。"),
        "notes": MessageLookupByLibrary.simpleMessage("說明"),
        "notificationSetting": MessageLookupByLibrary.simpleMessage("通知設定"),
        "notificationSettings": MessageLookupByLibrary.simpleMessage("通知設定"),
        "officeHours":
            MessageLookupByLibrary.simpleMessage("09:00-18:00 (HKT)"),
        "officeHoursLabel": MessageLookupByLibrary.simpleMessage("辦公時間"),
        "oldPasswordSameWithNewPasswordError":
            MessageLookupByLibrary.simpleMessage("設置的新密碼不能和舊密碼相同"),
        "onBoardingCompletionMessage": MessageLookupByLibrary.simpleMessage(
            "您已經完成了在Asklora開立賬戶的所有步驟！您的賬戶一\n經審核通過，即可開始交易。審核通常需要1至2個工作日。"),
        "openInvestmentAccount": MessageLookupByLibrary.simpleMessage("開立投資賬戶"),
        "orderCancelled": MessageLookupByLibrary.simpleMessage("訂單己取消"),
        "orderExpired": MessageLookupByLibrary.simpleMessage("訂單已過期"),
        "orderPlaced": MessageLookupByLibrary.simpleMessage("已提交訂單"),
        "orderRollover": MessageLookupByLibrary.simpleMessage("訂單已續期"),
        "orderStarted": MessageLookupByLibrary.simpleMessage("訂單已開始"),
        "password": MessageLookupByLibrary.simpleMessage("密碼"),
        "passwordChangeSuccess":
            MessageLookupByLibrary.simpleMessage("Password Change Success"),
        "passwordChangeSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully."),
        "passwordDoesNotMatch": MessageLookupByLibrary.simpleMessage("兩組密碼不相符"),
        "payDepositToStartRealTrade":
            MessageLookupByLibrary.simpleMessage("入金以開始正式交易"),
        "paymentDetails": MessageLookupByLibrary.simpleMessage("銀行賬戶詳情"),
        "performance": MessageLookupByLibrary.simpleMessage("表現"),
        "personalInfo": MessageLookupByLibrary.simpleMessage("Personal Info"),
        "personalisation": MessageLookupByLibrary.simpleMessage("個人化"),
        "phone": MessageLookupByLibrary.simpleMessage("電話"),
        "pleaseAddAHkBankAccount": MessageLookupByLibrary.simpleMessage(
            "請確保加入的香港銀行戶口是在你名下。其他人的銀行戶口及聯名戶口將不會接受。"),
        "pleaseMakeSureYouHaveFinished":
            MessageLookupByLibrary.simpleMessage("匯款證明需要顯示你的銀行戶口號碼，全名 及金額。"),
        "pleaseMakeSureYouPressSubmit":
            MessageLookupByLibrary.simpleMessage("請確保於你的銀行轉賬資金後才按「提交」鍵。"),
        "portfolioBuyingPower": m12,
        "portfolioBuyingPowerToolTip": MessageLookupByLibrary.simpleMessage(
            "購買力代表了你可以用來購買Botstock的現金額。你的可提取金額和購買力會出現不一樣的情況。例如，開始Botstock後，你的購買力會相對減少，而Botstock總價值會相對提高。或當你的Botstock已到期或被終止，其價值將會增加至購買力，而在「T+2」日，T為交易當日， 該價值也會同時顯示在可提取金額。 "),
        "portfolioCurrentPrice": m13,
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("取消BOTSTOCK"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("取消Botstock"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("續期Botstock"),
        "portfolioDetailChartCaption": m14,
        "portfolioDetailExpiredAt": m15,
        "portfolioDetailExpiredIn": m16,
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
        "portfolioTotalBotStock": m17,
        "portfolioTotalPL": MessageLookupByLibrary.simpleMessage("總盈虧"),
        "portfolioTotalValue": MessageLookupByLibrary.simpleMessage("總價值 "),
        "portfolioWithdrawableAmount": m18,
        "portfolioYourBotStock":
            MessageLookupByLibrary.simpleMessage("你的Botstocks"),
        "pressBackAgain": MessageLookupByLibrary.simpleMessage("再按一次登出Asklora"),
        "prevClose": MessageLookupByLibrary.simpleMessage("上日收市"),
        "privacyEvaluation": MessageLookupByLibrary.simpleMessage("私隱評估"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("私隱政策"),
        "pushNotification": MessageLookupByLibrary.simpleMessage("推送通知"),
        "readyToGo": MessageLookupByLibrary.simpleMessage("準備好未？"),
        "relearn": MessageLookupByLibrary.simpleMessage("再次學習"),
        "returningUserDepositNotes": MessageLookupByLibrary.simpleMessage(
            "我們會與你所登記銀行協作藉以核實你的銀行資料（賬戶姓名、銀行編號、銀行賬戶號碼）。不過，我們亦可能會因核實交易，向你要求更多附加資料。"),
        "riskDisclosureStatementAcknowledgement":
            MessageLookupByLibrary.simpleMessage("我已閱讀、理解，及同意風險披露聲明。"),
        "riskDisclosureStatementLabel":
            MessageLookupByLibrary.simpleMessage("風險披露聲明"),
        "riskDisclosureStatementString": MessageLookupByLibrary.simpleMessage(
            "1. The prices of securities fluctuate, sometimes dramatically. The price of a security may move up or down, and may become valueless. It is as likely that losses will be incurred rather than profit made as a result of buying and selling securities. Investors should not only base on this marketing material to make any investment decision, you should carefully consider whether the investment products or services are suitable for you according to your investment experience, purpose, risk tolerance, financial or related conditions. If you have any questions, please contact us or obtain independent advice.\n\n2. Investment in foreign securities carries additional risks not generally associated with securities in the domestic market. The value or income of foreign securities may be more volatile and could be adversely affected by changes in currency rates of exchange, foreign taxation practices, foreign laws, government practices, regulations, and political events. You may find it more difficult to liquidate investments in foreign securities where they have limited liquidity in the relevant market. Foreign laws, government practices, and regulations may also affect the transferability of foreign securities. Timely and reliable information about the value or the extent of the risks of foreign securities may not be readily available at all times.\n\n3. You acknowledge that you have fully understood the implications of the risks associated with the Electronic Trading Service as set out in the Client Agreement"),
        "rolloverBotStockAcknowledgement": m19,
        "saveForLater": MessageLookupByLibrary.simpleMessage("儲存並離開"),
        "sectors": MessageLookupByLibrary.simpleMessage("領域"),
        "setUpFinancialProfile": MessageLookupByLibrary.simpleMessage("設定財務概況"),
        "shares": MessageLookupByLibrary.simpleMessage("數量"),
        "signAgreements": MessageLookupByLibrary.simpleMessage("簽署協議"),
        "signIn": MessageLookupByLibrary.simpleMessage("登入"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(" 真係要登出？"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage(" 踏入AI新世代，\n展開AI投資之旅"),
        "startABotstock": MessageLookupByLibrary.simpleMessage("開始交易"),
        "startDate": MessageLookupByLibrary.simpleMessage("最佳開始日期"),
        "startInvesting": MessageLookupByLibrary.simpleMessage("開始投資 "),
        "startInvestingOnMilestone":
            MessageLookupByLibrary.simpleMessage("即將進入投資狀態！"),
        "submitApplication":
            MessageLookupByLibrary.simpleMessage("Submit Application"),
        "subscription": MessageLookupByLibrary.simpleMessage("訂購計劃"),
        "summary": MessageLookupByLibrary.simpleMessage("摘要"),
        "summaryAgreementInformation": MessageLookupByLibrary.simpleMessage(
            "The agreements will become binding subject to the approval of the information submitted by you. \n\nIf there is a material change to this information, please contact loracares@asklora.ai as soon as possible"),
        "terminateAccount": MessageLookupByLibrary.simpleMessage("終止賬戶"),
        "termsAndConditions": MessageLookupByLibrary.simpleMessage("條款與約束"),
        "theAmountMustMatch":
            MessageLookupByLibrary.simpleMessage("金額須與匯款證明一致。"),
        "theAmountMustMatchWithPor":
            MessageLookupByLibrary.simpleMessage("金額須與匯款證明一致。"),
        "thePorShouldShowYourBank":
            MessageLookupByLibrary.simpleMessage("匯款證明需要顯示你的銀行戶口號碼，全名 及金額。"),
        "theProofOfRemittanceShouldShowYourBankAccount":
            MessageLookupByLibrary.simpleMessage("匯款證明需要顯示你的銀行戶口號碼，全名 及金額。"),
        "to": MessageLookupByLibrary.simpleMessage("至"),
        "tokenInvalid": MessageLookupByLibrary.simpleMessage(
            "Token is invalid or expired."),
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
        "tradeCancelledSubtitle":
            MessageLookupByLibrary.simpleMessage("交易已取消，你的投資金額已轉至你嘅賬戶。"),
        "tradeCancelledTitle": MessageLookupByLibrary.simpleMessage("交易已取消"),
        "tradeFee": MessageLookupByLibrary.simpleMessage("交易費用"),
        "tradeRequestReceived": MessageLookupByLibrary.simpleMessage("已收到交易指令"),
        "tradeSummary": MessageLookupByLibrary.simpleMessage("交易摘要"),
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
        "transferAtLeastWithMinimumDeposit": m20,
        "transferAtLeastWithNoMinimumDeposit":
            MessageLookupByLibrary.simpleMessage(
                "請由你之前使用的銀行戶口轉賬至Asklora 銀行戶口。"),
        "transferFundToAsklora":
            MessageLookupByLibrary.simpleMessage("轉賬資金予Asklora"),
        "transferInitialFundToAsklora":
            MessageLookupByLibrary.simpleMessage("轉賬首筆資金予Asklora"),
        "transferTo": MessageLookupByLibrary.simpleMessage("轉賬至"),
        "uploadProofOfRemittance":
            MessageLookupByLibrary.simpleMessage("上載匯款證明"),
        "userId": MessageLookupByLibrary.simpleMessage("用戶 ID"),
        "viewDepositGuide": MessageLookupByLibrary.simpleMessage("查看入金提示"),
        "weAcceptHKDOnly": MessageLookupByLibrary.simpleMessage("我們只接受港幣。"),
        "weWillOnlyAcceptDepositViaBankTransfer":
            MessageLookupByLibrary.simpleMessage(
                "我們只接受由你戶口透過銀行轉賬 (電匯/FPS) 的入金。"),
        "weWillOnlyAcceptHKD": MessageLookupByLibrary.simpleMessage("我們只接受港幣"),
        "weWillTakeInformationCollectedFromYour": m21,
        "website": MessageLookupByLibrary.simpleMessage("網站"),
        "welcomeScreenFirstBenefit":
            MessageLookupByLibrary.simpleMessage("度身訂做AI指導"),
        "welcomeScreenSecondBenefit":
            MessageLookupByLibrary.simpleMessage("個人化體驗"),
        "welcomeScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "踢走投資壞習慣！\n由AI 顧問 Asklora 帶你一齊體驗嶄新科技！"),
        "welcomeScreenThirdBenefit":
            MessageLookupByLibrary.simpleMessage("AI 全自動交易"),
        "welcomeScreenTitle":
            MessageLookupByLibrary.simpleMessage("投資都要夠 Fit "),
        "withdraw": MessageLookupByLibrary.simpleMessage("提取資金"),
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
        "yourBankAccountIsUnderReview": m22,
        "yourDepositCanTakeUp2WorkingDays":
            MessageLookupByLibrary.simpleMessage("入金程序最多需時 2 個工作天"),
        "yourDepositMayBeRejected": MessageLookupByLibrary.simpleMessage(
            "若所通知的金額與實際轉賬金額不符，你的入金可能會被拒絕。"),
        "yourPasswordHasBeenChanged": MessageLookupByLibrary.simpleMessage(
            "Your password has been changed"),
        "yourPaymentInformationIsUnderReview":
            MessageLookupByLibrary.simpleMessage(
                "您的銀行帳戶信息正在審核中。一旦您的開戶申請獲批，您的銀行帳戶詳細信息將顯示在此處。請注意，審核過程最多可能需要 2 個工作日。")
      };
}
