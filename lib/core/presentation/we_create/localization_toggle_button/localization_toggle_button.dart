import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles/asklora_colors.dart';
import '../../custom_text_new.dart';
import 'bloc/localization_bloc.dart';

class LocalizationToggleButton extends StatelessWidget {
  const LocalizationToggleButton()
      : super(key: const Key('localization_toggle_button'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LocalizationBloc(),
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
          return AnimatedToggle(
              onLanguageChange: (val) => context
                  .read<LocalizationBloc>()
                  .add((LocalizationChanged(localizationType: val))));
        }));
  }
}

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({super.key, required this.onLanguageChange});

  final Function(LocalizationType) onLanguageChange;

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
              onTap: () {
                initialPosition = !initialPosition;
                widget.onLanguageChange(initialPosition
                    ? LocalizationType.english
                    : LocalizationType.chinese);
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
                        LocalizationType.values.length,
                        (index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomTextNew(
                              LocalizationType.values.elementAt(index).value,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
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
                  child: CustomTextNew(
                    initialPosition
                        ? LocalizationType.english.value
                        : LocalizationType.chinese.value,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.white,
                  )))
        ]));
  }
}
