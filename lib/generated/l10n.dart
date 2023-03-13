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

  /// `Guidance From Your AI Coach`
  String get carouselIntro2 {
    return Intl.message(
      'Guidance From Your AI Coach',
      name: 'carouselIntro2',
      desc: '',
      args: [],
    );
  }

  /// `Personalised Experience`
  String get carouselIntro3 {
    return Intl.message(
      'Personalised Experience',
      name: 'carouselIntro3',
      desc: '',
      args: [],
    );
  }

  /// `Trade with Ease and Strategy`
  String get carouselIntro4 {
    return Intl.message(
      'Trade with Ease and Strategy',
      name: 'carouselIntro4',
      desc: '',
      args: [],
    );
  }

  /// `Hi! I'm Lora, your AI investment coach. What should I call you?`
  String get askNameScreenPlaceholder {
    return Intl.message(
      'Hi! I\'m Lora, your AI investment coach. What should I call you?',
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

  /// `You’re starting a NEW investment journey. Let’s give you a new and different name - Sassy {name}！`
  String greetingScreenPlaceholder(String name) {
    return Intl.message(
      'You’re starting a NEW investment journey. Let’s give you a new and different name - Sassy $name！',
      name: 'greetingScreenPlaceholder',
      desc: '',
      args: [name],
    );
  }

  /// `Hi {name}! How long have you been investing in stocks until now, aside from MPFs?`
  String ppiQuestion1(String name) {
    return Intl.message(
      'Hi $name! How long have you been investing in stocks until now, aside from MPFs?',
      name: 'ppiQuestion1',
      desc: '',
      args: [name],
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

  /// `This is the estimated maximum target profit % level for the Bot strategy. The Pull-up bot will try to close the trade (sell stocks) and capture profits when profits reach this % level. This is an estimated level.`
  String get tooltipBotDetailsEstMaxProfit {
    return Intl.message(
      'This is the estimated maximum target profit % level for the Bot strategy. The Pull-up bot will try to close the trade (sell stocks) and capture profits when profits reach this % level. This is an estimated level.',
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
