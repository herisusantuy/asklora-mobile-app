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

  static String m4(emailAddress) =>
      "We’ve sent an email to\n ${emailAddress}\n\nPlease use your phone to click on the activation link!";

  static String m5(botName, botSymbol, dateTime) =>
      "${botName} ${botSymbol} will end at ${dateTime}";

  static String m6(minute) => "~${minute} min";

  static String m7(currency) => "Buying Power (${currency})";

  static String m8(currency) => "Current Price ${currency}";

  static String m9(bot, startDate, endDate, duration) =>
      "Past ${duration} performance of ${bot}  (${startDate} - ${endDate})";

  static String m10(dateTime) => "Expired at ${dateTime}";

  static String m11(dateTime) => "Expired in ${dateTime} days";

  static String m12(currency) => "Total Botstock Values (${currency})";

  static String m13(currency) => "Withdrawable Balance (${currency})";

  static String m14(botName, botSymbol, dateTime) =>
      "${botName} ${botSymbol} will start at ${dateTime}";

  static String m15(dateTime) =>
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
        "backToAccountSettings":
            MessageLookupByLibrary.simpleMessage("Back to account settings"),
        "bankAccountNumber":
            MessageLookupByLibrary.simpleMessage("Bank Account Number"),
        "bestSuitedFor":
            MessageLookupByLibrary.simpleMessage("Best Suited For"),
        "botDuration": MessageLookupByLibrary.simpleMessage("Bot Duration"),
        "botManagementFee":
            MessageLookupByLibrary.simpleMessage("Bot Management Fee"),
        "botStockId": MessageLookupByLibrary.simpleMessage("Botstock ID"),
        "botTradeBottomSheetAccountNotYetApprovedSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "Est. to be approved by 2 working days."),
        "botTradeBottomSheetAccountNotYetApprovedTitle":
            MessageLookupByLibrary.simpleMessage(
                "You can trade after your account is approved."),
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
            MessageLookupByLibrary.simpleMessage("Deposit To Start Trading"),
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle":
            MessageLookupByLibrary.simpleMessage(
                "Your free Botstock has been added to your portfolio!"),
        "botTradeBottomSheetInsufficientBalanceSubTitle": m2,
        "botTradeBottomSheetInsufficientBalanceTitle":
            MessageLookupByLibrary.simpleMessage(
                "You are running out of money! Fund your account now."),
        "botTradeBottomSheetRolloverConfirmationButton":
            MessageLookupByLibrary.simpleMessage("Confirm Rollover"),
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
        "buttonAlreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already Have An Account?"),
        "buttonBack": MessageLookupByLibrary.simpleMessage("Back"),
        "buttonBackToHome":
            MessageLookupByLibrary.simpleMessage("Back To Home"),
        "buttonBackToPortfolio":
            MessageLookupByLibrary.simpleMessage("Back To Portfolio"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "buttonCancelTrade":
            MessageLookupByLibrary.simpleMessage("Cancel Trade"),
        "buttonChangeInvestmentStyle":
            MessageLookupByLibrary.simpleMessage("Change Investment Style"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "buttonContactCustomerService":
            MessageLookupByLibrary.simpleMessage("Contact Customer Service"),
        "buttonContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "buttonDeposit": MessageLookupByLibrary.simpleMessage("Deposit"),
        "buttonDone": MessageLookupByLibrary.simpleMessage("Done"),
        "buttonForgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget Password?"),
        "buttonHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Have An Account?"),
        "buttonLetsBegin": MessageLookupByLibrary.simpleMessage("Let\'s Begin"),
        "buttonMaybeLater": MessageLookupByLibrary.simpleMessage("Maybe Later"),
        "buttonNext": MessageLookupByLibrary.simpleMessage("Next"),
        "buttonNotNow": MessageLookupByLibrary.simpleMessage("Not Now"),
        "buttonReloadPage": MessageLookupByLibrary.simpleMessage("Reload Page"),
        "buttonResendActivationLink":
            MessageLookupByLibrary.simpleMessage("Resend Activation Link"),
        "buttonSave": MessageLookupByLibrary.simpleMessage("Save"),
        "buttonSignOut": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "buttonSignUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "buttonSignUpAgain":
            MessageLookupByLibrary.simpleMessage("Sign Up Again"),
        "buttonViewTransactionHistory":
            MessageLookupByLibrary.simpleMessage("View Transaction History"),
        "buttonWithdraw": MessageLookupByLibrary.simpleMessage("Withdraw"),
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
        "checkBotStockDetails":
            MessageLookupByLibrary.simpleMessage("Check Botstock Details"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmAndContinue":
            MessageLookupByLibrary.simpleMessage("Confirm & Continue"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "confirmTrade": MessageLookupByLibrary.simpleMessage("Confirm Trade"),
        "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "continueAccountOpening":
            MessageLookupByLibrary.simpleMessage("Continue Account Opening"),
        "corePlan": MessageLookupByLibrary.simpleMessage("Core Plan"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Create An Account"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("Current Price"),
        "customerService":
            MessageLookupByLibrary.simpleMessage("Customer Service"),
        "dateJoined": MessageLookupByLibrary.simpleMessage("Date Joined"),
        "defineInvestmentStyle":
            MessageLookupByLibrary.simpleMessage("Define Investment Style"),
        "deposit": MessageLookupByLibrary.simpleMessage("Deposit"),
        "depositAmount": MessageLookupByLibrary.simpleMessage("Deposit Amount"),
        "depositRequestSubmittedSubTitleFirstTime":
            MessageLookupByLibrary.simpleMessage(
                "Your account opening application and initial deposit will be reviewed within 1-2 working days. You will be informed via email and app notification once your account is approved."),
        "depositRequestSubmittedSubTitleReturn":
            MessageLookupByLibrary.simpleMessage(
                "Your deposit request is submitted. We’ll let you know via email and app notification as soon as your deposit arrives."),
        "depositRequestSubmittedTitle":
            MessageLookupByLibrary.simpleMessage("Deposit Request Submitted"),
        "doAnyOfTheFollowingApply": MessageLookupByLibrary.simpleMessage(
            "Do any of the following apply to you or a member of your immediate family ?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailActivationFailedTitle": MessageLookupByLibrary.simpleMessage(
            "Sorry! You were a bit late, your request has timed out. \n\nLet’s try and activate your account again!"),
        "emailActivationSuccessTitle": m4,
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "employees": MessageLookupByLibrary.simpleMessage("Employees"),
        "endBotStockAcknowledgement": m5,
        "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
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
        "errorWithdrawalUnavailableSubTitle": MessageLookupByLibrary.simpleMessage(
            "You don’t have any funds to withdraw. You haven’t deposited yet or your deposit might still be processing "),
        "errorWithdrawalUnavailableTitle":
            MessageLookupByLibrary.simpleMessage("Withdrawal Unavailable"),
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
        "existingPassword":
            MessageLookupByLibrary.simpleMessage("Existing Password"),
        "expiresAt": MessageLookupByLibrary.simpleMessage("Expires at"),
        "filledPrice": MessageLookupByLibrary.simpleMessage("Filled Price"),
        "founded": MessageLookupByLibrary.simpleMessage("Founded"),
        "free": MessageLookupByLibrary.simpleMessage("Free"),
        "freeTrial": MessageLookupByLibrary.simpleMessage("Free Trial"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "getHelp": MessageLookupByLibrary.simpleMessage("Get Help"),
        "getTheFirstBotstockForFree": MessageLookupByLibrary.simpleMessage(
            "Get the First Botstock for Free"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got It"),
        "greetingScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "Let’s start the training with\nsimple questions!\n\nRemember - to lose patience\nis to lose the battle!"),
        "greetingScreenTitle": MessageLookupByLibrary.simpleMessage(
            "Alright! Are you ready for the FinFit journey? "),
        "headquarters": MessageLookupByLibrary.simpleMessage("Headquarters"),
        "howItWorks": MessageLookupByLibrary.simpleMessage("How It Works"),
        "iAmADirector": MessageLookupByLibrary.simpleMessage(
            "I am a director/employee/licensed person of a licensed corporation registered with the HK Securities and Futures Commission. (Excluding Lora Advisors Limited)"),
        "iAmAFamily": MessageLookupByLibrary.simpleMessage(
            "I am a family member or relative of a senior political figure."),
        "iAmASeniorExecutive": MessageLookupByLibrary.simpleMessage(
            "I am a senior executive at or a 10% or greater shareholder of a publicly traded company."),
        "iAmASeniorPolitical": MessageLookupByLibrary.simpleMessage(
            "I am a senior political figure."),
        "inApp": MessageLookupByLibrary.simpleMessage("In-App"),
        "industry": MessageLookupByLibrary.simpleMessage("Industry"),
        "introduceBotPlank":
            MessageLookupByLibrary.simpleMessage("Introduce Bot - Plank"),
        "introduceBotPullup":
            MessageLookupByLibrary.simpleMessage("Introduce Bot - Pullup"),
        "introduceBotSquat":
            MessageLookupByLibrary.simpleMessage("Introduce Bot - Squat"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Enter valid password"),
        "investmentAmount":
            MessageLookupByLibrary.simpleMessage("Investment Amount"),
        "investmentPeriod":
            MessageLookupByLibrary.simpleMessage("Investment Period"),
        "investmentPreferences":
            MessageLookupByLibrary.simpleMessage("Investment Preferences"),
        "investmentStyleWelcomeTitle": MessageLookupByLibrary.simpleMessage(
            "Let’s get to the heart of personalisation, it’s time to define your investment style."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "learnBotstockManagement":
            MessageLookupByLibrary.simpleMessage("Learn Botstock Management"),
        "manageYourBotstock":
            MessageLookupByLibrary.simpleMessage("Manage Your Botstock"),
        "marketCap": MessageLookupByLibrary.simpleMessage("Market Cap"),
        "marketPrice": MessageLookupByLibrary.simpleMessage("Market Price"),
        "masterAiTrading":
            MessageLookupByLibrary.simpleMessage("Master AI Trading"),
        "milestones": MessageLookupByLibrary.simpleMessage("Milestones"),
        "min": m6,
        "needHelp": MessageLookupByLibrary.simpleMessage("Need help?"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "no": MessageLookupByLibrary.simpleMessage(" No"),
        "noTransactions":
            MessageLookupByLibrary.simpleMessage("No Transactions"),
        "noTransactionsYet": MessageLookupByLibrary.simpleMessage(
            "Looks like you haven’t made \nany transactions yet!"),
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
        "ok": MessageLookupByLibrary.simpleMessage("OK!"),
        "oldPasswordSameWithNewPasswordError":
            MessageLookupByLibrary.simpleMessage(
                "Your new password cannot be the same as your old password"),
        "openInvestmentAccount":
            MessageLookupByLibrary.simpleMessage("Open Investment Account"),
        "orderExpired": MessageLookupByLibrary.simpleMessage("Order Expired"),
        "orderRollover": MessageLookupByLibrary.simpleMessage("Order Rollover"),
        "orderStarted": MessageLookupByLibrary.simpleMessage("Order Started"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordChangeSuccess":
            MessageLookupByLibrary.simpleMessage("Password Change Success"),
        "passwordDoesNotMatch": MessageLookupByLibrary.simpleMessage(
            "Your password does not match."),
        "payDepositToStartRealTrade": MessageLookupByLibrary.simpleMessage(
            "Pay Deposit to Start Real Trade"),
        "paymentDetails":
            MessageLookupByLibrary.simpleMessage("Payment Details"),
        "performance": MessageLookupByLibrary.simpleMessage("Performance"),
        "personalisation":
            MessageLookupByLibrary.simpleMessage("Personalisation"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "portfolioBuyingPower": m7,
        "portfolioBuyingPowerToolTip": MessageLookupByLibrary.simpleMessage(
            "Your Buying Power represents the amount of cash that you can use to buy Botstocks. Your Withdrawable Balance and your Buying Power may not always be the same. For example, starting a Botstock will reduce your Buying Power and the amount value will be added to Total Botstock Values. When the Botstock is expired or terminated, the amount will be added to Buying Power and after T + 2, the amount will be also added to Withdrawable Balance. This is called ‘settlement’."),
        "portfolioCurrentPrice": m8,
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("Cancel Botstock"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("End Botstock"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("Rollover Botstock"),
        "portfolioDetailChartCaption": m9,
        "portfolioDetailChartEmptyMessage":
            MessageLookupByLibrary.simpleMessage(
                "Performance data will be available once the Botstock starts"),
        "portfolioDetailExpiredAt": m10,
        "portfolioDetailExpiredIn": m11,
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
        "portfolioPopUpContinueAccountOpeningSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "You still need to complete your account opening until you can start trading. "),
        "portfolioPopUpContinueAccountOpeningTitle":
            MessageLookupByLibrary.simpleMessage("Continue Account Opening"),
        "portfolioPopUpCreateAnAccountSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "You can manage all your investments here after you start trading. Create an account and start trading."),
        "portfolioPopUpCreateAnAccountTitle":
            MessageLookupByLibrary.simpleMessage(
                "Create an Account and Start Trading!"),
        "portfolioPopUpDefineInvestmentSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "Looks like you haven’t defined your Investment Style yet. Let’s go and see what kind of Botstocks suit you best!"),
        "portfolioPopUpDefineInvestmentTitle":
            MessageLookupByLibrary.simpleMessage(
                "Define Your Investment Style"),
        "portfolioPopUpFundAccountSubTitle": MessageLookupByLibrary.simpleMessage(
            "Looks like you haven’t funded your account yet. Deposit HKD 10,000 to activate your account."),
        "portfolioPopUpFundAccountTitle":
            MessageLookupByLibrary.simpleMessage("Fund your account"),
        "portfolioPopUpNoTradingHasStartedTitle":
            MessageLookupByLibrary.simpleMessage("No trading has started!"),
        "portfolioPopUpNoTradingHasStartedtSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "You can manage all your investments here after you start trading. "),
        "portfolioPopUpPendingReviewSubTitle": MessageLookupByLibrary.simpleMessage(
            "You can manage all your investments here after your account has been opened!"),
        "portfolioPopUpPendingReviewTitle":
            MessageLookupByLibrary.simpleMessage(
                "Your Account is Pending Review"),
        "portfolioPopUpRedeemYourBotstockSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "Looks like you haven’t claimed your free Botstock yet. Let’s get trading right away!"),
        "portfolioPopUpRedeemYourBotstockTitle":
            MessageLookupByLibrary.simpleMessage("Redeem Your Free Botstock"),
        "portfolioTotalBotStock": m12,
        "portfolioTotalPL": MessageLookupByLibrary.simpleMessage("Total P/L"),
        "portfolioTotalValue":
            MessageLookupByLibrary.simpleMessage("Total Portfolio Value"),
        "portfolioWithdrawableAmount": m13,
        "portfolioYourBotStock":
            MessageLookupByLibrary.simpleMessage("Your Botstocks"),
        "pressBackAgain": MessageLookupByLibrary.simpleMessage(
            "Press back again to exit Asklora"),
        "prevClose": MessageLookupByLibrary.simpleMessage("Prev Close"),
        "privacyEvaluation":
            MessageLookupByLibrary.simpleMessage("Privacy Evaluation"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "pushNotification":
            MessageLookupByLibrary.simpleMessage("Push-Notification"),
        "redeemYourBotstockNow":
            MessageLookupByLibrary.simpleMessage("Redeem Your Botstock Now"),
        "relearn": MessageLookupByLibrary.simpleMessage("relearn"),
        "retakeInvestmentStyle":
            MessageLookupByLibrary.simpleMessage("Retake Investment Style"),
        "rolloverBotStockAcknowledgement": m14,
        "saveForLater": MessageLookupByLibrary.simpleMessage("Save For Later"),
        "sectors": MessageLookupByLibrary.simpleMessage("Sector(s)"),
        "setUpFinancialProfile":
            MessageLookupByLibrary.simpleMessage("Set Up Financial Profile"),
        "shares": MessageLookupByLibrary.simpleMessage("Shares"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sign out ?"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage(
            "Start your new investing journey with Lora - \nYour FinFit Coach"),
        "startABotstock":
            MessageLookupByLibrary.simpleMessage("Start A Botstock"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "startInvesting":
            MessageLookupByLibrary.simpleMessage("Start Investing"),
        "startsAt": MessageLookupByLibrary.simpleMessage("Starts at"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "subscription": MessageLookupByLibrary.simpleMessage("Subscription"),
        "summary": MessageLookupByLibrary.simpleMessage("Summary"),
        "suspendedScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "Your account has been suspended and is pending investigation from us. If you have any questions about your account, please contact our customer service team."),
        "suspendedScreenTitle":
            MessageLookupByLibrary.simpleMessage("Account Suspended"),
        "terminateAccount":
            MessageLookupByLibrary.simpleMessage("Terminate Account"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Terms and Conditions"),
        "timeCompleted": MessageLookupByLibrary.simpleMessage("Time Completed"),
        "timeRequested": MessageLookupByLibrary.simpleMessage("Time Requested"),
        "to": MessageLookupByLibrary.simpleMessage("To"),
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
        "totalAmount": MessageLookupByLibrary.simpleMessage("Total amount"),
        "totalPnlIs": MessageLookupByLibrary.simpleMessage("Total P/L is"),
        "trade": MessageLookupByLibrary.simpleMessage("Trade"),
        "tradeCancelledSubtitle": MessageLookupByLibrary.simpleMessage(
            "The trade has been cancelled and your investment amount has been returned to your account"),
        "tradeCancelledTitle":
            MessageLookupByLibrary.simpleMessage("Trade Cancelled"),
        "tradeFee": MessageLookupByLibrary.simpleMessage("Trade Fee"),
        "tradeRequestReceived":
            MessageLookupByLibrary.simpleMessage("Trade Request Received"),
        "tradeSummary": MessageLookupByLibrary.simpleMessage("Trade Summary"),
        "tradeWithANewBotstock":
            MessageLookupByLibrary.simpleMessage("Trade with a New Botstock"),
        "tradeWithBots":
            MessageLookupByLibrary.simpleMessage("Trade with Bots"),
        "tradeWithYourFirstBotstock": MessageLookupByLibrary.simpleMessage(
            "Trade with Your First Botstock"),
        "transactionFee":
            MessageLookupByLibrary.simpleMessage("Transaction fee"),
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
        "transferTo": MessageLookupByLibrary.simpleMessage("Transfer to"),
        "unableToProcessDepositSubTitle": MessageLookupByLibrary.simpleMessage(
            "We’re having some trouble processing your deposit request. Please try again"),
        "unableToProcessDepositTitle":
            MessageLookupByLibrary.simpleMessage("Unable to Process Deposit"),
        "unableToProcessWithdrawalSubTitle": MessageLookupByLibrary.simpleMessage(
            "We’re having some trouble processing your withdrawal request. Please try again"),
        "unableToProcessWithdrawalTitle": MessageLookupByLibrary.simpleMessage(
            "Unable to Process Withdrawal"),
        "userId": MessageLookupByLibrary.simpleMessage("User ID"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "viewDepositGuide":
            MessageLookupByLibrary.simpleMessage("View Deposit Guide"),
        "website": MessageLookupByLibrary.simpleMessage("Website"),
        "welcomeScreenFirstBenefit": MessageLookupByLibrary.simpleMessage(
            "Guidance from your own personal AI"),
        "welcomeScreenSecondBenefit":
            MessageLookupByLibrary.simpleMessage("Personalised Experience"),
        "welcomeScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "Say Goodbye to bad investing habits and embrace your new AI assistant, Asklora!"),
        "welcomeScreenThirdBenefit": MessageLookupByLibrary.simpleMessage(
            "Automated trading strategies"),
        "welcomeScreenTitle": MessageLookupByLibrary.simpleMessage(
            "Get your Investments in Shape"),
        "withdraw": MessageLookupByLibrary.simpleMessage("Withdraw"),
        "withdrawalAmount":
            MessageLookupByLibrary.simpleMessage("Withdrawal Amount"),
        "withdrawalRequestSubmittedSubTitle": MessageLookupByLibrary.simpleMessage(
            "You will be informed via email and app notification as soon as the funds are paid to your account."),
        "withdrawalRequestSubmittedTitle": MessageLookupByLibrary.simpleMessage(
            "Your Withdrawal request is submitted."),
        "withdrawalWorkingDays": MessageLookupByLibrary.simpleMessage(
            "Your withdrawal can take up to 2 working days."),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yourBankAccount":
            MessageLookupByLibrary.simpleMessage("Your Bank Account"),
        "yourBankAccountIsUnderReview": m15,
        "yourPasswordHasBeenChanged": MessageLookupByLibrary.simpleMessage(
            "Your password has been changed"),
        "yourPaymentInformationIsUnderReview": MessageLookupByLibrary.simpleMessage(
            "Your payment information is under review. Your bank account details will be shown here once your account is approved. please note it can take up to 2 working days for the approval process.")
      };
}
