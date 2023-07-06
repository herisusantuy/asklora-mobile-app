// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Get Help`
  String get getHelp {
    return Intl.message(
      'Get Help',
      name: 'getHelp',
      desc: '',
      args: [],
    );
  }

  /// `Customer Service`
  String get customerService {
    return Intl.message(
      'Customer Service',
      name: 'customerService',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `About Asklora`
  String get aboutAsklora {
    return Intl.message(
      'About Asklora',
      name: 'aboutAsklora',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Office Hours`
  String get officeHoursLabel {
    return Intl.message(
      'Office Hours',
      name: 'officeHoursLabel',
      desc: '',
      args: [],
    );
  }

  /// `09:00-18:00 (HKT)`
  String get officeHours {
    return Intl.message(
      '09:00-18:00 (HKT)',
      name: 'officeHours',
      desc: '',
      args: [],
    );
  }

  /// `Bot Duration`
  String get botDuration {
    return Intl.message(
      'Bot Duration',
      name: 'botDuration',
      desc: '',
      args: [],
    );
  }

  /// `Bot Management Fee`
  String get botManagementFee {
    return Intl.message(
      'Bot Management Fee',
      name: 'botManagementFee',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get buttonSignUp {
    return Intl.message(
      'Sign Up',
      name: 'buttonSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Already Have An Account?`
  String get buttonAlreadyHaveAnAccount {
    return Intl.message(
      'Already Have An Account?',
      name: 'buttonAlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Resend Activation Link`
  String get buttonResendActivationLink {
    return Intl.message(
      'Resend Activation Link',
      name: 'buttonResendActivationLink',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Again`
  String get buttonSignUpAgain {
    return Intl.message(
      'Sign Up Again',
      name: 'buttonSignUpAgain',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get buttonCancel {
    return Intl.message(
      'Cancel',
      name: 'buttonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get buttonConfirm {
    return Intl.message(
      'Confirm',
      name: 'buttonConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get buttonDone {
    return Intl.message(
      'Done',
      name: 'buttonDone',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get buttonNext {
    return Intl.message(
      'Next',
      name: 'buttonNext',
      desc: '',
      args: [],
    );
  }

  /// `Not Now`
  String get buttonNotNow {
    return Intl.message(
      'Not Now',
      name: 'buttonNotNow',
      desc: '',
      args: [],
    );
  }

  /// `Reload Page`
  String get buttonReloadPage {
    return Intl.message(
      'Reload Page',
      name: 'buttonReloadPage',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get buttonDeposit {
    return Intl.message(
      'Deposit',
      name: 'buttonDeposit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Trade`
  String get buttonCancelTrade {
    return Intl.message(
      'Cancel Trade',
      name: 'buttonCancelTrade',
      desc: '',
      args: [],
    );
  }

  /// `Have An Account?`
  String get buttonHaveAnAccount {
    return Intl.message(
      'Have An Account?',
      name: 'buttonHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Let's Begin`
  String get buttonLetsBegin {
    return Intl.message(
      'Let\'s Begin',
      name: 'buttonLetsBegin',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get buttonSignOut {
    return Intl.message(
      'Sign Out',
      name: 'buttonSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get buttonBack {
    return Intl.message(
      'Back',
      name: 'buttonBack',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get buttonContinue {
    return Intl.message(
      'Continue',
      name: 'buttonContinue',
      desc: '',
      args: [],
    );
  }

  /// `Maybe Later`
  String get buttonMaybeLater {
    return Intl.message(
      'Maybe Later',
      name: 'buttonMaybeLater',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get buttonWithdraw {
    return Intl.message(
      'Withdraw',
      name: 'buttonWithdraw',
      desc: '',
      args: [],
    );
  }

  /// `Back To Portfolio`
  String get buttonBackToPortfolio {
    return Intl.message(
      'Back To Portfolio',
      name: 'buttonBackToPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home`
  String get buttonBackToHome {
    return Intl.message(
      'Back To Home',
      name: 'buttonBackToHome',
      desc: '',
      args: [],
    );
  }

  /// `Contact Customer Service`
  String get buttonContactCustomerService {
    return Intl.message(
      'Contact Customer Service',
      name: 'buttonContactCustomerService',
      desc: '',
      args: [],
    );
  }

  /// `Change Investment Style`
  String get buttonChangeInvestmentStyle {
    return Intl.message(
      'Change Investment Style',
      name: 'buttonChangeInvestmentStyle',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get buttonForgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'buttonForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `View Transaction History`
  String get buttonViewTransactionHistory {
    return Intl.message(
      'View Transaction History',
      name: 'buttonViewTransactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get buttonSave {
    return Intl.message(
      'Save',
      name: 'buttonSave',
      desc: '',
      args: [],
    );
  }

  /// `Current Price`
  String get currentPrice {
    return Intl.message(
      'Current Price',
      name: 'currentPrice',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Amount`
  String get depositAmount {
    return Intl.message(
      'Deposit Amount',
      name: 'depositAmount',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get deposit {
    return Intl.message(
      'Deposit',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  /// `Deposit Request Submitted`
  String get depositRequestSubmittedTitle {
    return Intl.message(
      'Deposit Request Submitted',
      name: 'depositRequestSubmittedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your account opening application and initial deposit will be reviewed within 1-2 working days. You will be informed via email and app notification once your account is approved.`
  String get depositRequestSubmittedSubTitleFirstTime {
    return Intl.message(
      'Your account opening application and initial deposit will be reviewed within 1-2 working days. You will be informed via email and app notification once your account is approved.',
      name: 'depositRequestSubmittedSubTitleFirstTime',
      desc: '',
      args: [],
    );
  }

  /// `Your deposit request is submitted. We’ll let you know via email and app notification as soon as your deposit arrives.`
  String get depositRequestSubmittedSubTitleReturn {
    return Intl.message(
      'Your deposit request is submitted. We’ll let you know via email and app notification as soon as your deposit arrives.',
      name: 'depositRequestSubmittedSubTitleReturn',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent an email to\n {emailAddress}\n\nPlease use your phone to click on the activation link!`
  String emailActivationSuccessTitle(String emailAddress) {
    return Intl.message(
      'We’ve sent an email to\n $emailAddress\n\nPlease use your phone to click on the activation link!',
      name: 'emailActivationSuccessTitle',
      desc: '',
      args: [emailAddress],
    );
  }

  /// `Sorry! You were a bit late, your request has timed out. \n\nLet’s try and activate your account again!`
  String get emailActivationFailedTitle {
    return Intl.message(
      'Sorry! You were a bit late, your request has timed out. \n\nLet’s try and activate your account again!',
      name: 'emailActivationFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Est. Stop Loss Level`
  String get estStopLossLevel {
    return Intl.message(
      'Est. Stop Loss Level',
      name: 'estStopLossLevel',
      desc: '',
      args: [],
    );
  }

  /// `Est. Max Loss Level`
  String get estMaxLossLevel {
    return Intl.message(
      'Est. Max Loss Level',
      name: 'estMaxLossLevel',
      desc: '',
      args: [],
    );
  }

  /// `Est. Take Profit Level`
  String get estTakeProfitLevel {
    return Intl.message(
      'Est. Take Profit Level',
      name: 'estTakeProfitLevel',
      desc: '',
      args: [],
    );
  }

  /// `Est. Max Profit Level`
  String get estMaxProfitLevel {
    return Intl.message(
      'Est. Max Profit Level',
      name: 'estMaxProfitLevel',
      desc: '',
      args: [],
    );
  }

  /// `Est. Stop Loss %`
  String get estStopLossPercent {
    return Intl.message(
      'Est. Stop Loss %',
      name: 'estStopLossPercent',
      desc: '',
      args: [],
    );
  }

  /// `Est. Max Loss %`
  String get estMaxLossPercent {
    return Intl.message(
      'Est. Max Loss %',
      name: 'estMaxLossPercent',
      desc: '',
      args: [],
    );
  }

  /// `Est. Take Profit %`
  String get estTakeProfitPercent {
    return Intl.message(
      'Est. Take Profit %',
      name: 'estTakeProfitPercent',
      desc: '',
      args: [],
    );
  }

  /// `Est. Max Profit %`
  String get estMaxProfitPercent {
    return Intl.message(
      'Est. Max Profit %',
      name: 'estMaxProfitPercent',
      desc: '',
      args: [],
    );
  }

  /// `Estimated End Date`
  String get estimatedEndDate {
    return Intl.message(
      'Estimated End Date',
      name: 'estimatedEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `Expires at`
  String get expiresAt {
    return Intl.message(
      'Expires at',
      name: 'expiresAt',
      desc: '',
      args: [],
    );
  }

  /// `Starts at`
  String get startsAt {
    return Intl.message(
      'Starts at',
      name: 'startsAt',
      desc: '',
      args: [],
    );
  }

  /// `CEO`
  String get ceo {
    return Intl.message(
      'CEO',
      name: 'ceo',
      desc: '',
      args: [],
    );
  }

  /// `Founded`
  String get founded {
    return Intl.message(
      'Founded',
      name: 'founded',
      desc: '',
      args: [],
    );
  }

  /// `Got It`
  String get gotIt {
    return Intl.message(
      'Got It',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Headquarters`
  String get headquarters {
    return Intl.message(
      'Headquarters',
      name: 'headquarters',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `Core Plan`
  String get corePlan {
    return Intl.message(
      'Core Plan',
      name: 'corePlan',
      desc: '',
      args: [],
    );
  }

  /// `Free Trial`
  String get freeTrial {
    return Intl.message(
      'Free Trial',
      name: 'freeTrial',
      desc: '',
      args: [],
    );
  }

  /// `All Settings`
  String get allSettings {
    return Intl.message(
      'All Settings',
      name: 'allSettings',
      desc: '',
      args: [],
    );
  }

  /// `Investment Preferences`
  String get investmentPreferences {
    return Intl.message(
      'Investment Preferences',
      name: 'investmentPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get transactionHistory {
    return Intl.message(
      'Transaction History',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get paymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get notificationSettings {
    return Intl.message(
      'Notification Settings',
      name: 'notificationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Terminate Account`
  String get terminateAccount {
    return Intl.message(
      'Terminate Account',
      name: 'terminateAccount',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userId {
    return Intl.message(
      'User ID',
      name: 'userId',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Date Joined`
  String get dateJoined {
    return Intl.message(
      'Date Joined',
      name: 'dateJoined',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Botstock ID`
  String get botStockId {
    return Intl.message(
      'Botstock ID',
      name: 'botStockId',
      desc: '',
      args: [],
    );
  }

  /// `Investment Amount`
  String get investmentAmount {
    return Intl.message(
      'Investment Amount',
      name: 'investmentAmount',
      desc: '',
      args: [],
    );
  }

  /// `Let’s get to the heart of personalisation, it’s time to define your investment style.`
  String get investmentStyleWelcomeTitle {
    return Intl.message(
      'Let’s get to the heart of personalisation, it’s time to define your investment style.',
      name: 'investmentStyleWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Trade Fee`
  String get tradeFee {
    return Intl.message(
      'Trade Fee',
      name: 'tradeFee',
      desc: '',
      args: [],
    );
  }

  /// `Ended Amount`
  String get endedAmount {
    return Intl.message(
      'Ended Amount',
      name: 'endedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get activities {
    return Intl.message(
      'Activities',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `Filled Price`
  String get filledPrice {
    return Intl.message(
      'Filled Price',
      name: 'filledPrice',
      desc: '',
      args: [],
    );
  }

  /// `Shares`
  String get shares {
    return Intl.message(
      'Shares',
      name: 'shares',
      desc: '',
      args: [],
    );
  }

  /// `Order Started`
  String get orderStarted {
    return Intl.message(
      'Order Started',
      name: 'orderStarted',
      desc: '',
      args: [],
    );
  }

  /// `Order Rollover`
  String get orderRollover {
    return Intl.message(
      'Order Rollover',
      name: 'orderRollover',
      desc: '',
      args: [],
    );
  }

  /// `Order Expired`
  String get orderExpired {
    return Intl.message(
      'Order Expired',
      name: 'orderExpired',
      desc: '',
      args: [],
    );
  }

  /// `Retake Investment Style`
  String get retakeInvestmentStyle {
    return Intl.message(
      'Retake Investment Style',
      name: 'retakeInvestmentStyle',
      desc: '',
      args: [],
    );
  }

  /// `Unable to get information`
  String get errorGettingInformationTitle {
    return Intl.message(
      'Unable to get information',
      name: 'errorGettingInformationTitle',
      desc: '',
      args: [],
    );
  }

  /// `There was an error when trying to get your Portfolio. Please try reloading the page`
  String get errorGettingInformationPortfolioSubTitle {
    return Intl.message(
      'There was an error when trying to get your Portfolio. Please try reloading the page',
      name: 'errorGettingInformationPortfolioSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `There was an error when trying to get the investment details. Please try reloading the page`
  String get errorGettingInformationInvestmentDetailSubTitle {
    return Intl.message(
      'There was an error when trying to get the investment details. Please try reloading the page',
      name: 'errorGettingInformationInvestmentDetailSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `There was an error when trying to get the investment style question. Please try reloading the page`
  String get errorGettingInformationInvestmentStyleQuestionSubTitle {
    return Intl.message(
      'There was an error when trying to get the investment style question. Please try reloading the page',
      name: 'errorGettingInformationInvestmentStyleQuestionSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `There was an error when trying to get the transaction history. Please try reloading the page`
  String get errorGettingInformationTransactionHistorySubTitle {
    return Intl.message(
      'There was an error when trying to get the transaction history. Please try reloading the page',
      name: 'errorGettingInformationTransactionHistorySubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Unavailable`
  String get errorWithdrawalUnavailableTitle {
    return Intl.message(
      'Withdrawal Unavailable',
      name: 'errorWithdrawalUnavailableTitle',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any funds to withdraw. You haven’t deposited yet or your deposit might still be processing `
  String get errorWithdrawalUnavailableSubTitle {
    return Intl.message(
      'You don’t have any funds to withdraw. You haven’t deposited yet or your deposit might still be processing ',
      name: 'errorWithdrawalUnavailableSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get your Investments in Shape`
  String get carouselIntro1 {
    return Intl.message(
      'Get your Investments in Shape',
      name: 'carouselIntro1',
      desc: '',
      args: [],
    );
  }

  /// `Guided by FinFit Coach, Lora`
  String get carouselIntro2 {
    return Intl.message(
      'Guided by FinFit Coach, Lora',
      name: 'carouselIntro2',
      desc: '',
      args: [],
    );
  }

  /// `Invest with AI strategy, automated`
  String get carouselIntro3 {
    return Intl.message(
      'Invest with AI strategy, automated',
      name: 'carouselIntro3',
      desc: '',
      args: [],
    );
  }

  /// `Personalised experience`
  String get carouselIntro4 {
    return Intl.message(
      'Personalised experience',
      name: 'carouselIntro4',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `I'm Lora, your FinFit coach. Get ready to crush your goals with me!\n\nWhat’s your name? `
  String get askNameScreenPlaceholder {
    return Intl.message(
      'I\'m Lora, your FinFit coach. Get ready to crush your goals with me!\n\nWhat’s your name? ',
      name: 'askNameScreenPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get askNameScreenTextFieldHint {
    return Intl.message(
      'Your Name',
      name: 'askNameScreenTextFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account Number`
  String get bankAccountNumber {
    return Intl.message(
      'Bank Account Number',
      name: 'bankAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Best Suited For`
  String get bestSuitedFor {
    return Intl.message(
      'Best Suited For',
      name: 'bestSuitedFor',
      desc: '',
      args: [],
    );
  }

  /// `Alright! Are you ready for the FinFit journey? `
  String get greetingScreenTitle {
    return Intl.message(
      'Alright! Are you ready for the FinFit journey? ',
      name: 'greetingScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let’s start the training with\nsimple questions!\n\nRemember - to lose patience\nis to lose the battle!`
  String get greetingScreenSubTitle {
    return Intl.message(
      'Let’s start the training with\nsimple questions!\n\nRemember - to lose patience\nis to lose the battle!',
      name: 'greetingScreenSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lora’s date to start the Botstocks`
  String get tooltipBotDetailsStartDate {
    return Intl.message(
      'Lora’s date to start the Botstocks',
      name: 'tooltipBotDetailsStartDate',
      desc: '',
      args: [],
    );
  }

  /// `The duration you set for Botstock where the Bot will automatically buy and sell.`
  String get tooltipBotDetailsInvestmentPeriod {
    return Intl.message(
      'The duration you set for Botstock where the Bot will automatically buy and sell.',
      name: 'tooltipBotDetailsInvestmentPeriod',
      desc: '',
      args: [],
    );
  }

  /// `This is the estimated maximum target profit % level for the Bot strategy. The Bot will try to close the trade (sell stocks) and capture profits when profits reach this % level. This is an estimated level.`
  String get tooltipBotDetailsEstMaxProfit {
    return Intl.message(
      'This is the estimated maximum target profit % level for the Bot strategy. The Bot will try to close the trade (sell stocks) and capture profits when profits reach this % level. This is an estimated level.',
      name: 'tooltipBotDetailsEstMaxProfit',
      desc: '',
      args: [],
    );
  }

  /// `This is the estimated maximum loss % level for the Bot strategy. The Bot will try to limit losses to this % level. This is an estimated level.`
  String get tooltipBotDetailsEstMaxLoss {
    return Intl.message(
      'This is the estimated maximum loss % level for the Bot strategy. The Bot will try to limit losses to this % level. This is an estimated level.',
      name: 'tooltipBotDetailsEstMaxLoss',
      desc: '',
      args: [],
    );
  }

  /// `The return % where the Plank Bot will sell to try and capture profits. The Plank Bot will try to close the trade (sell stocks) when the stock reaches this level above your initial investment level.`
  String get tooltipBotDetailsEstTakeProfit {
    return Intl.message(
      'The return % where the Plank Bot will sell to try and capture profits. The Plank Bot will try to close the trade (sell stocks) when the stock reaches this level above your initial investment level.',
      name: 'tooltipBotDetailsEstTakeProfit',
      desc: '',
      args: [],
    );
  }

  /// `The return % where the Plank Bot will sell try and limit losses. The Plank Bot will try to close the trade (sell stocks) when the stock reaches this level below your initial investment level.`
  String get tooltipBotDetailsEstStopLoss {
    return Intl.message(
      'The return % where the Plank Bot will sell try and limit losses. The Plank Bot will try to close the trade (sell stocks) when the stock reaches this level below your initial investment level.',
      name: 'tooltipBotDetailsEstStopLoss',
      desc: '',
      args: [],
    );
  }

  /// `You have {availableAmount}, the minimum investment amount is {minimumAmount}.`
  String botTradeBottomSheetAmountMinimum(
      String availableAmount, String minimumAmount) {
    return Intl.message(
      'You have $availableAmount, the minimum investment amount is $minimumAmount.',
      name: 'botTradeBottomSheetAmountMinimum',
      desc: '',
      args: [availableAmount, minimumAmount],
    );
  }

  /// `How much are you investing?`
  String get botTradeBottomSheetAmountTitle {
    return Intl.message(
      'How much are you investing?',
      name: 'botTradeBottomSheetAmountTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are running out of money! Fund your account now.`
  String get botTradeBottomSheetInsufficientBalanceTitle {
    return Intl.message(
      'You are running out of money! Fund your account now.',
      name: 'botTradeBottomSheetInsufficientBalanceTitle',
      desc: '',
      args: [],
    );
  }

  /// `The minimum investment amount is {minimumAmount} per trade.`
  String botTradeBottomSheetInsufficientBalanceSubTitle(String minimumAmount) {
    return Intl.message(
      'The minimum investment amount is $minimumAmount per trade.',
      name: 'botTradeBottomSheetInsufficientBalanceSubTitle',
      desc: '',
      args: [minimumAmount],
    );
  }

  /// `You can trade after your account is approved.`
  String get botTradeBottomSheetAccountNotYetApprovedTitle {
    return Intl.message(
      'You can trade after your account is approved.',
      name: 'botTradeBottomSheetAccountNotYetApprovedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Est. to be approved by 2 working days.`
  String get botTradeBottomSheetAccountNotYetApprovedSubTitle {
    return Intl.message(
      'Est. to be approved by 2 working days.',
      name: 'botTradeBottomSheetAccountNotYetApprovedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you extend the Botstock period, you will incur additional fees`
  String get botTradeBottomSheetRolloverDisclosureTitle {
    return Intl.message(
      'If you extend the Botstock period, you will incur additional fees',
      name: 'botTradeBottomSheetRolloverDisclosureTitle',
      desc: '',
      args: [],
    );
  }

  /// `You will be charged HKD40 if you want to extend this Botstock. If you do not have enough funds, then your fees will be deducted when you have sufficient buying power`
  String get botTradeBottomSheetRolloverDisclosureSubTitle {
    return Intl.message(
      'You will be charged HKD40 if you want to extend this Botstock. If you do not have enough funds, then your fees will be deducted when you have sufficient buying power',
      name: 'botTradeBottomSheetRolloverDisclosureSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Botstock will be extended for \n\n2 Weeks`
  String get botTradeBottomSheetRolloverConfirmationTitle {
    return Intl.message(
      'Your Botstock will be extended for \n\n2 Weeks',
      name: 'botTradeBottomSheetRolloverConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `The new expiry date is {expiryTime}`
  String botTradeBottomSheetRolloverConfirmationSubTitle(String expiryTime) {
    return Intl.message(
      'The new expiry date is $expiryTime',
      name: 'botTradeBottomSheetRolloverConfirmationSubTitle',
      desc: '',
      args: [expiryTime],
    );
  }

  /// `You can end the Botstock now, and all stocks will be sold. Trading of {botInformation} will stop.`
  String botTradeBottomSheetEndBotStockConfirmationTitle(
      String botInformation) {
    return Intl.message(
      'You can end the Botstock now, and all stocks will be sold. Trading of $botInformation will stop.',
      name: 'botTradeBottomSheetEndBotStockConfirmationTitle',
      desc: '',
      args: [botInformation],
    );
  }

  /// `The total Botstock value will be returned to your \naccount after the next community order.`
  String get botTradeBottomSheetEndBotStockConfirmationSubTitle {
    return Intl.message(
      'The total Botstock value will be returned to your \naccount after the next community order.',
      name: 'botTradeBottomSheetEndBotStockConfirmationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your free Botstock has been added to your portfolio!`
  String get botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle {
    return Intl.message(
      'Your free Botstock has been added to your portfolio!',
      name: 'botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Deposit To Start Trading`
  String get botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle {
    return Intl.message(
      'Deposit To Start Trading',
      name: 'botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `The investment amount and Bot management fee (HKD{amount}) will be returned to your account.`
  String botTradeBottomSheetCancelBotStockConfirmationTitle(String amount) {
    return Intl.message(
      'The investment amount and Bot management fee (HKD$amount) will be returned to your account.',
      name: 'botTradeBottomSheetCancelBotStockConfirmationTitle',
      desc: '',
      args: [amount],
    );
  }

  /// `Confirm Rollover`
  String get botTradeBottomSheetRolloverConfirmationButton {
    return Intl.message(
      'Confirm Rollover',
      name: 'botTradeBottomSheetRolloverConfirmationButton',
      desc: '',
      args: [],
    );
  }

  /// `How It Works`
  String get howItWorks {
    return Intl.message(
      'How It Works',
      name: 'howItWorks',
      desc: '',
      args: [],
    );
  }

  /// `Market Cap`
  String get marketCap {
    return Intl.message(
      'Market Cap',
      name: 'marketCap',
      desc: '',
      args: [],
    );
  }

  /// `Prev Close`
  String get prevClose {
    return Intl.message(
      'Prev Close',
      name: 'prevClose',
      desc: '',
      args: [],
    );
  }

  /// `Your Buying Power represents the amount of cash that you can use to buy Botstocks. Your Withdrawable Balance and your Buying Power may not always be the same. For example, starting a Botstock will reduce your Buying Power and the amount value will be added to Total Botstock Values. When the Botstock is expired or terminated, the amount will be added to Buying Power and after T + 2, the amount will be also added to Withdrawable Balance. This is called ‘settlement’.`
  String get portfolioBuyingPowerToolTip {
    return Intl.message(
      'Your Buying Power represents the amount of cash that you can use to buy Botstocks. Your Withdrawable Balance and your Buying Power may not always be the same. For example, starting a Botstock will reduce your Buying Power and the amount value will be added to Total Botstock Values. When the Botstock is expired or terminated, the amount will be added to Buying Power and after T + 2, the amount will be also added to Withdrawable Balance. This is called ‘settlement’.',
      name: 'portfolioBuyingPowerToolTip',
      desc: '',
      args: [],
    );
  }

  /// `Performance`
  String get portfolioDetailPerformanceTitle {
    return Intl.message(
      'Performance',
      name: 'portfolioDetailPerformanceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Botstock Values (HKD)`
  String get portfolioDetailPerformanceBotStockValues {
    return Intl.message(
      'Botstock Values (HKD)',
      name: 'portfolioDetailPerformanceBotStockValues',
      desc: '',
      args: [],
    );
  }

  /// `Inv. Amount (HKD)`
  String get portfolioDetailPerformanceInvestmentAmount {
    return Intl.message(
      'Inv. Amount (HKD)',
      name: 'portfolioDetailPerformanceInvestmentAmount',
      desc: '',
      args: [],
    );
  }

  /// `Total P&L`
  String get portfolioDetailPerformanceTotalPL {
    return Intl.message(
      'Total P&L',
      name: 'portfolioDetailPerformanceTotalPL',
      desc: '',
      args: [],
    );
  }

  /// `Current Price {currency}`
  String portfolioCurrentPrice(String currency) {
    return Intl.message(
      'Current Price $currency',
      name: 'portfolioCurrentPrice',
      desc: '',
      args: [currency],
    );
  }

  /// `Expired at {dateTime}`
  String portfolioDetailExpiredAt(String dateTime) {
    return Intl.message(
      'Expired at $dateTime',
      name: 'portfolioDetailExpiredAt',
      desc: '',
      args: [dateTime],
    );
  }

  /// `Expired in {dateTime} days`
  String portfolioDetailExpiredIn(String dateTime) {
    return Intl.message(
      'Expired in $dateTime days',
      name: 'portfolioDetailExpiredIn',
      desc: '',
      args: [dateTime],
    );
  }

  /// `No. of Shares`
  String get portfolioDetailPerformanceNumberOfShares {
    return Intl.message(
      'No. of Shares',
      name: 'portfolioDetailPerformanceNumberOfShares',
      desc: '',
      args: [],
    );
  }

  /// `Stock Values (HKD)`
  String get portfolioDetailPerformanceStockValues {
    return Intl.message(
      'Stock Values (HKD)',
      name: 'portfolioDetailPerformanceStockValues',
      desc: '',
      args: [],
    );
  }

  /// `Cash (HKD)`
  String get portfolioDetailPerformanceCash {
    return Intl.message(
      'Cash (HKD)',
      name: 'portfolioDetailPerformanceCash',
      desc: '',
      args: [],
    );
  }

  /// `% of Bot Assets in Stock`
  String get portfolioDetailPerformanceBotAssetsInStock {
    return Intl.message(
      '% of Bot Assets in Stock',
      name: 'portfolioDetailPerformanceBotAssetsInStock',
      desc: '',
      args: [],
    );
  }

  /// `Indicates how many shares of a company are currently owned by you.`
  String get portfolioDetailPerformanceNumberOfSharesTooltip {
    return Intl.message(
      'Indicates how many shares of a company are currently owned by you.',
      name: 'portfolioDetailPerformanceNumberOfSharesTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Key Info`
  String get portfolioDetailKeyInfoTitle {
    return Intl.message(
      'Key Info',
      name: 'portfolioDetailKeyInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Days Till Expiry`
  String get portfolioDetailKeyInfoDaysTillExpiry {
    return Intl.message(
      'Days Till Expiry',
      name: 'portfolioDetailKeyInfoDaysTillExpiry',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get portfolioDetailKeyInfoStartTime {
    return Intl.message(
      'Start Time',
      name: 'portfolioDetailKeyInfoStartTime',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get portfolioDetailKeyInfoEndTime {
    return Intl.message(
      'End Time',
      name: 'portfolioDetailKeyInfoEndTime',
      desc: '',
      args: [],
    );
  }

  /// `Est. Stop Loss %`
  String get portfolioDetailKeyInfoEstimatedStopLoss {
    return Intl.message(
      'Est. Stop Loss %',
      name: 'portfolioDetailKeyInfoEstimatedStopLoss',
      desc: '',
      args: [],
    );
  }

  /// `Est. Take Profit %`
  String get portfolioDetailKeyInfoEstimatedTakeProfit {
    return Intl.message(
      'Est. Take Profit %',
      name: 'portfolioDetailKeyInfoEstimatedTakeProfit',
      desc: '',
      args: [],
    );
  }

  /// `Est. Max Loss %`
  String get portfolioDetailKeyInfoEstimatedMaxLoss {
    return Intl.message(
      'Est. Max Loss %',
      name: 'portfolioDetailKeyInfoEstimatedMaxLoss',
      desc: '',
      args: [],
    );
  }

  /// `Est, Max Profit %`
  String get portfolioDetailKeyInfoEstimatedMaxProfit {
    return Intl.message(
      'Est, Max Profit %',
      name: 'portfolioDetailKeyInfoEstimatedMaxProfit',
      desc: '',
      args: [],
    );
  }

  /// `Botstock Status`
  String get portfolioDetailKeyInfoBotStockStatus {
    return Intl.message(
      'Botstock Status',
      name: 'portfolioDetailKeyInfoBotStockStatus',
      desc: '',
      args: [],
    );
  }

  /// `Number of Rollovers`
  String get portfolioDetailKeyInfoBotStockNumberOfRollover {
    return Intl.message(
      'Number of Rollovers',
      name: 'portfolioDetailKeyInfoBotStockNumberOfRollover',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Return`
  String get portfolioDetailKeyInfoAvgReturn {
    return Intl.message(
      'Avg. Return',
      name: 'portfolioDetailKeyInfoAvgReturn',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Loss`
  String get portfolioDetailKeyInfoAvgLoss {
    return Intl.message(
      'Avg. Loss',
      name: 'portfolioDetailKeyInfoAvgLoss',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Period (Days)`
  String get portfolioDetailKeyInfoAvgPeriod {
    return Intl.message(
      'Avg. Period (Days)',
      name: 'portfolioDetailKeyInfoAvgPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Botstock`
  String get portfolioDetailButtonCancelBotStock {
    return Intl.message(
      'Cancel Botstock',
      name: 'portfolioDetailButtonCancelBotStock',
      desc: '',
      args: [],
    );
  }

  /// `End Botstock`
  String get portfolioDetailButtonEndBotStock {
    return Intl.message(
      'End Botstock',
      name: 'portfolioDetailButtonEndBotStock',
      desc: '',
      args: [],
    );
  }

  /// `Rollover Botstock`
  String get portfolioDetailButtonRolloverBotStock {
    return Intl.message(
      'Rollover Botstock',
      name: 'portfolioDetailButtonRolloverBotStock',
      desc: '',
      args: [],
    );
  }

  /// `Performance data will be available once the Botstock starts`
  String get portfolioDetailChartEmptyMessage {
    return Intl.message(
      'Performance data will be available once the Botstock starts',
      name: 'portfolioDetailChartEmptyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Past {duration} performance of {bot}  ({startDate} - {endDate})`
  String portfolioDetailChartCaption(
      String bot, String startDate, String endDate, String duration) {
    return Intl.message(
      'Past $duration performance of $bot  ($startDate - $endDate)',
      name: 'portfolioDetailChartCaption',
      desc: '',
      args: [bot, startDate, endDate, duration],
    );
  }

  /// `Total Portfolio Value`
  String get portfolioTotalValue {
    return Intl.message(
      'Total Portfolio Value',
      name: 'portfolioTotalValue',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawable Balance ({currency})`
  String portfolioWithdrawableAmount(String currency) {
    return Intl.message(
      'Withdrawable Balance ($currency)',
      name: 'portfolioWithdrawableAmount',
      desc: '',
      args: [currency],
    );
  }

  /// `Buying Power ({currency})`
  String portfolioBuyingPower(String currency) {
    return Intl.message(
      'Buying Power ($currency)',
      name: 'portfolioBuyingPower',
      desc: '',
      args: [currency],
    );
  }

  /// `Total Botstock Values ({currency})`
  String portfolioTotalBotStock(String currency) {
    return Intl.message(
      'Total Botstock Values ($currency)',
      name: 'portfolioTotalBotStock',
      desc: '',
      args: [currency],
    );
  }

  /// `Create An Account`
  String get createAnAccount {
    return Intl.message(
      'Create An Account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Back to account settings`
  String get backToAccountSettings {
    return Intl.message(
      'Back to account settings',
      name: 'backToAccountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Existing Password`
  String get existingPassword {
    return Intl.message(
      'Existing Password',
      name: 'existingPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your password does not match.`
  String get passwordDoesNotMatch {
    return Intl.message(
      'Your password does not match.',
      name: 'passwordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password Change Success`
  String get passwordChangeSuccess {
    return Intl.message(
      'Password Change Success',
      name: 'passwordChangeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed`
  String get yourPasswordHasBeenChanged {
    return Intl.message(
      'Your password has been changed',
      name: 'yourPasswordHasBeenChanged',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid password`
  String get invalidPassword {
    return Intl.message(
      'Enter valid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password cannot be the same as your old password`
  String get oldPasswordSameWithNewPasswordError {
    return Intl.message(
      'Your new password cannot be the same as your old password',
      name: 'oldPasswordSameWithNewPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account and Start Trading!`
  String get portfolioPopUpCreateAnAccountTitle {
    return Intl.message(
      'Create an Account and Start Trading!',
      name: 'portfolioPopUpCreateAnAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can manage all your investments here after you start trading. Create an account and start trading.`
  String get portfolioPopUpCreateAnAccountSubTitle {
    return Intl.message(
      'You can manage all your investments here after you start trading. Create an account and start trading.',
      name: 'portfolioPopUpCreateAnAccountSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Define Investment Style`
  String get defineInvestmentStyle {
    return Intl.message(
      'Define Investment Style',
      name: 'defineInvestmentStyle',
      desc: '',
      args: [],
    );
  }

  /// `Define Your Investment Style`
  String get portfolioPopUpDefineInvestmentTitle {
    return Intl.message(
      'Define Your Investment Style',
      name: 'portfolioPopUpDefineInvestmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven’t defined your Investment Style yet. Let’s go and see what kind of Botstocks suit you best!`
  String get portfolioPopUpDefineInvestmentSubTitle {
    return Intl.message(
      'Looks like you haven’t defined your Investment Style yet. Let’s go and see what kind of Botstocks suit you best!',
      name: 'portfolioPopUpDefineInvestmentSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue Account Opening`
  String get continueAccountOpening {
    return Intl.message(
      'Continue Account Opening',
      name: 'continueAccountOpening',
      desc: '',
      args: [],
    );
  }

  /// `Continue Account Opening`
  String get portfolioPopUpContinueAccountOpeningTitle {
    return Intl.message(
      'Continue Account Opening',
      name: 'portfolioPopUpContinueAccountOpeningTitle',
      desc: '',
      args: [],
    );
  }

  /// `You still need to complete your account opening until you can start trading. `
  String get portfolioPopUpContinueAccountOpeningSubTitle {
    return Intl.message(
      'You still need to complete your account opening until you can start trading. ',
      name: 'portfolioPopUpContinueAccountOpeningSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK!`
  String get ok {
    return Intl.message(
      'OK!',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Fund your account`
  String get portfolioPopUpFundAccountTitle {
    return Intl.message(
      'Fund your account',
      name: 'portfolioPopUpFundAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven’t funded your account yet. Deposit HKD 10,000 to activate your account.`
  String get portfolioPopUpFundAccountSubTitle {
    return Intl.message(
      'Looks like you haven’t funded your account yet. Deposit HKD 10,000 to activate your account.',
      name: 'portfolioPopUpFundAccountSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start A Botstock`
  String get startABotstock {
    return Intl.message(
      'Start A Botstock',
      name: 'startABotstock',
      desc: '',
      args: [],
    );
  }

  /// `No trading has started!`
  String get portfolioPopUpNoTradingHasStartedTitle {
    return Intl.message(
      'No trading has started!',
      name: 'portfolioPopUpNoTradingHasStartedTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can manage all your investments here after you start trading. `
  String get portfolioPopUpNoTradingHasStartedtSubTitle {
    return Intl.message(
      'You can manage all your investments here after you start trading. ',
      name: 'portfolioPopUpNoTradingHasStartedtSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Account is Pending Review`
  String get portfolioPopUpPendingReviewTitle {
    return Intl.message(
      'Your Account is Pending Review',
      name: 'portfolioPopUpPendingReviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can manage all your investments here after your account has been opened!`
  String get portfolioPopUpPendingReviewSubTitle {
    return Intl.message(
      'You can manage all your investments here after your account has been opened!',
      name: 'portfolioPopUpPendingReviewSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Your Botstock Now`
  String get redeemYourBotstockNow {
    return Intl.message(
      'Redeem Your Botstock Now',
      name: 'redeemYourBotstockNow',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Your Free Botstock`
  String get portfolioPopUpRedeemYourBotstockTitle {
    return Intl.message(
      'Redeem Your Free Botstock',
      name: 'portfolioPopUpRedeemYourBotstockTitle',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven’t claimed your free Botstock yet. Let’s get trading right away!`
  String get portfolioPopUpRedeemYourBotstockSubTitle {
    return Intl.message(
      'Looks like you haven’t claimed your free Botstock yet. Let’s get trading right away!',
      name: 'portfolioPopUpRedeemYourBotstockSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Total P/L`
  String get portfolioTotalPL {
    return Intl.message(
      'Total P/L',
      name: 'portfolioTotalPL',
      desc: '',
      args: [],
    );
  }

  /// `Your Botstocks`
  String get portfolioYourBotStock {
    return Intl.message(
      'Your Botstocks',
      name: 'portfolioYourBotStock',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get transactionHistoryTitle {
    return Intl.message(
      'Transaction History',
      name: 'transactionHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get transactionHistoryTabAll {
    return Intl.message(
      'All',
      name: 'transactionHistoryTabAll',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get transactionHistoryTabOrders {
    return Intl.message(
      'Orders',
      name: 'transactionHistoryTabOrders',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transactionHistoryTabTransfer {
    return Intl.message(
      'Transfer',
      name: 'transactionHistoryTabTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get transactionHistoryToday {
    return Intl.message(
      'Today',
      name: 'transactionHistoryToday',
      desc: '',
      args: [],
    );
  }

  /// `Total P/L is`
  String get totalPnlIs {
    return Intl.message(
      'Total P/L is',
      name: 'totalPnlIs',
      desc: '',
      args: [],
    );
  }

  /// `Notification Setting`
  String get notificationSetting {
    return Intl.message(
      'Notification Setting',
      name: 'notificationSetting',
      desc: '',
      args: [],
    );
  }

  /// `In-App`
  String get inApp {
    return Intl.message(
      'In-App',
      name: 'inApp',
      desc: '',
      args: [],
    );
  }

  /// `Industry`
  String get industry {
    return Intl.message(
      'Industry',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `Investment Period`
  String get investmentPeriod {
    return Intl.message(
      'Investment Period',
      name: 'investmentPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Push-Notification`
  String get pushNotification {
    return Intl.message(
      'Push-Notification',
      name: 'pushNotification',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sector(s)`
  String get sectors {
    return Intl.message(
      'Sector(s)',
      name: 'sectors',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out ?`
  String get signOutConfirmation {
    return Intl.message(
      'Are you sure you want to sign out ?',
      name: 'signOutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Trade`
  String get trade {
    return Intl.message(
      'Trade',
      name: 'trade',
      desc: '',
      args: [],
    );
  }

  /// `Set Up Financial Profile`
  String get setUpFinancialProfile {
    return Intl.message(
      'Set Up Financial Profile',
      name: 'setUpFinancialProfile',
      desc: '',
      args: [],
    );
  }

  /// `Do any of the following apply to you or a member of your immediate family ?`
  String get doAnyOfTheFollowingApply {
    return Intl.message(
      'Do any of the following apply to you or a member of your immediate family ?',
      name: 'doAnyOfTheFollowingApply',
      desc: '',
      args: [],
    );
  }

  /// `I am a senior executive at or a 10% or greater shareholder of a publicly traded company.`
  String get iAmASeniorExecutive {
    return Intl.message(
      'I am a senior executive at or a 10% or greater shareholder of a publicly traded company.',
      name: 'iAmASeniorExecutive',
      desc: '',
      args: [],
    );
  }

  /// `I am a senior political figure.`
  String get iAmASeniorPolitical {
    return Intl.message(
      'I am a senior political figure.',
      name: 'iAmASeniorPolitical',
      desc: '',
      args: [],
    );
  }

  /// `I am a family member or relative of a senior political figure.`
  String get iAmAFamily {
    return Intl.message(
      'I am a family member or relative of a senior political figure.',
      name: 'iAmAFamily',
      desc: '',
      args: [],
    );
  }

  /// `I am a director/employee/licensed person of a licensed corporation registered with the HK Securities and Futures Commission. (Excluding Lora Advisors Limited)`
  String get iAmADirector {
    return Intl.message(
      'I am a director/employee/licensed person of a licensed corporation registered with the HK Securities and Futures Commission. (Excluding Lora Advisors Limited)',
      name: 'iAmADirector',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// ` No`
  String get no {
    return Intl.message(
      ' No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Save For Later`
  String get saveForLater {
    return Intl.message(
      'Save For Later',
      name: 'saveForLater',
      desc: '',
      args: [],
    );
  }

  /// `Confirm & Continue`
  String get confirmAndContinue {
    return Intl.message(
      'Confirm & Continue',
      name: 'confirmAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `Your Bank Account`
  String get yourBankAccount {
    return Intl.message(
      'Your Bank Account',
      name: 'yourBankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your Bank Account is under review and will be complete by {dateTime}`
  String yourBankAccountIsUnderReview(String dateTime) {
    return Intl.message(
      'Your Bank Account is under review and will be complete by $dateTime',
      name: 'yourBankAccountIsUnderReview',
      desc: '',
      args: [dateTime],
    );
  }

  /// `Change Bank Account`
  String get changeBankAccount {
    return Intl.message(
      'Change Bank Account',
      name: 'changeBankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Note:\nWe will work with your bank in order to idenfity your bank account details (account name, bank code, account number). However, we may require additional details from you for transaction verification purposes.`
  String get noteOnPaymentDetails {
    return Intl.message(
      'Note:\nWe will work with your bank in order to idenfity your bank account details (account name, bank code, account number). However, we may require additional details from you for transaction verification purposes.',
      name: 'noteOnPaymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Your payment information is under review. Your bank account details will be shown here once your account is approved. please note it can take up to 2 working days for the approval process.`
  String get yourPaymentInformationIsUnderReview {
    return Intl.message(
      'Your payment information is under review. Your bank account details will be shown here once your account is approved. please note it can take up to 2 working days for the approval process.',
      name: 'yourPaymentInformationIsUnderReview',
      desc: '',
      args: [],
    );
  }

  /// `Need help?`
  String get needHelp {
    return Intl.message(
      'Need help?',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `No Transactions`
  String get noTransactions {
    return Intl.message(
      'No Transactions',
      name: 'noTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven’t made \nany transactions yet!`
  String get noTransactionsYet {
    return Intl.message(
      'Looks like you haven’t made \nany transactions yet!',
      name: 'noTransactionsYet',
      desc: '',
      args: [],
    );
  }

  /// `Performance`
  String get performance {
    return Intl.message(
      'Performance',
      name: 'performance',
      desc: '',
      args: [],
    );
  }

  /// `Milestones`
  String get milestones {
    return Intl.message(
      'Milestones',
      name: 'milestones',
      desc: '',
      args: [],
    );
  }

  /// `Start Investing`
  String get startInvesting {
    return Intl.message(
      'Start Investing',
      name: 'startInvesting',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Evaluation`
  String get privacyEvaluation {
    return Intl.message(
      'Privacy Evaluation',
      name: 'privacyEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Personalisation`
  String get personalisation {
    return Intl.message(
      'Personalisation',
      name: 'personalisation',
      desc: '',
      args: [],
    );
  }

  /// `Open Investment Account`
  String get openInvestmentAccount {
    return Intl.message(
      'Open Investment Account',
      name: 'openInvestmentAccount',
      desc: '',
      args: [],
    );
  }

  /// `Get the First Botstock for Free`
  String get getTheFirstBotstockForFree {
    return Intl.message(
      'Get the First Botstock for Free',
      name: 'getTheFirstBotstockForFree',
      desc: '',
      args: [],
    );
  }

  /// `Pay Deposit to Start Real Trade`
  String get payDepositToStartRealTrade {
    return Intl.message(
      'Pay Deposit to Start Real Trade',
      name: 'payDepositToStartRealTrade',
      desc: '',
      args: [],
    );
  }

  /// `Trade with Bots`
  String get tradeWithBots {
    return Intl.message(
      'Trade with Bots',
      name: 'tradeWithBots',
      desc: '',
      args: [],
    );
  }

  /// `Introduce Bot - Plank`
  String get introduceBotPlank {
    return Intl.message(
      'Introduce Bot - Plank',
      name: 'introduceBotPlank',
      desc: '',
      args: [],
    );
  }

  /// `Introduce Bot - Pullup`
  String get introduceBotPullup {
    return Intl.message(
      'Introduce Bot - Pullup',
      name: 'introduceBotPullup',
      desc: '',
      args: [],
    );
  }

  /// `Introduce Bot - Squat`
  String get introduceBotSquat {
    return Intl.message(
      'Introduce Bot - Squat',
      name: 'introduceBotSquat',
      desc: '',
      args: [],
    );
  }

  /// `Trade with Your First Botstock`
  String get tradeWithYourFirstBotstock {
    return Intl.message(
      'Trade with Your First Botstock',
      name: 'tradeWithYourFirstBotstock',
      desc: '',
      args: [],
    );
  }

  /// `Master AI Trading`
  String get masterAiTrading {
    return Intl.message(
      'Master AI Trading',
      name: 'masterAiTrading',
      desc: '',
      args: [],
    );
  }

  /// `Learn Botstock Management`
  String get learnBotstockManagement {
    return Intl.message(
      'Learn Botstock Management',
      name: 'learnBotstockManagement',
      desc: '',
      args: [],
    );
  }

  /// `Manage Your Botstock`
  String get manageYourBotstock {
    return Intl.message(
      'Manage Your Botstock',
      name: 'manageYourBotstock',
      desc: '',
      args: [],
    );
  }

  /// `Trade with a New Botstock`
  String get tradeWithANewBotstock {
    return Intl.message(
      'Trade with a New Botstock',
      name: 'tradeWithANewBotstock',
      desc: '',
      args: [],
    );
  }

  /// `Unable to Process Deposit`
  String get unableToProcessDepositTitle {
    return Intl.message(
      'Unable to Process Deposit',
      name: 'unableToProcessDepositTitle',
      desc: '',
      args: [],
    );
  }

  /// `We’re having some trouble processing your deposit request. Please try again`
  String get unableToProcessDepositSubTitle {
    return Intl.message(
      'We’re having some trouble processing your deposit request. Please try again',
      name: 'unableToProcessDepositSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unable to Process Withdrawal`
  String get unableToProcessWithdrawalTitle {
    return Intl.message(
      'Unable to Process Withdrawal',
      name: 'unableToProcessWithdrawalTitle',
      desc: '',
      args: [],
    );
  }

  /// `We’re having some trouble processing your withdrawal request. Please try again`
  String get unableToProcessWithdrawalSubTitle {
    return Intl.message(
      'We’re having some trouble processing your withdrawal request. Please try again',
      name: 'unableToProcessWithdrawalSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Account Suspended`
  String get suspendedScreenTitle {
    return Intl.message(
      'Account Suspended',
      name: 'suspendedScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been suspended and is pending investigation from us. If you have any questions about your account, please contact our customer service team.`
  String get suspendedScreenSubTitle {
    return Intl.message(
      'Your account has been suspended and is pending investigation from us. If you have any questions about your account, please contact our customer service team.',
      name: 'suspendedScreenSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start your new investing journey with Lora - \nYour FinFit Coach`
  String get signUpTitle {
    return Intl.message(
      'Start your new investing journey with Lora - \nYour FinFit Coach',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Transaction fee`
  String get transactionFee {
    return Intl.message(
      'Transaction fee',
      name: 'transactionFee',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to`
  String get transferTo {
    return Intl.message(
      'Transfer to',
      name: 'transferTo',
      desc: '',
      args: [],
    );
  }

  /// `Time Requested`
  String get timeRequested {
    return Intl.message(
      'Time Requested',
      name: 'timeRequested',
      desc: '',
      args: [],
    );
  }

  /// `Time Completed`
  String get timeCompleted {
    return Intl.message(
      'Time Completed',
      name: 'timeCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get totalAmount {
    return Intl.message(
      'Total amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Get your Investments in Shape`
  String get welcomeScreenTitle {
    return Intl.message(
      'Get your Investments in Shape',
      name: 'welcomeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Say Goodbye to bad investing habits and embrace your new AI assistant, Asklora!`
  String get welcomeScreenSubTitle {
    return Intl.message(
      'Say Goodbye to bad investing habits and embrace your new AI assistant, Asklora!',
      name: 'welcomeScreenSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Guidance from your own personal AI`
  String get welcomeScreenFirstBenefit {
    return Intl.message(
      'Guidance from your own personal AI',
      name: 'welcomeScreenFirstBenefit',
      desc: '',
      args: [],
    );
  }

  /// `Personalised Experience`
  String get welcomeScreenSecondBenefit {
    return Intl.message(
      'Personalised Experience',
      name: 'welcomeScreenSecondBenefit',
      desc: '',
      args: [],
    );
  }

  /// `Automated trading strategies`
  String get welcomeScreenThirdBenefit {
    return Intl.message(
      'Automated trading strategies',
      name: 'welcomeScreenThirdBenefit',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Amount`
  String get withdrawalAmount {
    return Intl.message(
      'Withdrawal Amount',
      name: 'withdrawalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Your withdrawal can take up to 2 working days.`
  String get withdrawalWorkingDays {
    return Intl.message(
      'Your withdrawal can take up to 2 working days.',
      name: 'withdrawalWorkingDays',
      desc: '',
      args: [],
    );
  }

  /// `Your withdrawal request is submitted.`
  String get withdrawalRequestSubmittedTitle {
    return Intl.message(
      'Your withdrawal request is submitted.',
      name: 'withdrawalRequestSubmittedTitle',
      desc: '',
      args: [],
    );
  }

  /// `You will be informed via email and app notification as soon as the funds are paid to your account.`
  String get withdrawalRequestSubmittedSubTitle {
    return Intl.message(
      'You will be informed via email and app notification as soon as the funds are paid to your account.',
      name: 'withdrawalRequestSubmittedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get withdraw {
    return Intl.message(
      'Withdraw',
      name: 'withdraw',
      desc: '',
      args: [],
    );
  }

  /// `relearn`
  String get relearn {
    return Intl.message(
      'relearn',
      name: 'relearn',
      desc: '',
      args: [],
    );
  }

  /// `~{minute} min`
  String min(String minute) {
    return Intl.message(
      '~$minute min',
      name: 'min',
      desc: '',
      args: [minute],
    );
  }

  /// `View Deposit Guide`
  String get viewDepositGuide {
    return Intl.message(
      'View Deposit Guide',
      name: 'viewDepositGuide',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit Asklora`
  String get pressBackAgain {
    return Intl.message(
      'Press back again to exit Asklora',
      name: 'pressBackAgain',
      desc: '',
      args: [],
    );
  }

  /// `Trade Summary`
  String get tradeSummary {
    return Intl.message(
      'Trade Summary',
      name: 'tradeSummary',
      desc: '',
      args: [],
    );
  }

  /// `Market Price`
  String get marketPrice {
    return Intl.message(
      'Market Price',
      name: 'marketPrice',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Trade`
  String get confirmTrade {
    return Intl.message(
      'Confirm Trade',
      name: 'confirmTrade',
      desc: '',
      args: [],
    );
  }

  /// `Check Botstock Details`
  String get checkBotStockDetails {
    return Intl.message(
      'Check Botstock Details',
      name: 'checkBotStockDetails',
      desc: '',
      args: [],
    );
  }

  /// `Trade Request Received`
  String get tradeRequestReceived {
    return Intl.message(
      'Trade Request Received',
      name: 'tradeRequestReceived',
      desc: '',
      args: [],
    );
  }

  /// `Trade Cancelled`
  String get tradeCancelledTitle {
    return Intl.message(
      'Trade Cancelled',
      name: 'tradeCancelledTitle',
      desc: '',
      args: [],
    );
  }

  /// `The trade has been cancelled and your investment amount has been returned to your account`
  String get tradeCancelledSubtitle {
    return Intl.message(
      'The trade has been cancelled and your investment amount has been returned to your account',
      name: 'tradeCancelledSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{botName} {botSymbol} will start at {dateTime}`
  String rolloverBotStockAcknowledgement(
      String botName, String botSymbol, String dateTime) {
    return Intl.message(
      '$botName $botSymbol will start at $dateTime',
      name: 'rolloverBotStockAcknowledgement',
      desc: '',
      args: [botName, botSymbol, dateTime],
    );
  }

  /// `You are making great\nprogress, {name}!`
  String beforeKYCHeaderTitle(String name) {
    return Intl.message(
      'You are making great\nprogress, $name!',
      name: 'beforeKYCHeaderTitle',
      desc: '',
      args: [name],
    );
  }

  /// `{botName} {botSymbol} will end at {dateTime}`
  String endBotStockAcknowledgement(
      String botName, String botSymbol, String dateTime) {
    return Intl.message(
      '$botName $botSymbol will end at $dateTime',
      name: 'endBotStockAcknowledgement',
      desc: '',
      args: [botName, botSymbol, dateTime],
    );
  }

  /// `Just one more step to AI\ngreatness, {name}!`
  String beforeDepositHeaderTitle(String name) {
    return Intl.message(
      'Just one more step to AI\ngreatness, $name!',
      name: 'beforeDepositHeaderTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Your investment account will be ready soon!`
  String get afterPayDepositHeaderTitle {
    return Intl.message(
      'Your investment account will be ready soon!',
      name: 'afterPayDepositHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Great start!`
  String get greatStart {
    return Intl.message(
      'Great start!',
      name: 'greatStart',
      desc: '',
      args: [],
    );
  }

  /// `Halfway there!`
  String get halfWayThere {
    return Intl.message(
      'Halfway there!',
      name: 'halfWayThere',
      desc: '',
      args: [],
    );
  }

  /// `Almost finished!`
  String get almostFinished {
    return Intl.message(
      'Almost finished!',
      name: 'almostFinished',
      desc: '',
      args: [],
    );
  }

  /// `Start investing`
  String get startInvestingOnMilestone {
    return Intl.message(
      'Start investing',
      name: 'startInvestingOnMilestone',
      desc: '',
      args: [],
    );
  }

  /// `Deposit funds to start investing`
  String get depositFundToStartInvesting {
    return Intl.message(
      'Deposit funds to start investing',
      name: 'depositFundToStartInvesting',
      desc: '',
      args: [],
    );
  }

  /// `You’ve completed all the steps to opening an account with Asklora! You’ll be able to start trading as soon as your account is approved. It usually takes up to 2 business days.`
  String get onBoardingCompletionMessage {
    return Intl.message(
      'You’ve completed all the steps to opening an account with Asklora! You’ll be able to start trading as soon as your account is approved. It usually takes up to 2 business days.',
      name: 'onBoardingCompletionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get nextStep {
    return Intl.message(
      'Next step',
      name: 'nextStep',
      desc: '',
      args: [],
    );
  }

  /// `Go`
  String get go {
    return Intl.message(
      'Go',
      name: 'go',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
