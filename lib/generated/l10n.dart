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

  /// `NEXT`
  String get buttonNext {
    return Intl.message(
      'NEXT',
      name: 'buttonNext',
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

  /// `Do you want to continue the Botstock and extend the investment period?\n\n 2 Weeks\n`
  String get botTradeBottomSheetRolloverConfirmationTitle {
    return Intl.message(
      'Do you want to continue the Botstock and extend the investment period?\\n\\n 2 Weeks\\n',
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

  /// `Your free Botstock has been added to your portfolio successfully!`
  String get botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle {
    return Intl.message(
      'Your free Botstock has been added to your portfolio successfully!',
      name: 'botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle',
      desc: '',
      args: [],
    );
  }

  /// `DEPOSIT TO START REAL TRADE`
  String get botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle {
    return Intl.message(
      'DEPOSIT TO START REAL TRADE',
      name: 'botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle',
      desc: '',
      args: [],
    );
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

  /// `Office Hours`
  String get officeHours {
    return Intl.message(
      'Office Hours',
      name: 'officeHours',
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
