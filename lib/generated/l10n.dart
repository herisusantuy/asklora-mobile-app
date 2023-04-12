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

  /// `CANCEL`
  String get buttonCancel {
    return Intl.message(
      'CANCEL',
      name: 'buttonCancel',
      desc: '',
      args: [],
    );
  }

  /// `CONFIRM`
  String get buttonConfirm {
    return Intl.message(
      'CONFIRM',
      name: 'buttonConfirm',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get buttonNext {
    return Intl.message(
      'NEXT',
      name: 'buttonNext',
      desc: '',
      args: [],
    );
  }

  /// `NOT NOW`
  String get buttonNotNow {
    return Intl.message(
      'NOT NOW',
      name: 'buttonNotNow',
      desc: '',
      args: [],
    );
  }

  /// `RELOAD PAGE`
  String get buttonReloadPage {
    return Intl.message(
      'RELOAD PAGE',
      name: 'buttonReloadPage',
      desc: '',
      args: [],
    );
  }

  /// `DEPOSIT`
  String get buttonDeposit {
    return Intl.message(
      'DEPOSIT',
      name: 'buttonDeposit',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL TRADE`
  String get buttonCancelTrade {
    return Intl.message(
      'CANCEL TRADE',
      name: 'buttonCancelTrade',
      desc: '',
      args: [],
    );
  }

  /// `CREATE AN ACCOUNT`
  String get buttonCreateAnAccount {
    return Intl.message(
      'CREATE AN ACCOUNT',
      name: 'buttonCreateAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `HAVE AN ACCOUNT?`
  String get buttonHaveAnAccount {
    return Intl.message(
      'HAVE AN ACCOUNT?',
      name: 'buttonHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `LET’S BEGIN`
  String get buttonLetsBegin {
    return Intl.message(
      'LET’S BEGIN',
      name: 'buttonLetsBegin',
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

  /// `Unable to get information`
  String get errorGettingInformationTitle {
    return Intl.message(
      'Unable to get information',
      name: 'errorGettingInformationTitle',
      desc: '',
      args: [],
    );
  }

  /// `There was an error when trying to get {detail}. Please try reloading the page`
  String errorGettingInformationSubTitle(String detail) {
    return Intl.message(
      'There was an error when trying to get $detail. Please try reloading the page',
      name: 'errorGettingInformationSubTitle',
      desc: '',
      args: [detail],
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

  /// ` DEPOSIT TO START TRADING`
  String get botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle {
    return Intl.message(
      ' DEPOSIT TO START TRADING',
      name: 'botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `The investment amount and Bot management fee (HKD1,500) will be returned to your account.`
  String get botTradeBottomSheetCancelBotStockConfirmationTitle {
    return Intl.message(
      'The investment amount and Bot management fee (HKD1,500) will be returned to your account.',
      name: 'botTradeBottomSheetCancelBotStockConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `CONFIRM ROLLOVER`
  String get botTradeBottomSheetRolloverConfirmationButton {
    return Intl.message(
      'CONFIRM ROLLOVER',
      name: 'botTradeBottomSheetRolloverConfirmationButton',
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

  /// `Expired in ${dateTime} days`
  String portfolioDetailExpiredIn(String dateTime) {
    return Intl.message(
      'Expired in \$$dateTime days',
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

  /// `Investment Period`
  String get portfolioDetailKeyInfoInvestmentPeriod {
    return Intl.message(
      'Investment Period',
      name: 'portfolioDetailKeyInfoInvestmentPeriod',
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

  /// `CANCEL BOTSTOCK`
  String get portfolioDetailButtonCancelBotStock {
    return Intl.message(
      'CANCEL BOTSTOCK',
      name: 'portfolioDetailButtonCancelBotStock',
      desc: '',
      args: [],
    );
  }

  /// `END BOTSTOCK`
  String get portfolioDetailButtonEndBotStock {
    return Intl.message(
      'END BOTSTOCK',
      name: 'portfolioDetailButtonEndBotStock',
      desc: '',
      args: [],
    );
  }

  /// `ROLLOVER BOTSTOCK`
  String get portfolioDetailButtonRolloverBotStock {
    return Intl.message(
      'ROLLOVER BOTSTOCK',
      name: 'portfolioDetailButtonRolloverBotStock',
      desc: '',
      args: [],
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

  /// `Total Portfolio Value ({currency})`
  String portfolioWithdrawableAmount(String currency) {
    return Intl.message(
      'Total Portfolio Value ($currency)',
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
