import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../styles/asklora_colors.dart';
import '../../custom_text.dart';

class LocalizationToggleButton extends StatelessWidget {
  const LocalizationToggleButton()
      : super(key: const Key('localization_toggle_button'));

  @override
  Widget build(BuildContext context) => AnimatedToggle(onLanguageChange: (val) {
        context.read<AppBloc>().add(AppLanguageChangeEvent(val));
      });
}

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({super.key, required this.onLanguageChange});

  final Function(LocaleType) onLanguageChange;

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 110,
        height: 36,
        child: Stack(children: <Widget>[
          GestureDetector(
              onTap: () async {
                initialPosition = !initialPosition;
                LocaleType localeType = initialPosition
                    ? LocaleType.supportedLocales()[0]
                    : LocaleType.supportedLocales()[1];
                widget.onLanguageChange(localeType);
                setState(() {});
              },
              child: Container(
                  width: 110,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: AskLoraColors.lightGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        LocaleType.supportedLocales().length,
                        (index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomText(
                              LocaleType.supportedLocales()[index].label,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              type: FontType.smallNote,
                              color: AskLoraColors.darkGray,
                            ))),
                  ))),
          AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              alignment: initialPosition
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                  margin: const EdgeInsets.all(4),
                  width: 52,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: AskLoraColors.charcoal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    initialPosition
                        ? LocaleType.supportedLocales()[0].label
                        : LocaleType.supportedLocales()[1].label,
                    fontWeight: FontWeight.w700,
                    type: FontType.smallNote,
                    color: Colors.white,
                  )))
        ]));
  }
}

class LocaleType {
  final String languageCode;
  final String countryCode;
  final String label;
  final String labelName;
  final String fontType;

  const LocaleType(this.languageCode, this.countryCode, this.label,
      this.labelName, this.fontType);

  static List<LocaleType> supportedLocales() => [
        const LocaleType('en', 'US', 'ENG', 'English', 'Mulish'),
        const LocaleType('zh', 'HK', '中', '繁體中文', 'NotoSansTC')
      ];

  static LocaleType defaultFont() =>
      const LocaleType('en', 'US', 'ENG', 'English', 'Mulish');
}
