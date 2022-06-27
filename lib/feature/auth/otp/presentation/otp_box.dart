import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/styles/color.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/presentation/custom_text.dart';

class OtpBox extends StatelessWidget {
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final void Function() onRequest;
  final bool disableRequest;
  final int length;
  final double spaceBetween;
  final FontType type;
  final TextStyle textStyle;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final int resetTime;
  final int textPosition;
  final OtpFieldController otpFieldController;

  double fieldWidth(BuildContext context) =>
      (MediaQuery.of(context).size.width - spaceBetween * (length + 1) * 2) /
      length;

  OtpBox(
      {required this.otpFieldController,
      this.onCompleted,
      this.onChanged,
      required this.onRequest,
      this.length = 6,
      this.spaceBetween = 8,
      this.type = FontType.bodyText,
      this.textStyle = const TextStyle(fontSize: 16),
      this.textInputType = TextInputType.none,
      this.textInputFormatterList,
      this.resetTime = 0,
      required this.textPosition,
      this.disableRequest = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OTPTextField(
          controller: otpFieldController,
          inputFormatter: textInputFormatterList,
          keyboardType: textInputType,
          length: length,
          spaceBetween: spaceBetween,
          width: MediaQuery.of(context).size.width,
          fieldWidth: fieldWidth(context),
          style: textStyle,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: onCompleted,
          onChanged: onChanged,
        ),
        _padding(),
        Align(
          alignment: Alignment.centerRight,
          child: _requestOtp(),
        ),
        _padding(),
        _numPad(),
      ],
    );
  }

  Widget _requestOtp() {
    if (disableRequest) {
      return CustomText('Request another otp in ${resetTime.formatTimeMMSS()}');
    } else {
      return CustomTextButton(
        buttonText: 'Request OTP',
        onClick: onRequest,
        primaryColor: COLORS.text,
      );
    }
  }

  Widget _numPad() {
    List<String> keyShown = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    List<Widget> listNumKey = [];
    for (var element in keyShown) {
      listNumKey.add(_numKey(element));
    }
    listNumKey.add(_emptyKey);
    listNumKey.add(_numKey('0'));
    listNumKey.add(_deleteKey);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        childAspectRatio: 1.2,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: listNumKey,
      ),
    );
  }

  Center _numKey(String digits) {
    return Center(
      child: InkWell(
        onTap: () => otpFieldController.setValue(digits, textPosition),
        child: CustomText(
          digits,
          type: FontType.h2,
        ),
      ),
    );
  }

  Center get _deleteKey => Center(
        child: InkWell(
          onTap: () => (textPosition > 0
              ? otpFieldController.setValue('', textPosition - 1)
              : (_) {}),
          child: const Icon(Icons.backspace),
        ),
      );

  SizedBox get _emptyKey => const SizedBox.shrink();

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 32),
      );
}
