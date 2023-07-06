part of '../../deposit_welcome_screen.dart';

class DepositStep extends StatelessWidget {
  final int currentStep;
  final DepositType depositType;

  const DepositStep(
      {this.currentStep = 0,
      this.depositType = DepositType.firstTime,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _getDepositStep(context);

  Widget _getDepositStep(BuildContext context) {
    final firstTimeDeposit = firstTimeDepositStep(context);
    final type1Deposit = type1DepositStep(context);
    final type2Deposit = type2DepositStep(context);
    const EdgeInsets padding = EdgeInsets.fromLTRB(20, 30, 20, 12);
    switch (depositType) {
      case DepositType.firstTime:
        return RoundColoredBox(
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
                children: firstTimeDeposit.map((e) {
              final int index = firstTimeDeposit.indexOf(e);
              return _step(
                  drawLine: index != firstTimeDeposit.length - 1,
                  index: index,
                  subTitleColor: e.subTitleColor,
                  title: e.title,
                  subTitle: e.subTitle);
            }).toList()),
          ),
          padding: padding,
        );
      case DepositType.type1:
        return RoundColoredBox(
          content: Column(
              children: type1Deposit.map((e) {
            final int index = type1Deposit.indexOf(e);
            return _step(
                drawLine: index != type1Deposit.length - 1,
                index: type1Deposit.indexOf(e),
                subTitleColor: e.subTitleColor,
                title: e.title,
                subTitle: e.subTitle);
          }).toList()),
          padding: padding,
        );
      case DepositType.type2:
        return RoundColoredBox(
          content: Column(
              children: type2Deposit.map((e) {
            final int index = type2Deposit.indexOf(e);
            return _step(
                drawLine: index != type2Deposit.length - 1,
                index: type2Deposit.indexOf(e),
                subTitleColor: e.subTitleColor,
                title: e.title,
                subTitle: e.subTitle);
          }).toList()),
          padding: padding,
        );
    }
  }

  Widget _step({
    bool drawLine = true,
    required int index,
    required String title,
    required String subTitle,
    Color subTitleColor = AskLoraColors.darkGray,
  }) =>
      CustomStep(
        spaceVertical: 24,
        drawLine: drawLine,
        svgAssetName: _getSvgAssetName(index, currentStep),
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
              maxLines: 3,
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
