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
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                Scores value = Scores([], 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
                if (state.response.state == ResponseState.success) {
                  value = state.response.data!.scores;
                }
                return RadarChart(RadarChartData(
                    tickCount: 0,
                    radarBackgroundColor: AskLoraColors.whiteSmoke,
                    titleTextStyle: AskLoraTextStyles.subtitle2,
                    extendedBorderStyle: ExtendedBorderStyle.dash,
                    tickBorderData:
                        const BorderSide(color: Colors.blue, width: 2),
                    radarBorderData: const BorderSide(
                        color: AskLoraColors.primaryGreen, width: 3),
                    gridBorderData:
                        const BorderSide(color: AskLoraColors.gray, width: 1.5),
                    titlePositionPercentageOffset: .5,
                    getTitle: (index, angle) {
                      switch (index) {
                        case 0:
                          return RadarChartTitle(
                              text:
                                  'Extroversion ${value.extrovert.toDouble().toString()}',
                              angle: 0);
                        case 2:
                          return RadarChartTitle(
                              text:
                                  'Risk aversion ${value.extrovert.toDouble().toString()}',
                              angle: 0);
                        case 1:
                          return RadarChartTitle(
                              text:
                                  'Openness ${value.extrovert.toDouble().toString()}',
                              angle: 0);
                        default:
                          return const RadarChartTitle(text: '');
                      }
                    },
                    dataSets: [
                      // default highest score
                      RadarDataSet(
                          entryRadius: 0,
                          fillColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          dataEntries: [
                            const RadarEntry(value: 15),
                            const RadarEntry(value: 15),
                            const RadarEntry(value: 15),
                          ]),
                      //this is for user score
                      RadarDataSet(
                          entryRadius: 6,
                          fillColor: Colors.transparent,
                          borderColor: AskLoraColors.primaryGreen,
                          dataEntries: [
                            RadarEntry(value: value.extrovert.toDouble()),
                            RadarEntry(value: value.neuroticism.toDouble()),
                            RadarEntry(value: value.openness.toDouble()),
                          ])
                    ]));
              },
            ),
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
