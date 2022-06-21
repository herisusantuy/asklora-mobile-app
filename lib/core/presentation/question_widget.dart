import 'package:flutter/material.dart';

import '../styles/color.dart';
import 'custom_text.dart';

class QuestionWidget extends StatelessWidget {
  final EdgeInsets padding;
  final String questionText;
  final List<String> options;
  final void Function(String) onSelected;
  final String? selectedAnswer;
  final String errorText;
  const QuestionWidget({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.questionText = '',
    required this.options,
    required this.onSelected,
    this.selectedAnswer,
    this.errorText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (questionText.isNotEmpty)
            CustomText(
              questionText,
              type: FontType.bodyTextBold,
            ),
          Column(
            children: options.map(
              (choice) {
                bool? selectedOption = choice == selectedAnswer;
                return buildOptions(selectedOption, choice);
              },
            ).toList(),
          ),
          if (errorText.isNotEmpty)
            CustomText(
              errorText,
              padding: const EdgeInsets.only(top: 5),
              type: FontType.smallText,
              color: COLORS.down,
            ),
        ],
      ),
    );
  }

  Widget buildOptions(bool condition, String choice) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Material(
        color: _backgroundColor(condition),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: _borderColor(condition),
            ),
            borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {
            onSelected(choice);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    choice,
                    color: _textColor(condition),
                    type: _textTypeStyle(condition),
                  ),
                ),
                _iconCheck(condition),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _borderColor(condition) {
    if (condition) {
      return COLORS.primary;
    } else {
      return Colors.black38;
    }
  }

  Color _backgroundColor(condition) {
    return condition ? COLORS.primary.withAlpha(30) : Colors.transparent;
  }

  Color _textColor(condition) {
    return condition ? COLORS.primary : COLORS.text;
  }

  FontType _textTypeStyle(condition) {
    return condition ? FontType.smallTextBold : FontType.smallText;
  }

  Widget _iconCheck(condition) {
    if (condition) {
      return const Icon(
        Icons.check,
        size: 20,
        color: COLORS.primary,
      );
    } else {
      return const SizedBox(
        height: 20,
      );
    }
  }
}
