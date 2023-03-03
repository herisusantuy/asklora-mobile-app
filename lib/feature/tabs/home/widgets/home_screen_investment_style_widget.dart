part of '../home_screen_form.dart';

class HomeScreenInvestmentStyleWidget extends StatelessWidget {
  final bool showPrimaryButton;
  final bool showAdditionalInfo;

  const HomeScreenInvestmentStyleWidget(
      {this.showPrimaryButton = false,
      this.showAdditionalInfo = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenHorizontalPaddingWidget(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextNew(
              'Your Investment Persona',
              style:
                  AskLoraTextStyles.h2.copyWith(color: AskLoraColors.charcoal),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
            height: 244,
            width: 244,
            child: RadarChart(RadarChartData(
                tickCount: 0,
                radarBackgroundColor: AskLoraColors.whiteSmoke,
                titleTextStyle: AskLoraTextStyles.subtitle2,
                extendedBorderStyle: ExtendedBorderStyle.dash,
                tickBorderData: const BorderSide(color: Colors.blue, width: 2),
                radarBorderData: const BorderSide(
                    color: AskLoraColors.primaryGreen, width: 3),
                gridBorderData:
                    const BorderSide(color: AskLoraColors.gray, width: 1.5),
                titlePositionPercentageOffset: .5,
                getTitle: (index, angle) {
                  switch (index) {
                    case 0:
                      return const RadarChartTitle(
                          text: 'Risk Tolerance', angle: 0);
                    case 2:
                      return const RadarChartTitle(text: 'Patient', angle: 0);
                    case 1:
                      return const RadarChartTitle(text: 'Detailed', angle: 0);
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                dataSets: [
                  RadarDataSet(
                      entryRadius: 6,
                      fillColor: Colors.transparent,
                      borderColor: AskLoraColors.primaryGreen,
                      dataEntries: [
                        const RadarEntry(value: 0),
                        const RadarEntry(value: 0),
                        const RadarEntry(value: 0),
                      ])
                ])),
          ),
          if (showAdditionalInfo)
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: CustomTextNew(
                'You’ll get to know your investment style after you’ve created an account!',
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.charcoal),
                textAlign: TextAlign.center,
              ),
            ),
          if (showPrimaryButton)
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: PrimaryButton(
                label: 'DEFINE INVESTMENT STYLE',
                onTap: () => PpiScreen.open(
                  context,
                  arguments: Pair(
                    QuestionPageType.investmentStyle,
                    QuestionPageStep.investmentStyle,
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 28,
          ),
          ExtraInfoButton(
              label: 'How does Investment Style work?',
              suffixIcon: const Icon(
                Icons.arrow_forward_rounded,
                color: AskLoraColors.primaryMagenta,
                size: 18,
              ),
              onTap: () {})
        ],
      ),
    );
  }
}
