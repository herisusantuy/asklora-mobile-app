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
  Widget build(BuildContext context) => _getDepositStep;

  Widget get _getDepositStep {
    const EdgeInsets padding = EdgeInsets.fromLTRB(20, 30, 20, 12);
    switch (depositType) {
      case DepositType.firstTime:
        return RoundColoredBox(
          title: 'Deposit funds to complete your investment account opening',
          content: Column(
              children: _firstTimeStep.map((e) {
            final int index = _firstTimeStep.indexOf(e);
            return _step(
                drawLine: index != _firstTimeStep.length - 1,
                index: index,
                subTitleColor: e.subTitleColor,
                title: e.title,
                subTitle: e.subTitle);
          }).toList()),
          padding: padding,
        );
      case DepositType.type1:
        return RoundColoredBox(
          content: Column(
              children: _type1Step.map((e) {
            final int index = _type1Step.indexOf(e);
            return _step(
                drawLine: index != _type1Step.length - 1,
                index: _type1Step.indexOf(e),
                subTitleColor: e.subTitleColor,
                title: e.title,
                subTitle: e.subTitle);
          }).toList()),
          padding: padding,
        );
      case DepositType.type2:
        return RoundColoredBox(
          content: Column(
              children: _type2Step.map((e) {
            final int index = _type2Step.indexOf(e);
            return _step(
                drawLine: index != _type2Step.length - 1,
                index: _type2Step.indexOf(e),
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
