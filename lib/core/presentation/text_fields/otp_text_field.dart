import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';

class OtpTextField extends StatefulWidget {
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final String label;
  final String errorText;

  const OtpTextField({
    Key? key,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.label = '',
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
      borderSide: BorderSide(color: AskLoraColors.green, width: 2));

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
        label = Text(widget.label);
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AskLoraColors.green,
              ),
        ),
        child: TextFormField(
          controller: controller,
          textCapitalization: widget.textCapitalization,
          initialValue: widget.initialValue,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
            suffixIcon: const ResendOtpButton(),
            floatingLabelBehavior: floatingLabelBehavior,
            label: label,
            hintStyle: const TextStyle(color: AskLoraColors.darkGray),
            hintText: 'One-time-password (4 digit)',
            border: nonFocusedBorder,
            focusedBorder: focusedBorder,
            errorBorder: nonFocusedBorder,
            focusedErrorBorder: focusedBorder,
            errorStyle: const TextStyle(color: AskLoraColors.magenta),
            labelStyle: const TextStyle(color: Colors.black),
            filled: false,
          ),
        ),
      );
}

class ResendOtpButton extends StatefulWidget {
  const ResendOtpButton({Key? key}) : super(key: key);

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
