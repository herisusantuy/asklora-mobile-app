part of '../deposit_welcome_screen.dart';

class DepositStep extends StatelessWidget {
  final int currentStep;
  final DepositType depositType;

  const DepositStep(
      {this.currentStep = 0,
      this.depositType = DepositType.firstTime,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _getDepositStep;

  Widget get _getDepositStep {
    const EdgeInsets padding = EdgeInsets.fromLTRB(20, 30, 20, 12);
    switch (depositType) {
      case DepositType.firstTime:
        return RoundColoredBox(
          title: 'Deposit funds to complete your investment account opening',
          content: Column(children: _firstTimeStep),
          padding: padding,
        );
      case DepositType.type1:
        return RoundColoredBox(
          content: Column(children: _type1Step),
          padding: padding,
        );
      case DepositType.type2:
        return RoundColoredBox(
          content: Column(children: _type2Step),
          padding: padding,
        );
    }
  }

  List<Widget> get _firstTimeStep => [
        _widgetStep(
          index: 0,
          title: 'Deposit via FPS or Wire Transfer',
          subTitle: "Transfer at least HK\$10,000 to Asklora's bank account. ",
          subTitleColor: AskLoraColors.primaryMagenta,
        ),
        _widgetStep(
          index: 1,
          height: 70,
          title: 'Input deposit amount',
          subTitle: 'The amount must match with the proof of remittance.',
        ),
        _widgetStep(
          index: 2,
          title: 'Upload proof of remittance',
          subTitle:
              'The proof of remittance should show your bank account number, full name, and amount.',
        ),
        _widgetStep(
            index: 3,
            drawLine: false,
            height: 65,
            title: 'Get your account approved within 2 working days',
            subTitle: ''),
      ];

  List<Widget> get _type1Step => [
        _widgetStep(
          index: 0,
          title: 'Deposit via FPS or Wire Transfer',
          subTitle:
              'Transfer at least HK\$3,000 to Asklora’s bank account from the same bank account you used. ',
          subTitleColor: AskLoraColors.primaryMagenta,
        ),
        _widgetStep(
          index: 1,
          height: 70,
          title: 'Input deposit amount',
          subTitle: 'The amount must match with the proof of remittance.',
        ),
        _widgetStep(
            index: 2,
            drawLine: false,
            height: 45,
            title: 'Your deposit can take up to 2 working days.',
            subTitle: ''),
      ];

  List<Widget> get _type2Step => [
        _widgetStep(
          index: 0,
          title: 'Deposit via FPS or Wire Transfer',
          subTitle:
              'Transfer at least HK\$3,000 to Asklora’s bank account from the same bank account you used. ',
          subTitleColor: AskLoraColors.primaryMagenta,
        ),
        _widgetStep(
          index: 1,
          title: 'Upload proof of remittance',
          subTitle:
              'The proof of remittance should show your bank account number, full name, and amount.',
        ),
        _widgetStep(
            index: 2,
            drawLine: false,
            height: 45,
            title: 'Your deposit can take up to 2 working days.',
            subTitle: ''),
      ];

  Widget _widgetStep({
    bool drawLine = true,
    required int index,
    required String title,
    required String subTitle,
    double height = 80,
    Color subTitleColor = AskLoraColors.darkGray,
  }) =>
      CustomStep(
        drawLine: drawLine,
        svgAssetName: _getSvgAssetName(index, currentStep),
        height: height,
        widgetStep: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              title,
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomTextNew(
              subTitle,
              style: AskLoraTextStyles.body2.copyWith(color: subTitleColor),
              maxLines: 2,
            ),
          ],
        ),
      );

  String _getSvgAssetName(int index, int currentStep) {
    if (index + 1 < currentStep) {
      return 'passed_step_icon';
    } else if (index + 1 == currentStep) {
      return 'active_step_icon';
    } else {
      return 'inactive_step_icon';
    }
  }
}
