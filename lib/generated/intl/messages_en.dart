// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(availableAmount, minimumAmount) =>
      "You have ${availableAmount}, the minimum investment amount is ${minimumAmount}.";

  static String m1(botInformation) =>
      "You can end the Botstock now, and all stocks will be sold. Trading of ${botInformation} will stop.";

  static String m2(minimumAmount) =>
      "The minimum investment amount is ${minimumAmount} per trade.";

  static String m3(expiryTime) => "The new expiry date is ${expiryTime}";

  static String m4(currency) => "Buying Power (${currency})";

  static String m5(currency) => "Current Price ${currency}";

  static String m6(bot, startDate, endDate, duration) =>
      "Past ${duration} performance of ${bot}  (${startDate} - ${endDate})";

  static String m7(dateTime) => "Expired at ${dateTime}";

  static String m8(dateTime) => "Expired in ${dateTime} days";

  static String m9(currency) => "Total Botstock Values (${currency})";

  static String m10(currency) => "Total Portfolio Value (${currency})";

  static String m11(dateTime) =>
      "Your Bank Account is under review and will be complete by ${dateTime}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutAsklora": MessageLookupByLibrary.simpleMessage("About Asklora"),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "accountSettings":
            MessageLookupByLibrary.simpleMessage("Account Settings"),
        "activities": MessageLookupByLibrary.simpleMessage("Activities"),
        "allSettings": MessageLookupByLibrary.simpleMessage("All Settings"),
        "askNameScreenPlaceholder": MessageLookupByLibrary.simpleMessage(
            "I\'m Lora, your FinFit coach. Get ready to crush your goals with me!\n\nWhat’s your name? "),
        "askNameScreenTextFieldHint":
            MessageLookupByLibrary.simpleMessage("Your Name"),
        "bestSuitedFor":
            MessageLookupByLibrary.simpleMessage("Best Suited For"),
        "botStockId": MessageLookupByLibrary.simpleMessage("Botstock ID"),
        "botTradeBottomSheetAmountMinimum": m0,
        "botTradeBottomSheetAmountTitle":
            MessageLookupByLibrary.simpleMessage("How much are you investing?"),
        "botTradeBottomSheetCancelBotStockConfirmationTitle":
            MessageLookupByLibrary.simpleMessage(
                "The investment amount and Bot management fee (HKD1,500) will be returned to your account."),
        "botTradeBottomSheetEndBotStockConfirmationSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "The total Botstock value will be returned to your \naccount after the next community order."),
        "botTradeBottomSheetEndBotStockConfirmationTitle": m1,
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle":
            MessageLookupByLibrary.simpleMessage(" DEPOSIT TO START TRADING"),
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle":
            MessageLookupByLibrary.simpleMessage(
                "Your free Botstock has been added to your portfolio!"),
        "botTradeBottomSheetInsufficientBalanceSubTitle": m2,
        "botTradeBottomSheetInsufficientBalanceTitle":
            MessageLookupByLibrary.simpleMessage(
                "You are running out of money! Fund your account now."),
        "botTradeBottomSheetRolloverConfirmationButton":
            MessageLookupByLibrary.simpleMessage("CONFIRM ROLLOVER"),
        "botTradeBottomSheetRolloverConfirmationSubTitle": m3,
        "botTradeBottomSheetRolloverConfirmationTitle":
            MessageLookupByLibrary.simpleMessage(
                "Your Botstock will be extended for \n\n2 Weeks"),
        "botTradeBottomSheetRolloverDisclosureSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "You will be charged HKD40 if you want to extend this Botstock. If you do not have enough funds, then your fees will be deducted when you have sufficient buying power"),
        "botTradeBottomSheetRolloverDisclosureTitle":
            MessageLookupByLibrary.simpleMessage(
                "If you extend the Botstock period, you will incur additional fees"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "buttonCancelTrade":
            MessageLookupByLibrary.simpleMessage("CANCEL TRADE"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("CONFIRM"),
        "buttonCreateAnAccount":
            MessageLookupByLibrary.simpleMessage("CREATE AN ACCOUNT"),
        "buttonDeposit": MessageLookupByLibrary.simpleMessage("DEPOSIT"),
        "buttonHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("HAVE AN ACCOUNT?"),
        "buttonLetsBegin": MessageLookupByLibrary.simpleMessage("LET’S BEGIN"),
        "buttonNext": MessageLookupByLibrary.simpleMessage("NEXT"),
        "buttonNotNow": MessageLookupByLibrary.simpleMessage("NOT NOW"),
        "buttonReloadPage": MessageLookupByLibrary.simpleMessage("RELOAD PAGE"),
        "buttonSignOut": MessageLookupByLibrary.simpleMessage("SIGN OUT"),
        "carouselIntro1": MessageLookupByLibrary.simpleMessage(
            "Get your Investments in Shape"),
        "carouselIntro2": MessageLookupByLibrary.simpleMessage(
            "Guided by FinFit Coach, Lora"),
        "carouselIntro3": MessageLookupByLibrary.simpleMessage(
            "Invest with AI strategy, automated"),
        "carouselIntro4":
            MessageLookupByLibrary.simpleMessage("Personalised experience"),
        "ceo": MessageLookupByLibrary.simpleMessage("CEO"),
        "changeBankAccount":
            MessageLookupByLibrary.simpleMessage("Change Bank Account"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "corePlan": MessageLookupByLibrary.simpleMessage("Core Plan"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("Current Price"),
        "customerService":
            MessageLookupByLibrary.simpleMessage("Customer Service"),
        "dateJoined": MessageLookupByLibrary.simpleMessage("Date Joined"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "employees": MessageLookupByLibrary.simpleMessage("Employees"),
        "endedAmount": MessageLookupByLibrary.simpleMessage("Ended Amount"),
        "errorGettingInformationInvestmentDetailSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "There was an error when trying to get the investment details. Please try reloading the page"),
        "errorGettingInformationInvestmentStyleQuestionSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "There was an error when trying to get the investment style question. Please try reloading the page"),
        "errorGettingInformationPortfolioSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "There was an error when trying to get your Portfolio. Please try reloading the page"),
        "errorGettingInformationTitle":
            MessageLookupByLibrary.simpleMessage("Unable to get information"),
        "errorGettingInformationTransactionHistorySubTitle":
            MessageLookupByLibrary.simpleMessage(
                "There was an error when trying to get the transaction history. Please try reloading the page"),
        "estMaxLossLevel":
            MessageLookupByLibrary.simpleMessage("Est. Max Loss Level"),
        "estMaxLossPercent":
            MessageLookupByLibrary.simpleMessage("Est. Max Loss %"),
        "estMaxProfitLevel":
            MessageLookupByLibrary.simpleMessage("Est. Max Profit Level"),
        "estMaxProfitPercent":
            MessageLookupByLibrary.simpleMessage("Est. Max Profit %"),
        "estStopLossLevel":
            MessageLookupByLibrary.simpleMessage("Est. Stop Loss Level"),
        "estStopLossPercent":
            MessageLookupByLibrary.simpleMessage("Est. Stop Loss %"),
        "estTakeProfitLevel":
            MessageLookupByLibrary.simpleMessage("Est. Take Profit Level"),
        "estTakeProfitPercent":
            MessageLookupByLibrary.simpleMessage("Est. Take Profit %"),
        "estimatedEndDate":
            MessageLookupByLibrary.simpleMessage("Estimated End Date"),
        "filledPrice": MessageLookupByLibrary.simpleMessage("Filled Price"),
        "founded": MessageLookupByLibrary.simpleMessage("Founded"),
        "free": MessageLookupByLibrary.simpleMessage("FREE"),
        "freeTrial": MessageLookupByLibrary.simpleMessage("Free Trial"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "getHelp": MessageLookupByLibrary.simpleMessage("Get Help"),
        "greetingScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "Let’s start the training with\nsimple questions!\n\nRemember - to lose patience\nis to lose the battle!"),
        "greetingScreenTitle": MessageLookupByLibrary.simpleMessage(
            "Alright! Are you ready for the FinFit journey? "),
        "headquarters": MessageLookupByLibrary.simpleMessage("Headquarters"),
        "howItWorks": MessageLookupByLibrary.simpleMessage("How It Works"),
        "inApp": MessageLookupByLibrary.simpleMessage("In-App"),
        "industry": MessageLookupByLibrary.simpleMessage("Industry"),
        "investmentAmount":
            MessageLookupByLibrary.simpleMessage("Investment Amount"),
        "investmentPeriod":
            MessageLookupByLibrary.simpleMessage("Investment Period"),
        "investmentPreferences":
            MessageLookupByLibrary.simpleMessage("Investment Preferences"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "marketCap": MessageLookupByLibrary.simpleMessage("Market Cap"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "noteOnPaymentDetails": MessageLookupByLibrary.simpleMessage(
            "Note:\nWe will work with your bank in order to idenfity your bank account details (account name, bank code, account number). However, we may require additional details from you for transaction verification purposes."),
        "notificationSetting":
            MessageLookupByLibrary.simpleMessage("Notification Setting"),
        "notificationSettings":
            MessageLookupByLibrary.simpleMessage("Notification Settings"),
        "officeHours":
            MessageLookupByLibrary.simpleMessage("09:00-18:00 (HKT)"),
        "officeHoursLabel":
            MessageLookupByLibrary.simpleMessage("Office Hours"),
        "orderExpired": MessageLookupByLibrary.simpleMessage("Order Expired"),
        "orderRollover": MessageLookupByLibrary.simpleMessage("Order Rollover"),
        "orderStarted": MessageLookupByLibrary.simpleMessage("Order Started"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "paymentDetails":
            MessageLookupByLibrary.simpleMessage("Payment Details"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "portfolioBuyingPower": m4,
        "portfolioBuyingPowerToolTip": MessageLookupByLibrary.simpleMessage(
            "Your Buying Power represents the amount of cash that you can use to buy Botstocks. Your Withdrawable Balance and your Buying Power may not always be the same. For example, starting a Botstock will reduce your Buying Power and the amount value will be added to Total Botstock Values. When the Botstock is expired or terminated, the amount will be added to Buying Power and after T + 2, the amount will be also added to Withdrawable Balance. This is called ‘settlement’."),
        "portfolioCurrentPrice": m5,
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("CANCEL BOTSTOCK"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("END BOTSTOCK"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("ROLLOVER BOTSTOCK"),
        "portfolioDetailChartCaption": m6,
        "portfolioDetailChartEmptyMessage":
            MessageLookupByLibrary.simpleMessage(
                "Performance data will be available once the Botstock starts"),
        "portfolioDetailExpiredAt": m7,
        "portfolioDetailExpiredIn": m8,
        "portfolioDetailKeyInfoAvgLoss":
            MessageLookupByLibrary.simpleMessage("Avg. Loss"),
        "portfolioDetailKeyInfoAvgPeriod":
            MessageLookupByLibrary.simpleMessage("Avg. Period (Days)"),
        "portfolioDetailKeyInfoAvgReturn":
            MessageLookupByLibrary.simpleMessage("Avg. Return"),
        "portfolioDetailKeyInfoBotStockNumberOfRollover":
            MessageLookupByLibrary.simpleMessage("Number of Rollovers"),
        "portfolioDetailKeyInfoBotStockStatus":
            MessageLookupByLibrary.simpleMessage("Botstock Status"),
        "portfolioDetailKeyInfoDaysTillExpiry":
            MessageLookupByLibrary.simpleMessage("Days Till Expiry"),
        "portfolioDetailKeyInfoEndTime":
            MessageLookupByLibrary.simpleMessage("End Time"),
        "portfolioDetailKeyInfoEstimatedMaxLoss":
            MessageLookupByLibrary.simpleMessage("Est. Max Loss %"),
        "portfolioDetailKeyInfoEstimatedMaxProfit":
            MessageLookupByLibrary.simpleMessage("Est, Max Profit %"),
        "portfolioDetailKeyInfoEstimatedStopLoss":
            MessageLookupByLibrary.simpleMessage("Est. Stop Loss %"),
        "portfolioDetailKeyInfoEstimatedTakeProfit":
            MessageLookupByLibrary.simpleMessage("Est. Take Profit %"),
        "portfolioDetailKeyInfoStartTime":
            MessageLookupByLibrary.simpleMessage("Start Time"),
        "portfolioDetailKeyInfoTitle":
            MessageLookupByLibrary.simpleMessage("Key Info"),
        "portfolioDetailPerformanceBotAssetsInStock":
            MessageLookupByLibrary.simpleMessage("% of Bot Assets in Stock"),
        "portfolioDetailPerformanceBotStockValues":
            MessageLookupByLibrary.simpleMessage("Botstock Values (HKD)"),
        "portfolioDetailPerformanceCash":
            MessageLookupByLibrary.simpleMessage("Cash (HKD)"),
        "portfolioDetailPerformanceInvestmentAmount":
            MessageLookupByLibrary.simpleMessage("Inv. Amount (HKD)"),
        "portfolioDetailPerformanceNumberOfShares":
            MessageLookupByLibrary.simpleMessage("No. of Shares"),
        "portfolioDetailPerformanceNumberOfSharesTooltip":
            MessageLookupByLibrary.simpleMessage(
                "Indicates how many shares of a company are currently owned by you."),
        "portfolioDetailPerformanceStockValues":
            MessageLookupByLibrary.simpleMessage("Stock Values (HKD)"),
        "portfolioDetailPerformanceTitle":
            MessageLookupByLibrary.simpleMessage("Performance"),
        "portfolioDetailPerformanceTotalPL":
            MessageLookupByLibrary.simpleMessage("Total P&L"),
        "portfolioTotalBotStock": m9,
        "portfolioTotalPL": MessageLookupByLibrary.simpleMessage("Total P/L"),
        "portfolioTotalValue":
            MessageLookupByLibrary.simpleMessage("Total Portfolio Value"),
        "portfolioWithdrawableAmount": m10,
        "portfolioYourBotStock":
            MessageLookupByLibrary.simpleMessage("Your Botstocks"),
        "prevClose": MessageLookupByLibrary.simpleMessage("Prev Close"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "pushNotification":
            MessageLookupByLibrary.simpleMessage("Push-Notification"),
        "sectors": MessageLookupByLibrary.simpleMessage("Sector(s)"),
        "shares": MessageLookupByLibrary.simpleMessage("Shares"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sign out ?"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "subscription": MessageLookupByLibrary.simpleMessage("Subscription"),
        "summary": MessageLookupByLibrary.simpleMessage("Summary"),
        "terminateAccount":
            MessageLookupByLibrary.simpleMessage("Terminate Account"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Terms and Conditions"),
        "tooltipBotDetailsEstMaxLoss": MessageLookupByLibrary.simpleMessage(
            "This is the estimated maximum loss % level for the Bot strategy. The Bot will try to limit losses to this % level. This is an estimated level."),
        "tooltipBotDetailsEstMaxProfit": MessageLookupByLibrary.simpleMessage(
            "This is the estimated maximum target profit % level for the Bot strategy. The Bot will try to close the trade (sell stocks) and capture profits when profits reach this % level. This is an estimated level."),
        "tooltipBotDetailsEstStopLoss": MessageLookupByLibrary.simpleMessage(
            "The return % where the Plank Bot will sell try and limit losses. The Plank Bot will try to close the trade (sell stocks) when the stock reaches this level below your initial investment level."),
        "tooltipBotDetailsEstTakeProfit": MessageLookupByLibrary.simpleMessage(
            "The return % where the Plank Bot will sell to try and capture profits. The Plank Bot will try to close the trade (sell stocks) when the stock reaches this level above your initial investment level."),
        "tooltipBotDetailsInvestmentPeriod": MessageLookupByLibrary.simpleMessage(
            "The duration you set for Botstock where the Bot will automatically buy and sell."),
        "tooltipBotDetailsStartDate": MessageLookupByLibrary.simpleMessage(
            "Lora’s date to start the Botstocks"),
        "totalPnlIs": MessageLookupByLibrary.simpleMessage("Total P/L is"),
        "tradeFee": MessageLookupByLibrary.simpleMessage("Trade Fee"),
        "transactionHistory":
            MessageLookupByLibrary.simpleMessage("Transaction History"),
        "transactionHistoryTabAll": MessageLookupByLibrary.simpleMessage("All"),
        "transactionHistoryTabOrders":
            MessageLookupByLibrary.simpleMessage("Orders"),
        "transactionHistoryTabTransfer":
            MessageLookupByLibrary.simpleMessage("Transfer"),
        "transactionHistoryTitle":
            MessageLookupByLibrary.simpleMessage("Transaction History"),
        "transactionHistoryToday":
            MessageLookupByLibrary.simpleMessage("Today"),
        "userId": MessageLookupByLibrary.simpleMessage("User ID"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "website": MessageLookupByLibrary.simpleMessage("Website"),
        "yourBankAccount":
            MessageLookupByLibrary.simpleMessage("Your Bank Account"),
        "yourBankAccountIsUnderReview": m11
      };
}
