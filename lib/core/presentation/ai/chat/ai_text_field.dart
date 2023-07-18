import 'package:flutter/material.dart';

import '../../../styles/asklora_colors.dart';
import '../../text_fields/style/text_field_style.dart';
import '../buttons/ai_send_text_button.dart';

class AiTextField extends StatefulWidget {
  final Function(String) onFieldSubmitted;
  final Function(String) onChanged;
  final VoidCallback onTap;

  const AiTextField(
      {required this.onFieldSubmitted,
      required this.onChanged,
      required this.onTap,
      super.key});

  @override
  State<AiTextField> createState() => _AiTextFieldState();
}

class _AiTextFieldState extends State<AiTextField> {
  late final TextEditingController controller;
  bool focused = false;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FocusScope(
            onFocusChange: (focus) {
              setState(() {
                focused = focus;
              });
            },
            child: TextFormField(
                cursorColor: AskLoraColors.white,
                onFieldSubmitted: widget.onFieldSubmitted,
                controller: controller,
                onChanged: widget.onChanged,
                maxLines: 5,
                minLines: 1,
                style: TextFieldStyle.valueTextStyle
                    .copyWith(color: AskLoraColors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 18),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )).copyWith(
                        borderSide:
                            const BorderSide(color: AskLoraColors.whiteSmoke)),
                    focusedBorder: TextFieldStyle.focusedBorder.copyWith(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    hintText: 'Ask me anything...',
                    hintStyle: TextFieldStyle.valueTextStyle
                        .copyWith(color: AskLoraColors.white),
                    fillColor: AskLoraColors.white.withOpacity(0.05),
                    filled: !focused && controller.text.isEmpty)),
          ),
        ),
        const SizedBox(width: 14),
        AiSendTextButton(
          size: const Size(55, 55),
          onTap: () {
            widget.onTap();
            controller.text = '';
          },
        ),
      ],
    );
  }
}
