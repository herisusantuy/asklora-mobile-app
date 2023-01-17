import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../widgets/column_text.dart';
import '../../widgets/custom_base_silver_box.dart';
import '../../widgets/gift_bot_stock_base_widget.dart';
import '../../widgets/pair_column_text.dart';
import '../../widgets/custom_detail_expansion_tile.dart';

part 'widgets/key_info.dart';

part 'widgets/performance.dart';

class BotPortfolioDetailScreen extends StatelessWidget {
  static const String route = '/bot_portfolio_detail_screen';
  final RecommendedBot recommendedBot;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotPortfolioDetailScreen({required this.recommendedBot, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(recommendedBot.botType);
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository())
        ..add(FetchChartData()),
      child: CustomScaffold(
          body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 1.2),
                    child: Icon(
                      Icons.circle,
                      color: AskLoraColors.primaryGreen,
                      size: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CustomTextNew(
                    '${botType.name} ${recommendedBot.ticker}',
                    style: AskLoraTextStyles.h5
                        .copyWith(color: AskLoraColors.charcoal),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GiftBotStockBaseWidget(
                padding: EdgeInsets.zero,
                content: Column(
                  children: [
                    Padding(
                      padding:
                          AppValues.screenHorizontalPadding.copyWith(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Performance(),
                          const SizedBox(
                            height: 33,
                          ),
                          const KeyInfo(),
                          const SizedBox(
                            height: 35,
                          ),
                          CustomDetailExpansionTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextNew(
                                  '${botType.name} Bots',
                                  style: AskLoraTextStyles.h5
                                      .copyWith(color: AskLoraColors.charcoal),
                                ),
                                CustomTextNew(
                                  recommendedBot.botWord,
                                  style: AskLoraTextStyles.body3
                                      .copyWith(color: AskLoraColors.charcoal),
                                )
                              ],
                            ),
                            children: [
                              CustomTextNew(
                                'Best Suit For',
                                style: AskLoraTextStyles.body4
                                    .copyWith(color: AskLoraColors.charcoal),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              CustomTextNew(
                                'Investors who want to take advantage of frequent price movements in the market.',
                                style: AskLoraTextStyles.body1
                                    .copyWith(color: AskLoraColors.charcoal),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextNew(
                                'How It Works',
                                style: AskLoraTextStyles.body4
                                    .copyWith(color: AskLoraColors.charcoal),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              CustomTextNew(
                                'It sells all to stop loss or when it reaches the target profit. ',
                                style: AskLoraTextStyles.body1
                                    .copyWith(color: AskLoraColors.charcoal),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomDetailExpansionTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextNew(
                                        'Tesla TSLA',
                                        style: AskLoraTextStyles.h5.copyWith(
                                            color: AskLoraColors.charcoal),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomTextNew(
                                        'Prev Close 10/07 16:00:04 ET',
                                        style: AskLoraTextStyles.body2.copyWith(
                                            color: AskLoraColors.charcoal),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomTextNew(
                                        '223.07',
                                        style: AskLoraTextStyles.h5.copyWith(
                                            color: AskLoraColors.charcoal),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomTextNew(
                                        '-15.060 -6.32%',
                                        style: AskLoraTextStyles.body2.copyWith(
                                            color: AskLoraColors.charcoal),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            children: [
                              const PairColumnText(
                                title1: 'Prev Close',
                                subTitle1: '238.13',
                                title2: 'Market Cap',
                                subTitle2: '698.98B',
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Divider(
                                color: AskLoraColors.gray,
                              ),
                              CustomTextNew(
                                'About Tesla',
                                style: AskLoraTextStyles.h6
                                    .copyWith(color: AskLoraColors.charcoal),
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              const PairColumnText(
                                title1: 'Sector(s)',
                                subTitle1: 'Consumer Cyclical',
                                title2: 'Take Profit Level',
                                subTitle2: 'Auto Manufacturers',
                              ),
                              _spaceBetweenInfo,
                              const PairColumnText(
                                title1: 'CEO',
                                subTitle1: 'Mr. Elon R. Musk',
                                title2: 'Employees',
                                subTitle2: '99,290',
                              ),
                              _spaceBetweenInfo,
                              const PairColumnText(
                                title1: 'Headquarters',
                                subTitle1: 'Austin, TX',
                                title2: 'Founded',
                                subTitle2: '2003',
                              ),
                              const SizedBox(
                                height: 23,
                              ),
                              CustomTextNew(
                                'Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems in the United States, China, and internationally. The company operates in two segments, Automotive, and Energy Generation and Storage. ',
                                style: AskLoraTextStyles.body1
                                    .copyWith(color: AskLoraColors.charcoal),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomButton: Padding(
                  padding: AppValues.screenHorizontalPadding
                      .copyWith(top: 36, bottom: 30),
                  child: PrimaryButton(
                    buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
                    label: 'END BOTSTOCK',
                    onTap: () {},
                  ),
                )),
          )
        ],
      )),
    );
  }

  static void open(
          {required BuildContext context,
          required RecommendedBot recommendedBot}) =>
      Navigator.pushNamed(context, route, arguments: recommendedBot);
}
