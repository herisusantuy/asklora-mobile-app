import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../styles/asklora_colors.dart';
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
        width: 100,
        height: 38,
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
                  width: 100,
                  height: 38,
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
                            child: CustomText(
                              LocalizationType.values.elementAt(index).value,
                              textAlign: TextAlign.center,
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
                  width: 50,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: AskLoraColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    initialPosition
                        ? LocalizationType.english.value
                        : LocalizationType.chinese.value,
                    type: FontType.smallNoteBold,
                    color: Colors.white,
                  )))
        ]));
  }
}
