part of 'otp_form.dart';

class OtpBox extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final int length;
  final double spaceBetween;
  final TextStyle textStyle;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final OtpFieldController otpFieldController;
  final bool disable;

  double _fieldWidth(BuildContext context) =>
      (MediaQuery.of(context).size.width - spaceBetween * (length + 1) * 2) /
      length;

  const OtpBox(
      {required this.otpFieldController,
      this.onChanged,
      this.onCompleted,
      this.length = 6,
      this.spaceBetween = 8,
      this.textStyle = const TextStyle(fontSize: 16),
      this.textInputType = TextInputType.none,
      this.textInputFormatterList,
      this.disable = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disable,
      child: OTPTextField(
        controller: otpFieldController,
        inputFormatter: textInputFormatterList,
        keyboardType: textInputType,
        length: length,
        spaceBetween: spaceBetween,
        width: MediaQuery.of(context).size.width,
        fieldWidth: _fieldWidth(context),
        style: textStyle,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onChanged: onChanged,
        onCompleted: onCompleted,
      ),
    );
  }
}
