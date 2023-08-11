part of 'otp_form.dart';

class OtpBox extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final int length;
  final double _spaceBetween = 8;
  final TextStyle textStyle;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final bool enabled;

  double _fieldWidth(BuildContext context) =>
      (MediaQuery.of(context).size.width - _spaceBetween * (length + 1) * 2) /
      length;

  const OtpBox(
      {this.onChanged,
      this.onCompleted,
      this.length = 6,
      this.textStyle = const TextStyle(fontSize: 16),
      this.textInputType = TextInputType.number,
      this.textInputFormatterList,
      this.enabled = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      enabled: enabled,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      keyboardType: textInputType,
      appContext: context,
      length: length,
      animationType: AnimationType.fade,
      beforeTextPaste: (value) => false,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          fieldWidth: _fieldWidth(context),
          inactiveColor: AskLoraColors.text,
          selectedColor: AskLoraColors.primaryGreen,
          activeColor: AskLoraColors.text),
      animationDuration: const Duration(milliseconds: 200),
      onCompleted: onCompleted,
      onChanged: (value) => onChanged,
      cursorColor: AskLoraColors.charcoal,
    );
  }
}
