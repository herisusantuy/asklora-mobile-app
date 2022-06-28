part of 'otp_form.dart';

class OtpNumPad extends StatelessWidget {
  final String otp;
  final OtpFieldController otpFieldController;
  final int textInputPosition;
  final int length;

  const OtpNumPad(
      {required this.otpFieldController,
      required this.textInputPosition,
      required this.otp,
      this.length = 6,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        childAspectRatio: 1.2,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: [
          _numKey('1'),
          _numKey('2'),
          _numKey('3'),
          _numKey('4'),
          _numKey('5'),
          _numKey('6'),
          _numKey('7'),
          _numKey('8'),
          _numKey('9'),
          _emptyKey,
          _numKey('0'),
          _deleteKey
        ],
      ),
    );
  }

  Center _numKey(String digits) {
    return Center(
      child: InkWell(
        key: Key('otp_num_key_$digits'),
        onTap: () {
          if (textInputPosition + 1 < length) {
            otpFieldController.setValue(digits, textInputPosition);
          } else {
            List<String> otpValueList = [];
            otp.split('').forEach((ch) => otpValueList.add(ch));
            otpValueList.add(digits);
            otpFieldController.set(otpValueList);
          }
        },
        child: CustomText(
          digits,
          type: FontType.h2,
        ),
      ),
    );
  }

  Center get _deleteKey => Center(
        child: InkWell(
          onTap: () => textInputPosition > 0
              ? otpFieldController.setValue('', textInputPosition - 1)
              : () {},
          child: const Icon(Icons.backspace),
        ),
      );

  SizedBox get _emptyKey => const SizedBox.shrink();
}
