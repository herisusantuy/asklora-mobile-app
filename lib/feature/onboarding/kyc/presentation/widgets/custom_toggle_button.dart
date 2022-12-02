import 'package:flutter/material.dart';

import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/custom_text.dart';

class CustomToggleButton extends StatelessWidget {
  final String? title;
  final EdgeInsets padding;
  final Pair<String, String> choices;
  final String? initialValue;
  final Function(String) onSelected;

  const CustomToggleButton(
      {this.title,
      required this.choices,
      required this.onSelected,
      this.initialValue,
      this.padding = EdgeInsets.zero,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LayoutBuilder(builder: (context, constraint) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              CustomText(
                title!,
                padding: const EdgeInsets.only(bottom: 14),
                type: FontType.bodyTextBold,
              ),
            Row(
              children: [
                _choicesWidget(
                    choice: choices.left,
                    selected: initialValue == choices.left,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                _choicesWidget(
                    choice: choices.right,
                    selected: initialValue == choices.right,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)))
              ],
            )
          ],
        );
      }),
    );
  }

  Widget _choicesWidget(
      {required String choice,
      required bool selected,
      required BorderRadius borderRadius}) {
    return Expanded(
      child: GestureDetector(
        key:Key('$title-$choice'),
        onTap: () => onSelected(choice),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff424b5a), width: 0.8),
            borderRadius: borderRadius,
            color: selected ? const Color(0xff424b5a) : Colors.white,
          ),
          constraints: const BoxConstraints(minHeight: 44),
          child: Center(
              child: CustomText(
            choice,
            color: selected ? Colors.white : Colors.black,
          )),
        ),
      ),
    );
  }
}
