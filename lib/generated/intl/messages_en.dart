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

  static String m0(name) => "Just one more step to AI\ngreatness, ${name}!";

  static String m1(name) => "You are making great\nprogress, ${name}!";

  static String m2(availableAmount, minimumAmount) =>
      "You have ${availableAmount}, the minimum investment amount is ${minimumAmount}.";

  static String m3(amount) =>
      "The investment amount and Bot management fee (HKD${amount}) will be returned to your account.";

  static String m4(botInformation) =>
      "You can end the Botstock now, and all stocks will be sold. Trading of ${botInformation} will stop.";

  static String m5(minimumAmount) =>
      "The minimum investment amount is ${minimumAmount} per trade.";

  static String m6(expiryTime) => "The new expiry date is ${expiryTime}";

  static String m7(amount) =>
      "Due to regulatory requirements, you need to deposit at least HK\$${amount} if you want to change bank account";

  static String m8(emailAddress) =>
      "We\'ve sent an email to\n ${emailAddress}\n\nPlease use your phone to click on the activation link!";

  static String m9(botName, botSymbol, dateTime) =>
      "${botName} ${botSymbol} will end at ${dateTime}";

  static String m10(time) =>
      "Current Exchange Rate: HKD 1 = USD 0.137 (at HKT ${time})";

  static String m11(minDeposit) =>
      "Copy Asklora\'s bank details and transfer no less than HK\$${minDeposit} from your bank account via FPS or Wire transfer.";

  static String m12(minute) => "~${minute} min";

  static String m13(phoneNumber) =>
      "We\'ve sent you a code via SMS to verify your phone number (+852 ${phoneNumber}). Please enter the OTP code below.";

  static String m14(currency) => "Buying Power (${currency})";

  static String m15(bot, startDate, endDate, duration) =>
      "Past ${duration} performance of ${bot}  (${startDate} - ${endDate})";

  static String m16(dateTime) => "Expired at ${dateTime}";

  static String m17(dateTime) => "Expired in ${dateTime} days";

  static String m18(currency) => "Total Botstock Values (${currency})";

  static String m19(currency) => "Withdrawable Balance (${currency})";

  static String m20(seconds) => "RE-SEND IN ${seconds}S";

  static String m21(opennessScore, neuroticismScore, extrovertScore) =>
      "Based on your answer, ${opennessScore} and ${neuroticismScore}\n\n${extrovertScore}";

  static String m22(botName, botSymbol, dateTime) =>
      "${botName} ${botSymbol} will start at ${dateTime}";

  static String m23(minDeposit) =>
      "Transfer at least HK\$${minDeposit} to Asklora\'s bank account. Any initial deposit less than HK\$${minDeposit} will be rejected and fees will be charged.";

  static String m24(time, date) => "Updated at ${time} HKT, ${date}";

  static String m25(minDeposit) =>
      "We will take information collected from your bank via API or submitted remittance advice to determine your designated bank account. All future deposits and withdrawals are accepted ONLY through this designated bank account. You may change the designated bank account but you will need to go through the same verification by way of a minimum HK\$ ${minDeposit} bank transfer is completed.";

  static String m26(dateTime) =>
      "Your Bank Account is under review and will be complete by ${dateTime}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutAsklora": MessageLookupByLibrary.simpleMessage("About Asklora"),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "accountIsNotActive": MessageLookupByLibrary.simpleMessage(
            "Your account is not active yet."),
        "accountName": MessageLookupByLibrary.simpleMessage("Account Name"),
        "accountNumber": MessageLookupByLibrary.simpleMessage("Account Number"),
        "accountOpeningAndDeposit": MessageLookupByLibrary.simpleMessage(
            "Account opening and deposit are the last few steps before investing."),
        "accountSettings":
            MessageLookupByLibrary.simpleMessage("Account Settings"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "activities": MessageLookupByLibrary.simpleMessage("Activities"),
        "addressProof": MessageLookupByLibrary.simpleMessage("Address Proof"),
        "afterPayDepositHeaderTitle": MessageLookupByLibrary.simpleMessage(
            "Your investment account will be ready soon!"),
        "agree": MessageLookupByLibrary.simpleMessage("Agree"),
        "agreements": MessageLookupByLibrary.simpleMessage("Agreements"),
        "aiIsqWelcomeSubTitle": MessageLookupByLibrary.simpleMessage(
            "Let\'s see what kind of stocks you prefer"),
        "aiIsqWelcomeTitle": MessageLookupByLibrary.simpleMessage(
            "It\'s time to find out your investment preferences"),
        "allSettings": MessageLookupByLibrary.simpleMessage("All Settings"),
        "almostFinished":
            MessageLookupByLibrary.simpleMessage("Almost finished!"),
        "askMeAnythingRelatedToFinance": MessageLookupByLibrary.simpleMessage(
            "Ask me anything related to finance"),
        "askNameScreenPlaceholder": MessageLookupByLibrary.simpleMessage(
            "I\'m Lora, your personal AI assistant.\n\nGet ready to crush your investment goals!\nWhat\'s your name? "),
        "askNameScreenTextFieldHint":
            MessageLookupByLibrary.simpleMessage("Your Name"),
        "askloraWireDetails":
            MessageLookupByLibrary.simpleMessage("Asklora\'s Wire Details"),
        "askloraYouUltimateFinancialAdvisor":
            MessageLookupByLibrary.simpleMessage(
                "Asklora.\n Your ultimate\nfinancial advisor"),
        "atLeast1Lowercase":
            MessageLookupByLibrary.simpleMessage("at least 1 lowercase letter"),
        "atLeast1Number":
            MessageLookupByLibrary.simpleMessage("at least 1 number"),
        "atLeast1Uppercase": MessageLookupByLibrary.simpleMessage(
            "at least 1 upper case letter"),
        "backToAccountSettings":
            MessageLookupByLibrary.simpleMessage("Back to account settings"),
        "backToLogin": MessageLookupByLibrary.simpleMessage("Back to login"),
        "bankAccountNumber":
            MessageLookupByLibrary.simpleMessage("Bank Account Number"),
        "bankName": MessageLookupByLibrary.simpleMessage("Bank Name"),
        "bankNumber": MessageLookupByLibrary.simpleMessage("Bank Number"),
        "beforeDepositHeaderTitle": m0,
        "beforeKYCHeaderTitle": m1,
        "bestSuitedFor":
            MessageLookupByLibrary.simpleMessage("Best Suited For"),
        "botDuration": MessageLookupByLibrary.simpleMessage("Bot Duration"),
        "botManagementFee":
            MessageLookupByLibrary.simpleMessage("Bot Management Fee"),
        "botRecommendationScreenTitle": MessageLookupByLibrary.simpleMessage(
            "Investments tailored  for you"),
        "botStockId": MessageLookupByLibrary.simpleMessage("Botstock ID"),
        "botTradeBottomSheetAccountNotYetApprovedSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "Est. to be approved by 2 working days."),
        "botTradeBottomSheetAccountNotYetApprovedTitle":
            MessageLookupByLibrary.simpleMessage(
                "You can trade after your account is approved."),
        "botTradeBottomSheetAmountMinimum": m2,
        "botTradeBottomSheetAmountTitle":
            MessageLookupByLibrary.simpleMessage("How much are you investing?"),
        "botTradeBottomSheetCancelBotStockConfirmationTitle": m3,
        "botTradeBottomSheetEndBotStockConfirmationSubTitle":
            MessageLookupByLibrary.simpleMessage(
                "The total Botstock value will be returned to your \naccount after the next community order."),
        "botTradeBottomSheetEndBotStockConfirmationTitle": m4,
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle":
            MessageLookupByLibrary.simpleMessage("Deposit To Start Trading"),
        "botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle":
            MessageLookupByLibrary.simpleMessage(
                "Your free Botstock has been added to your portfolio!"),
        "botTradeBottomSheetInsufficientBalanceSubTitle": m5,
        "botTradeBottomSheetInsufficientBalanceTitle":
            MessageLookupByLibrary.simpleMessage(
                "You are running out of money! Fund your account now."),
        "botTradeBottomSheetRolloverConfirmationButton":
            MessageLookupByLibrary.simpleMessage("Confirm Rollover"),
        "botTradeBottomSheetRolloverConfirmationSubTitle": m6,
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
        "buttonSubmit": MessageLookupByLibrary.simpleMessage("Submit"),
        "buttonSure": MessageLookupByLibrary.simpleMessage("Sure"),
        "buttonTryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "buttonVerify": MessageLookupByLibrary.simpleMessage("Verify"),
        "buttonViewDetails":
            MessageLookupByLibrary.simpleMessage("View Details"),
        "buttonViewTransactionHistory":
            MessageLookupByLibrary.simpleMessage("View Transaction History"),
        "buttonWithdraw": MessageLookupByLibrary.simpleMessage("Withdraw"),
        "buy": MessageLookupByLibrary.simpleMessage("Buy"),
        "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "cannotRememberEmailAddress": MessageLookupByLibrary.simpleMessage(
            "Can’t remember your email address?\nEmail us at cs@asklora.ai"),
        "cantRememberYourEmail": MessageLookupByLibrary.simpleMessage(
            "Can\'t remember your email address?\nEmail us at cs@asklora.ai"),
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
        "checkBackLater": MessageLookupByLibrary.simpleMessage(
            "Check back later to see if\nthere are any new\ntransactions!"),
        "checkBotStockDetails":
            MessageLookupByLibrary.simpleMessage("Check Botstock Details"),
        "companyAddress":
            MessageLookupByLibrary.simpleMessage("Company Address"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmAndContinue":
            MessageLookupByLibrary.simpleMessage("Confirm And Continue"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "confirmTrade": MessageLookupByLibrary.simpleMessage("Confirm Trade"),
        "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "continueAccountOpening":
            MessageLookupByLibrary.simpleMessage("Continue Account Opening"),
        "copyAskloraBankDetails": MessageLookupByLibrary.simpleMessage(
            "Copy Asklora\'s bank details and transfer from your bank account via FPS or Wire transfer."),
        "corePlan": MessageLookupByLibrary.simpleMessage("Core Plan"),
        "countryOfBirth":
            MessageLookupByLibrary.simpleMessage("Country of Birth"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Create An Account"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("Current Price"),
        "customerService":
            MessageLookupByLibrary.simpleMessage("Customer Service"),
        "dateJoined": MessageLookupByLibrary.simpleMessage("Date Joined"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "defineAgain": MessageLookupByLibrary.simpleMessage("Define again"),
        "defineInvestmentStyle":
            MessageLookupByLibrary.simpleMessage("Define Investment Style"),
        "deposit": MessageLookupByLibrary.simpleMessage("Deposit"),
        "depositAmount": MessageLookupByLibrary.simpleMessage("Deposit Amount"),
        "depositFundToStartInvesting": MessageLookupByLibrary.simpleMessage(
            "Deposit funds to start investing"),
        "depositHistory":
            MessageLookupByLibrary.simpleMessage("Deposit History"),
        "depositRegulatoryRequirements": m7,
        "depositRequestSubmittedSubTitleFirstTime":
            MessageLookupByLibrary.simpleMessage(
                "Your account opening application and initial deposit will be reviewed within 1-2 working days. You will be informed via email and app notification once your account is approved."),
        "depositRequestSubmittedSubTitleReturn":
            MessageLookupByLibrary.simpleMessage(
                "Your deposit request is submitted. We\'ll let you know via email and app notification as soon as your deposit arrives."),
        "depositRequestSubmittedTitle":
            MessageLookupByLibrary.simpleMessage("Deposit Request Submitted"),
        "depositViaFpsOrWireTransfer": MessageLookupByLibrary.simpleMessage(
            "Deposit via FPS or Wire Transfer"),
        "doAnyOfTheFollowingApply": MessageLookupByLibrary.simpleMessage(
            "Do any of the following apply to you or a member of your immediate family ?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailActivationFailedTitle": MessageLookupByLibrary.simpleMessage(
            "Sorry! You were a bit late, your request has timed out. \n\nLet\'s try and activate your account again!"),
        "emailActivationSuccessTitle": m8,
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "emailNotExist": MessageLookupByLibrary.simpleMessage(
            "User does not exist with the given email"),
        "emailNotVerified":
            MessageLookupByLibrary.simpleMessage("User email is not verified"),
        "employees": MessageLookupByLibrary.simpleMessage("Employees"),
        "employment": MessageLookupByLibrary.simpleMessage("Employment"),
        "employmentStatus":
            MessageLookupByLibrary.simpleMessage("Employment Status*"),
        "endBotStockAcknowledgement": m9,
        "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
        "endedAmount": MessageLookupByLibrary.simpleMessage("Ended Amount"),
        "enterANewPassword":
            MessageLookupByLibrary.simpleMessage("Enter a new password"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Enter valid email"),
        "enterValidPassword":
            MessageLookupByLibrary.simpleMessage("Enter valid password"),
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
        "errorStoringData":
            MessageLookupByLibrary.simpleMessage("Error Storing Data"),
        "errorStoringDataDetails": MessageLookupByLibrary.simpleMessage(
            "Oops! We\'re having some technical difficulties trying to store your responses. Let\'s try retaking the questions"),
        "errorWithdrawalUnavailableSubTitle": MessageLookupByLibrary.simpleMessage(
            "You don\'t have any funds to withdraw. You haven\'t deposited yet or your deposit might still be processing "),
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
        "exchangeRateInDepositScreen": m10,
        "existingPassword":
            MessageLookupByLibrary.simpleMessage("Existing Password"),
        "expired": MessageLookupByLibrary.simpleMessage("Expired"),
        "expiresAt": MessageLookupByLibrary.simpleMessage("Expires at"),
        "extrovertLessThan8": MessageLookupByLibrary.simpleMessage(
            "You also seem to be a bit more reserved. But hey, introverts change the world!"),
        "extrovertMoreThan8": MessageLookupByLibrary.simpleMessage(
            "You also seem like a social butterfly - amplify that energy!"),
        "filledPrice": MessageLookupByLibrary.simpleMessage("Filled Price"),
        "financialProfile":
            MessageLookupByLibrary.simpleMessage("Financial Profile"),
        "firstTimeCopyAskloraBankDetails": m11,
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "forgotPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Please enter your email. Instructions will be sent to reset your password."),
        "founded": MessageLookupByLibrary.simpleMessage("Founded"),
        "free": MessageLookupByLibrary.simpleMessage("Free"),
        "freeTrial": MessageLookupByLibrary.simpleMessage("Free Trial"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "getHelp": MessageLookupByLibrary.simpleMessage("Get Help"),
        "getReadyForTheVerification": MessageLookupByLibrary.simpleMessage(
            "Get ready for the verification process. You will.."),
        "getReadyForTrading":
            MessageLookupByLibrary.simpleMessage("Get ready for AI trading."),
        "getTheFirstBotstockForFree": MessageLookupByLibrary.simpleMessage(
            "Get the First Botstock for Free"),
        "go": MessageLookupByLibrary.simpleMessage("Go"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got It"),
        "greatStart": MessageLookupByLibrary.simpleMessage("Great start!"),
        "greetingScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "Let\'s start the training with simple questions!\n\n  Remember - to lose patience is to lose the battle!"),
        "greetingScreenTitle": MessageLookupByLibrary.simpleMessage(
            "Ready to start your AI revolution?"),
        "halfWayThere": MessageLookupByLibrary.simpleMessage("Halfway there!"),
        "headquarters": MessageLookupByLibrary.simpleMessage("Headquarters"),
        "hkId": MessageLookupByLibrary.simpleMessage("HKID"),
        "hkIdNumber": MessageLookupByLibrary.simpleMessage("HKID Number"),
        "hkPhoneNo": MessageLookupByLibrary.simpleMessage("HK Phone Number"),
        "hkResidentQuestion": MessageLookupByLibrary.simpleMessage(
            "Are you a Hong Kong resident? By clicking yes, you acknowledge that you are also a Hong Kong tax resident"),
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
        "inputDepositAmount":
            MessageLookupByLibrary.simpleMessage("Input deposit amount"),
        "inputWrongEmail":
            MessageLookupByLibrary.simpleMessage("Input wrong email address"),
        "inputWrongEmailAddress":
            MessageLookupByLibrary.simpleMessage("Input wrong email address"),
        "introduceBotPlank":
            MessageLookupByLibrary.simpleMessage("Introduce Bot - Plank"),
        "introduceBotPullup":
            MessageLookupByLibrary.simpleMessage("Introduce Bot - Pullup"),
        "introduceBotSquat":
            MessageLookupByLibrary.simpleMessage("Introduce Bot - Squat"),
        "invalidOtp": MessageLookupByLibrary.simpleMessage("Invalid OTP"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid Password"),
        "investmentAmount":
            MessageLookupByLibrary.simpleMessage("Investment Amount"),
        "investmentPeriod":
            MessageLookupByLibrary.simpleMessage("Investment Period"),
        "investmentPreferences":
            MessageLookupByLibrary.simpleMessage("Investment Preferences"),
        "investmentResultScreenDescription": MessageLookupByLibrary.simpleMessage(
            "You\'re one step closer to AI Investing. \n\nTime to open your account."),
        "investmentResultScreenTitle":
            MessageLookupByLibrary.simpleMessage("I like your style"),
        "investmentStyleWelcomeTitle": MessageLookupByLibrary.simpleMessage(
            "It’s time to define your investment style.  Show me what you’re made of!"),
        "isqNextButton": MessageLookupByLibrary.simpleMessage(
            "Press to move onto the next section"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "learnBotstockManagement":
            MessageLookupByLibrary.simpleMessage("Learn Botstock Management"),
        "legalFirstName":
            MessageLookupByLibrary.simpleMessage("Legal English First Name"),
        "legalLastName":
            MessageLookupByLibrary.simpleMessage("Legal English Last Name"),
        "licenseeName":
            MessageLookupByLibrary.simpleMessage("Licensee: Chang Yung Ching"),
        "licenseeNumber":
            MessageLookupByLibrary.simpleMessage("CE No.: AFF918"),
        "linkPasswordResetIsSent": MessageLookupByLibrary.simpleMessage(
            "Link for Password reset is sent to email."),
        "manageYourBotstock":
            MessageLookupByLibrary.simpleMessage("Manage Your Botstock"),
        "marketCap": MessageLookupByLibrary.simpleMessage("Market Cap"),
        "marketPrice": MessageLookupByLibrary.simpleMessage("Market Price"),
        "masterAiTrading":
            MessageLookupByLibrary.simpleMessage("Master AI Trading"),
        "milestones": MessageLookupByLibrary.simpleMessage("Milestones"),
        "min": m12,
        "min8Character":
            MessageLookupByLibrary.simpleMessage("min. 8 characters"),
        "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
        "natureOfBusiness":
            MessageLookupByLibrary.simpleMessage("Nature of Business"),
        "needHelp": MessageLookupByLibrary.simpleMessage("Need help?"),
        "neuroticismLessThan8": MessageLookupByLibrary.simpleMessage(
            "we think you can take on more risk."),
        "neuroticismMoreThan8": MessageLookupByLibrary.simpleMessage(
            "we think you should take on less risk."),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "nextStep": MessageLookupByLibrary.simpleMessage("Next step"),
        "no": MessageLookupByLibrary.simpleMessage(" No"),
        "noTransactions":
            MessageLookupByLibrary.simpleMessage("No Transactions"),
        "noTransactionsYet": MessageLookupByLibrary.simpleMessage(
            "Looks like you haven’t made \nany transactions yet!"),
        "notFeelingIt": MessageLookupByLibrary.simpleMessage(
            "Not feeling it? Try something different."),
        "noteOnPaymentDetails": MessageLookupByLibrary.simpleMessage(
            "Note:\nWe will work with your bank in order to idenfity your bank account details (account name, bank code, account number). However, we may require additional details from you for transaction verification purposes."),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
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
        "onBoardingCompletionMessage": MessageLookupByLibrary.simpleMessage(
            "You\'ve completed all the steps to opening an account with Asklora! You\'ll be able to start trading as soon as your account is approved. It usually takes up to 2 business days."),
        "onceYouHaveStarted": MessageLookupByLibrary.simpleMessage(
            "Once you\'ve started, you can resume the process whenever you want."),
        "openAccountNow":
            MessageLookupByLibrary.simpleMessage("Open Account Now"),
        "openInvestmentAccount":
            MessageLookupByLibrary.simpleMessage("Open Investment Account"),
        "opennessLessThan8": MessageLookupByLibrary.simpleMessage(
            "we investing can be simple with AI"),
        "opennessMoreThan8": MessageLookupByLibrary.simpleMessage(
            "our technology is perfect for you."),
        "orderCancelled":
            MessageLookupByLibrary.simpleMessage("Order Cancelled"),
        "orderExpired": MessageLookupByLibrary.simpleMessage("Order Expired"),
        "orderPlaced": MessageLookupByLibrary.simpleMessage("Order Placed"),
        "orderRejected": MessageLookupByLibrary.simpleMessage("Order Rejected"),
        "orderRollover": MessageLookupByLibrary.simpleMessage("Order Rollover"),
        "orderStarted": MessageLookupByLibrary.simpleMessage("Order Started"),
        "otpDigit": MessageLookupByLibrary.simpleMessage("000000 (6 digit)"),
        "otpScreenDescription": m13,
        "otpScreenTitle": MessageLookupByLibrary.simpleMessage("Mobile OTP"),
        "otpSentToYourEmail":
            MessageLookupByLibrary.simpleMessage("OTP code sent to your email"),
        "otpSentToYourPhone": MessageLookupByLibrary.simpleMessage(
            "Otp SMS is sent to your phone"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordChangeSuccess":
            MessageLookupByLibrary.simpleMessage("Password Change Success"),
        "passwordChangeSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully."),
        "passwordDoesNotMatch": MessageLookupByLibrary.simpleMessage(
            "Your password does not match."),
        "passwordLinkHasBeenSent": MessageLookupByLibrary.simpleMessage(
            "A Password reset email has been sent. Please check your email"),
        "payDepositToStartRealTrade": MessageLookupByLibrary.simpleMessage(
            "Pay Deposit to Start Real Trade"),
        "paymentDetails":
            MessageLookupByLibrary.simpleMessage("Payment Details"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "performance": MessageLookupByLibrary.simpleMessage("Performance"),
        "personalInfo": MessageLookupByLibrary.simpleMessage("Personal Info"),
        "personalInfoFormDesc": MessageLookupByLibrary.simpleMessage(
            "Please make sure your name matches the information on your identification document."),
        "personalisation":
            MessageLookupByLibrary.simpleMessage("Personalisation"),
        "personalizationResultScreenTitle": MessageLookupByLibrary.simpleMessage(
            "Alright!\n\nBased on your answers, my technology is perfect for you and you can take on more risks."),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "pleaseAddAHkBankAccount": MessageLookupByLibrary.simpleMessage(
            "Please add a HK bank account that is under your name; other people\'s bank accounts or joint accounts will not be accepted."),
        "pleaseEnterYouEmail": MessageLookupByLibrary.simpleMessage(
            "Please enter your email. Instructions will be sent to reset your password."),
        "pleaseMakeSureYouHaveFinished": MessageLookupByLibrary.simpleMessage(
            "Please make sure you have finished the transfer and then inform us, if not, your deposit will be delayed."),
        "pleaseMakeSureYouPressSubmit": MessageLookupByLibrary.simpleMessage(
            "Please make sure you press \'SUBMIT\' after you have transferred the funds from your bank."),
        "pleaseProvideYourResidentialAddress": MessageLookupByLibrary.simpleMessage(
            "Please provide your residential address. This will also be your mailing address."),
        "pleaseSelect": MessageLookupByLibrary.simpleMessage("Please Select"),
        "porAddress": MessageLookupByLibrary.simpleMessage(
            "Proof of Residential Address"),
        "portfolioBuyingPower": m14,
        "portfolioBuyingPowerToolTip": MessageLookupByLibrary.simpleMessage(
            "Your Buying Power represents the amount of cash that you can use to buy Botstocks. Your Withdrawable Balance and your Buying Power may not always be the same. For example, starting a Botstock will reduce your Buying Power and the amount value will be added to Total Botstock Values. When the Botstock is expired or terminated, the amount will be added to Buying Power and after T + 2, the amount will be also added to Withdrawable Balance. This is called ‘settlement\'."),
        "portfolioCurrentPrice":
            MessageLookupByLibrary.simpleMessage("Current Price"),
        "portfolioDetailButtonCancelBotStock":
            MessageLookupByLibrary.simpleMessage("Cancel Botstock"),
        "portfolioDetailButtonEndBotStock":
            MessageLookupByLibrary.simpleMessage("End Botstock"),
        "portfolioDetailButtonRolloverBotStock":
            MessageLookupByLibrary.simpleMessage("Rollover Botstock"),
        "portfolioDetailChartCaption": m15,
        "portfolioDetailChartEmptyMessage":
            MessageLookupByLibrary.simpleMessage(
                "Performance data will be available once the Botstock starts"),
        "portfolioDetailExpiredAt": m16,
        "portfolioDetailExpiredIn": m17,
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
            MessageLookupByLibrary.simpleMessage("Stock Holding %"),
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
                "Looks like you haven\'t defined your Investment Style yet. Let\'s go and see what kind of Botstocks suit you best!"),
        "portfolioPopUpDefineInvestmentTitle":
            MessageLookupByLibrary.simpleMessage(
                "Define Your Investment Style"),
        "portfolioPopUpFundAccountSubTitle": MessageLookupByLibrary.simpleMessage(
            "Looks like you haven\'t funded your account yet. Deposit HKD 10,000 to activate your account."),
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
                "Looks like you haven\'t claimed your free Botstock yet. Let\'s get trading right away!"),
        "portfolioPopUpRedeemYourBotstockTitle":
            MessageLookupByLibrary.simpleMessage("Redeem Your Free Botstock"),
        "portfolioTotalBotStock": m18,
        "portfolioTotalPL": MessageLookupByLibrary.simpleMessage("Total P/L"),
        "portfolioTotalValue":
            MessageLookupByLibrary.simpleMessage("Total Portfolio Value"),
        "portfolioWithdrawableAmount": m19,
        "portfolioYourBotStock":
            MessageLookupByLibrary.simpleMessage("Your Botstocks"),
        "pressBackAgain": MessageLookupByLibrary.simpleMessage(
            "Press back again to exit Asklora"),
        "prevClose": MessageLookupByLibrary.simpleMessage("Prev Close"),
        "privacyEvaluation":
            MessageLookupByLibrary.simpleMessage("Privacy Evaluation"),
        "privacyFailedScreenDescription": MessageLookupByLibrary.simpleMessage(
            "It could be that your risk score or age is too low.\n\nIf you made a mistake and did not answer the questions correctly, please try again."),
        "privacyFailedScreenTitle": MessageLookupByLibrary.simpleMessage(
            "I\'m afraid you\'re not eligible for Asklora yet."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "privacySuccessScreenDescription": MessageLookupByLibrary.simpleMessage(
            "Age is just a number, but your personality is what sets you apart.\n\nAnswer a few personality questions, and I\'ll help you find investments that fit your style."),
        "privacySuccessScreenTitle":
            MessageLookupByLibrary.simpleMessage("I appreciate your honesty."),
        "pushNotification":
            MessageLookupByLibrary.simpleMessage("Push-Notification"),
        "reSendOtp": m20,
        "readyToGo": MessageLookupByLibrary.simpleMessage("Ready to go?"),
        "redeemYourBotstockNow":
            MessageLookupByLibrary.simpleMessage("Redeem Your Botstock Now"),
        "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
        "relearn": MessageLookupByLibrary.simpleMessage("relearn"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordSuccessful":
            MessageLookupByLibrary.simpleMessage("Password Reset Successful"),
        "resetPasswordSuccessfulMessage": MessageLookupByLibrary.simpleMessage(
            "Your password has been reset. Please go back to the Login page and login again."),
        "resultOfPersonalizationQuestion": m21,
        "retakeInvestmentStyle":
            MessageLookupByLibrary.simpleMessage("Retake Investment Style"),
        "returningUserDepositNotes": MessageLookupByLibrary.simpleMessage(
            "We will work with your bank in order to identify your bank account details (account name, bank code, account number). However, we may require additional details from you for transaction verification purposes."),
        "riskDisclosureStatementAcknowledgement":
            MessageLookupByLibrary.simpleMessage(
                "I have read, understood, and agree with the Risk Disclosure Statement."),
        "riskDisclosureStatementLabel":
            MessageLookupByLibrary.simpleMessage("Risk Disclosure Statement"),
        "riskDisclosureStatementString": MessageLookupByLibrary.simpleMessage(
            "1. The prices of securities fluctuate, sometimes dramatically. The price of a security may move up or down, and may become valueless. It is as likely that losses will be incurred rather than profit made as a result of buying and selling securities. Investors should not only base on this marketing material to make any investment decision, you should carefully consider whether the investment products or services are suitable for you according to your investment experience, purpose, risk tolerance, financial or related conditions. If you have any questions, please contact us or obtain independent advice.\n\n2. Investment in foreign securities carries additional risks not generally associated with securities in the domestic market. The value or income of foreign securities may be more volatile and could be adversely affected by changes in currency rates of exchange, foreign taxation practices, foreign laws, government practices, regulations, and political events. You may find it more difficult to liquidate investments in foreign securities where they have limited liquidity in the relevant market. Foreign laws, government practices, and regulations may also affect the transferability of foreign securities. Timely and reliable information about the value or the extent of the risks of foreign securities may not be readily available at all times.\n\n3. You acknowledge that you have fully understood the implications of the risks associated with the Electronic Trading Service as set out in the Client Agreement"),
        "rolloverBotStockAcknowledgement": m22,
        "saveForLater": MessageLookupByLibrary.simpleMessage("Save For Later"),
        "sectors": MessageLookupByLibrary.simpleMessage("Sector(s)"),
        "sell": MessageLookupByLibrary.simpleMessage("Sell"),
        "sendOtp": MessageLookupByLibrary.simpleMessage("SEND OTP"),
        "setUpFinancialProfile":
            MessageLookupByLibrary.simpleMessage("Set Up Financial Profile"),
        "setupPersonalInfo":
            MessageLookupByLibrary.simpleMessage("Set up Personal Info"),
        "shares": MessageLookupByLibrary.simpleMessage("Shares"),
        "signAgreements":
            MessageLookupByLibrary.simpleMessage("Sign Agreements"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signOutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sign out ?"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage(
            "Start your AI revolution with\nAsklora. Go crush it."),
        "startABotstock":
            MessageLookupByLibrary.simpleMessage("Start A Botstock"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "startInvesting":
            MessageLookupByLibrary.simpleMessage("Start Investing"),
        "startInvestingOnMilestone":
            MessageLookupByLibrary.simpleMessage("Start investing"),
        "startsAt": MessageLookupByLibrary.simpleMessage("Starts at"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "submitApplication":
            MessageLookupByLibrary.simpleMessage("Submit Application"),
        "subscription": MessageLookupByLibrary.simpleMessage("Subscription"),
        "summary": MessageLookupByLibrary.simpleMessage("Summary"),
        "summaryAgreementInformation": MessageLookupByLibrary.simpleMessage(
            "The agreements will become binding subject to the approval of the information submitted by you. \n\nIf there is a material change to this information, please contact loracares@asklora.ai as soon as possible"),
        "suspendedScreenSubTitle": MessageLookupByLibrary.simpleMessage(
            "Your account has been suspended and is pending investigation from us. If you have any questions about your account, please contact our customer service team."),
        "suspendedScreenTitle":
            MessageLookupByLibrary.simpleMessage("Account Suspended"),
        "swiftCode": MessageLookupByLibrary.simpleMessage("Swift Code"),
        "takePhotoBack": MessageLookupByLibrary.simpleMessage(
            "Take a photo of the front of your HKID"),
        "takePhotoFront": MessageLookupByLibrary.simpleMessage(
            "Take a photo of the front of your HKID"),
        "takeSelfie": MessageLookupByLibrary.simpleMessage("Take a selfie"),
        "terminateAccount":
            MessageLookupByLibrary.simpleMessage("Terminate Account"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Terms and Conditions"),
        "theAmountMustMatch": MessageLookupByLibrary.simpleMessage(
            "The amount must match with the actual transferred amount."),
        "theAmountMustMatchWithPor": MessageLookupByLibrary.simpleMessage(
            "The amount must match with the proof of remittance."),
        "theItemYouWillNeed":
            MessageLookupByLibrary.simpleMessage("The items you will need…"),
        "thePorShouldShowYourBank": MessageLookupByLibrary.simpleMessage(
            "The proof of remittance should show your bank account number, full name, and amount."),
        "theProofOfRemittanceShouldShowYourBankAccount":
            MessageLookupByLibrary.simpleMessage(
                "The proof of remittance should show your bank account number, full name, and amount."),
        "timeCompleted": MessageLookupByLibrary.simpleMessage("Time Completed"),
        "timeRequested": MessageLookupByLibrary.simpleMessage("Time Requested"),
        "to": MessageLookupByLibrary.simpleMessage("To"),
        "tokenInvalid": MessageLookupByLibrary.simpleMessage(
            "Token is invalid or expired."),
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
            "Lora\'s date to start the Botstocks"),
        "totalAmount": MessageLookupByLibrary.simpleMessage("Total amount"),
        "totalPnlIs": MessageLookupByLibrary.simpleMessage("Total P/L is"),
        "trade": MessageLookupByLibrary.simpleMessage("Trade"),
        "tradeCancelledSubtitle": MessageLookupByLibrary.simpleMessage(
            "The trade has been cancelled and your investment amount has been returned to your account"),
        "tradeCancelledTitle":
            MessageLookupByLibrary.simpleMessage("Trade Cancelled"),
        "tradeFee": MessageLookupByLibrary.simpleMessage("Trade Fee"),
        "tradeRequestSubmitted":
            MessageLookupByLibrary.simpleMessage("Trade Request Submitted"),
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
        "transferAtLeastWithMinimumDeposit": m23,
        "transferAtLeastWithNoMinimumDeposit": MessageLookupByLibrary.simpleMessage(
            "Transfer to Asklora bank account from the same bank account you used."),
        "transferFundToAsklora":
            MessageLookupByLibrary.simpleMessage("Transfer funds to Asklora"),
        "transferInitialFundToAsklora": MessageLookupByLibrary.simpleMessage(
            "Transfer initial funds to Asklora"),
        "transferTo": MessageLookupByLibrary.simpleMessage("Transfer to"),
        "unableToProcessDepositSubTitle": MessageLookupByLibrary.simpleMessage(
            "We\'re having some trouble processing your deposit request. Please try again"),
        "unableToProcessDepositTitle":
            MessageLookupByLibrary.simpleMessage("Unable to Process Deposit"),
        "unableToProcessWithdrawalSubTitle": MessageLookupByLibrary.simpleMessage(
            "We\'re having some trouble processing your withdrawal request. Please try again"),
        "unableToProcessWithdrawalTitle": MessageLookupByLibrary.simpleMessage(
            "Unable to Process Withdrawal"),
        "updatedAt": m24,
        "uploadAddressProof":
            MessageLookupByLibrary.simpleMessage("Upload Address Proof"),
        "uploadProofOfRemittance":
            MessageLookupByLibrary.simpleMessage("Upload proof of remittance"),
        "usResidentQuestion": MessageLookupByLibrary.simpleMessage(
            "Are you a United States tax resident, green card holder, or citizen?"),
        "userId": MessageLookupByLibrary.simpleMessage("User ID"),
        "verifyIdentity":
            MessageLookupByLibrary.simpleMessage("Verify identity"),
        "verifyNow": MessageLookupByLibrary.simpleMessage("Verify Now"),
        "verifyOtpSuccess":
            MessageLookupByLibrary.simpleMessage("Verify OTP Success"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "viewDepositGuide":
            MessageLookupByLibrary.simpleMessage("View Deposit Guide"),
        "weAcceptHKDOnly":
            MessageLookupByLibrary.simpleMessage("We accept HKD only."),
        "weAcceptUtilityBill": MessageLookupByLibrary.simpleMessage(
            "(We accept utility bill, bank statement, or government correspondence within the last 3 months)"),
        "weNeedToVerifyYourId": MessageLookupByLibrary.simpleMessage(
            "We\'ll need to verify your identity via your HKID."),
        "weWillOnlyAcceptDepositViaBankTransfer":
            MessageLookupByLibrary.simpleMessage(
                "We will only accept deposits via bank transfer (wire/FPS) from your own account."),
        "weWillOnlyAcceptHKD":
            MessageLookupByLibrary.simpleMessage("We will only accept HKD."),
        "weWillTakeInformationCollectedFromYour": m25,
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
        "wireTransfer": MessageLookupByLibrary.simpleMessage("Wire Transfer"),
        "withdraw": MessageLookupByLibrary.simpleMessage("Withdraw"),
        "withdrawalAmount":
            MessageLookupByLibrary.simpleMessage("Withdrawal Amount"),
        "withdrawalHistory":
            MessageLookupByLibrary.simpleMessage("Withdrawal History"),
        "withdrawalRequestSubmittedSubTitle": MessageLookupByLibrary.simpleMessage(
            "You will be informed via email and app notification as soon as the funds are paid to your account."),
        "withdrawalRequestSubmittedTitle": MessageLookupByLibrary.simpleMessage(
            "Withdrawal Request Submitted"),
        "withdrawalWorkingDays": MessageLookupByLibrary.simpleMessage(
            "Your withdrawal can take up to 2 working days."),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yourAddressProofMustContainFullName": MessageLookupByLibrary.simpleMessage(
            "Your address proof must contain your full name, full residential address and the issuing agency.\n\nWe accept water/electricity/gas bills, bank statement, or government correspondence within the last 3 months."),
        "yourBankAccount":
            MessageLookupByLibrary.simpleMessage("Your Bank Account"),
        "yourBankAccountIsUnderReview": m26,
        "yourDepositCanTakeUp2WorkingDays":
            MessageLookupByLibrary.simpleMessage(
                "Your deposit can take up to 2 working days"),
        "yourDepositMayBeRejected": MessageLookupByLibrary.simpleMessage(
            "Your deposit may be rejected if the informed amount is different from the actual transferred amount."),
        "yourPasswordHasBeenChanged": MessageLookupByLibrary.simpleMessage(
            "Your password has been changed"),
        "yourPaymentInformationIsUnderReview": MessageLookupByLibrary.simpleMessage(
            "Your payment information is under review. Your bank account details will be shown here once your account is approved. please note it can take up to 2 working days for the approval process.")
      };
}
