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

  static String m0(name) =>
      "You’re starting a NEW investment journey. Let’s give you a new and different name - Sassy ${name}！";

  static String m1(name) =>
      "Hi ${name}! How long have you been investing in stocks until now, aside from MPFs?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "askNameScreenPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Hi! I\'m Lora, your AI investment coach. What should I call you?"),
        "askNameScreenTextFieldHint":
            MessageLookupByLibrary.simpleMessage("Your Name"),
        "buttonCreateAnAccount":
            MessageLookupByLibrary.simpleMessage("CREATE AN ACCOUNT"),
        "buttonHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("HAVE AN ACCOUNT?"),
        "buttonLetsBegin": MessageLookupByLibrary.simpleMessage("LET’S BEGIN"),
        "buttonNext": MessageLookupByLibrary.simpleMessage("NEXT"),
        "carouselIntro1": MessageLookupByLibrary.simpleMessage(
            "Get your Investments in Shape"),
        "carouselIntro2":
            MessageLookupByLibrary.simpleMessage("Guidance From Your AI Coach"),
        "carouselIntro3":
            MessageLookupByLibrary.simpleMessage("Personalised Experience"),
        "carouselIntro4": MessageLookupByLibrary.simpleMessage(
            "Trade with Ease and Strategy"),
        "greetingScreenPlaceholder": m0,
        "ppiQuestion1": m1
      };
}
