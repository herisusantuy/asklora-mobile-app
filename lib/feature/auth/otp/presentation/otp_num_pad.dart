part of 'otp_form.dart';

class OtpNumPad extends StatelessWidget {
  final OtpFieldController otpFieldController;
  final int textPosition;
  final int length;

  const OtpNumPad(
      {required this.otpFieldController,
      required this.textPosition,
      this.length = 6,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
          _deleteKey
        ],
      ),
    );
  }

  Center _numKey(String digits) {
    return Center(
      child: InkWell(
        onTap: () {
          if (textPosition != length) {
            otpFieldController.setFocus(textPosition);
            otpFieldController.setValue(digits, textPosition);
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
          onTap: () => (textPosition > 0
              ? otpFieldController.setValue('', textPosition - 1)
              : (_) {}),
          child: const Icon(Icons.backspace),
        ),
      );

  SizedBox get _emptyKey => const SizedBox.shrink();
}
