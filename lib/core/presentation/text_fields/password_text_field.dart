import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import '../../utils/extensions.dart';
import 'style/text_field_style.dart';

class PasswordTextField extends StatefulWidget {
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final List<TextInputFormatter>? textInputFormatterList;
  final String label;
  final String hintText;
  final String errorText;
  final Function(bool) validPassword;
  final Function(String)? onChanged;

  const PasswordTextField({
    Key? key,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.textInputFormatterList,
    this.label = '',
    this.hintText = '',
    this.errorText = '',
    required this.validPassword,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController controller = TextEditingController();

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;
  bool obscureText = true;
  bool minEightCharacters = false;
  bool containsLowerCase = false;
  bool containsUpperCase = false;
  bool containsNumber = false;
  Widget? label;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      _setFloatingLabelBehavior();
      _textValidation();
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

  void _textValidation() {
    setState(() {
      minEightCharacters = controller.text.length >= 8;
      containsLowerCase = controller.text.containsLowercase;
      containsUpperCase = controller.text.containsUppercase;
      containsNumber = controller.text.containsNumber;
    });
    widget.validPassword(minEightCharacters &&
            containsLowerCase &&
            containsUpperCase &&
            containsNumber
        ? true
        : false);
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AskLoraColors.green,
              ),
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              onChanged: widget.onChanged,
              textCapitalization: widget.textCapitalization,
              initialValue: widget.initialValue,
              inputFormatters: widget.textInputFormatterList,
              obscureText: obscureText,
              decoration: TextFieldStyle.inputDecoration.copyWith(
                  floatingLabelBehavior: floatingLabelBehavior,
                  label: label,
                  hintText: widget.hintText,
                  errorText: widget.errorText.isEmpty ? null : widget.errorText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      obscureText
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                    ),
                  )),
            ),
            const SizedBox(
              height: 6,
            ),
            ..._errorCheckWidgets
          ],
        ),
      );

  List<Widget> get _errorCheckWidgets => [
        _errorWidget(
            label: 'min. 8 characters', checkPassed: minEightCharacters),
        _errorWidget(
            label: 'at least 1 lowercase letter',
            checkPassed: containsLowerCase),
        _errorWidget(
            label: 'at least 1 uppercase letter',
            checkPassed: containsUpperCase),
        _errorWidget(label: 'at least 1 number', checkPassed: containsNumber),
      ];

  Widget _errorWidget({required String label, bool checkPassed = false}) =>
      Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Row(
          children: [
            Icon(
              checkPassed ? Icons.check : Icons.close,
              color: checkPassed ? AskLoraColors.green : AskLoraColors.magenta,
              size: 10,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 9, color: Colors.grey[600]),
            )
          ],
        ),
      );
}
