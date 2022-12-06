import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import 'style/text_field_style.dart';

class OtpTextField extends StatefulWidget {
  final String? initialValue;
  final String errorText;
  final VoidCallback onSendOtpTap;
  final Function(String)? onChanged;

  const OtpTextField({
    Key? key,
    this.onChanged,
    this.initialValue,
    required this.onSendOtpTap,
    this.errorText = '',
  }) : super(key: key);

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final TextEditingController controller = TextEditingController();
  final OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));

  final OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AskLoraColors.primaryGreen, width: 2));

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;
  Widget? label;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      _setFloatingLabelBehavior();
    });
  }

  void _setFloatingLabelBehavior() {
    setState(() {
      if (controller.text.isEmpty) {
        label = null;
        floatingLabelBehavior = FloatingLabelBehavior.never;
      } else {
        label = const Text('One-time-password');
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AskLoraColors.primaryGreen,
              ),
        ),
        child: TextFormField(
          controller: controller,
          onChanged: widget.onChanged,
          initialValue: widget.initialValue,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
          ],
          keyboardType: TextInputType.number,
          decoration: TextFieldStyle.inputDecoration.copyWith(
              floatingLabelBehavior: floatingLabelBehavior,
              label: label,
              hintText: 'One-time-password (4 digit)',
              errorText: widget.errorText.isEmpty ? null : widget.errorText,
              suffixIcon: ResendOtpButton(onSendOtpTap: widget.onSendOtpTap)),
        ),
      );
}

class ResendOtpButton extends StatefulWidget {
  final VoidCallback onSendOtpTap;

  const ResendOtpButton({required this.onSendOtpTap, Key? key})
      : super(key: key);

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  bool disable = false;
  int time = 60;
  late Timer timer;

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (!disable) {
                widget.onSendOtpTap();
                setState(() {
                  disable = true;
                });
                timer = Timer.periodic(
                  const Duration(seconds: 1),
                  (Timer timer) {
                    if (time == 0) {
                      setState(() {
                        disable = false;
                        time = 60;
                        timer.cancel();
                      });
                    } else {
                      setState(() {
                        time--;
                      });
                    }
                  },
                );
              }
            },
            child: Center(
              child: Text(
                disable ? 'RE-SEND IN $time' : 'SEND OTP',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: disable ? Colors.grey[400] : Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
