import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_popup_message/lora_popup_message.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../../balance/deposit/utils/deposit_utils.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_stock_result_screen.dart';
import '../../widgets/column_text.dart';
import '../../widgets/bot_stock_form.dart';
import '../../widgets/pair_column_text.dart';
import '../../widgets/custom_detail_expansion_tile.dart';
import '../bloc/portfolio_bloc.dart';
import '../domain/portfolio_bot_detail_model.dart';
import '../domain/portfolio_bot_model.dart';
import '../repository/portfolio_repository.dart';
import '../utils/portfolio_enum.dart';

part 'widgets/key_info.dart';

part 'widgets/performance.dart';

class BotPortfolioDetailScreen extends StatelessWidget {
  static const String route = '/bot_portfolio_detail_screen';
  final PortfolioBotModel portfolioBotModel;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  late final BotType botType;

  BotPortfolioDetailScreen({required this.portfolioBotModel, Key? key})
      : super(key: key) {
    botType = BotType.findByString(portfolioBotModel.botAppType);
  }

  @override
  Widget build(BuildContext context) {
    final Pair<Widget, Widget> portfolioDetailProps =
        _getPortfolioDetailProps(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                PortfolioBloc(portfolioRepository: PortfolioRepository())
                  ..add(FetchBotPortfolioDetail(portfolioBotModel)),
          ),
          BlocProvider(
              create: (_) =>
                  BotStockBloc(botStockRepository: BotStockRepository())),
        ],
        child: BlocListener<PortfolioBloc, PortfolioState>(
          listenWhen: (previous, current) =>
              previous.endBotStockResponse.state !=
                  current.endBotStockResponse.state ||
              previous.rolloverBotStockResponse.state !=
                  current.rolloverBotStockResponse.state,
          listener: _portfolioListener,
          child: BotStockForm(
              useHeader: true,
              customHeader: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                      '${botType.upperCaseName} ${portfolioBotModel.ticker}',
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                    ),
                  ],
                ),
              ),
              contentPadding: EdgeInsets.zero,
              content: BlocConsumer<PortfolioBloc, PortfolioState>(
                  listenWhen: (previous, current) =>
                      previous.botPortfolioDetailResponse.state !=
                      current.botPortfolioDetailResponse.state,
                  listener: (context, state) {
                    if (state.botPortfolioDetailResponse.state ==
                        ResponseState.loading) {
                      CustomLoadingOverlay.show(context);
                    } else {
                      CustomLoadingOverlay.dismiss();
                      if (state.botPortfolioDetailResponse.state ==
                          ResponseState.error) {
                        CustomInAppNotification.show(
                            context, state.botPortfolioDetailResponse.message);
                      }
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.botPortfolioDetailResponse.state !=
                      current.botPortfolioDetailResponse.state,
                  builder: (context, state) {
                    if (state.botPortfolioDetailResponse.state ==
                        ResponseState.success) {
                      PortfolioBotDetailModel portfolioBotDetailModel =
                          state.botPortfolioDetailResponse.data!;
                      return Padding(
                        padding: AppValues.screenHorizontalPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Performance(
                              portfolioBotDetailModel: portfolioBotDetailModel,
                              portfolioBotModel: portfolioBotModel,
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            KeyInfo(
                              portfolioBotModel: portfolioBotModel,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            CustomDetailExpansionTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextNew(
                                    '${botType.upperCaseName} Bots',
                                    style: AskLoraTextStyles.h5.copyWith(
                                        color: AskLoraColors.charcoal),
                                  ),
                                  CustomTextNew(
                                    portfolioBotDetailModel
                                        .bot.botDescription.detail,
                                    style: AskLoraTextStyles.body3.copyWith(
                                        color: AskLoraColors.charcoal),
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
                                  portfolioBotDetailModel
                                      .bot.botDescription.suited,
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
                                  portfolioBotDetailModel
                                      .bot.botDescription.works,
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
                                          '${portfolioBotDetailModel.tickerName} ${portfolioBotDetailModel.ticker}',
                                          style: AskLoraTextStyles.h5.copyWith(
                                              color: AskLoraColors.charcoal),
                                          maxLines: 2,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CustomTextNew(
                                          'Not available yet',
                                          style: AskLoraTextStyles.body2
                                              .copyWith(
                                                  color:
                                                      AskLoraColors.charcoal),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomTextNew(
                                          portfolioBotDetailModel.price
                                              .convertToCurrencyDecimal(),
                                          style: AskLoraTextStyles.h5.copyWith(
                                              color: AskLoraColors.charcoal),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CustomTextNew(
                                          '${portfolioBotDetailModel.estimatedStopLossPrice.convertToCurrencyDecimal()} ${portfolioBotDetailModel.estimatedTakeProfitPct.toStringAsFixed(4)}%',
                                          style: AskLoraTextStyles.body2
                                              .copyWith(
                                                  color:
                                                      AskLoraColors.charcoal),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              children: [
                                PairColumnText(
                                  title1: 'Prev Close',
                                  subTitle1: 'Not available yet',
                                  title2: 'Market Cap',
                                  subTitle2:
                                      portfolioBotDetailModel.marketCap != null
                                          ? portfolioBotDetailModel.marketCap!
                                              .toStringAsFixed(1)
                                          : '-',
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Divider(
                                  color: AskLoraColors.gray,
                                ),
                                CustomTextNew(
                                  'About ${portfolioBotDetailModel.tickerName}',
                                  style: AskLoraTextStyles.h6
                                      .copyWith(color: AskLoraColors.charcoal),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                PairColumnText(
                                  title1: 'Sector(s)',
                                  subTitle1: portfolioBotDetailModel.sector,
                                  title2: 'Industry',
                                  subTitle2: portfolioBotDetailModel.industry,
                                ),
                                _spaceBetweenInfo,
                                PairColumnText(
                                  title1: 'CEO',
                                  subTitle1: portfolioBotDetailModel.ceo,
                                  title2: 'Employees',
                                  subTitle2: portfolioBotDetailModel.employees
                                      .toString(),
                                ),
                                _spaceBetweenInfo,
                                PairColumnText(
                                  title1: 'Headquarters',
                                  subTitle1:
                                      portfolioBotDetailModel.headquarters,
                                  title2: 'Founded',
                                  subTitle2: portfolioBotDetailModel.founded,
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                CustomTextNew(
                                  portfolioBotDetailModel.description,
                                  style: AskLoraTextStyles.body1
                                      .copyWith(color: AskLoraColors.charcoal),
                                )
                              ],
                            ),
                            portfolioDetailProps.left,
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
              bottomButton: portfolioDetailProps.right),
        ));
  }

  Pair<Widget, Widget> _getPortfolioDetailProps(BuildContext context) {
    if (UserJourney.compareUserJourney(
        source: context.read<AppBloc>().state.userJourney,
        target: UserJourney.deposit)) {
      return Pair(
          const SizedBox.shrink(),
          Padding(
            padding:
                AppValues.screenHorizontalPadding.copyWith(top: 36, bottom: 30),
            child: Builder(
              builder: (context) {
                BotPortfolioStatus botPortfolioStatus =
                    BotPortfolioStatus.findByString('active');
                return Column(
                  children: [
                    if (botPortfolioStatus != BotPortfolioStatus.pending)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: PrimaryButton(
                          label: 'ROLLOVER BOTSTOCK',
                          onTap: () =>
                              BotStockBottomSheet.rolloverBotStockConfirmation(
                                  context, portfolioBotModel),
                        ),
                      ),
                    PrimaryButton(
                      buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
                      label: botPortfolioStatus == BotPortfolioStatus.active
                          ? 'END BOTSTOCK'
                          : 'CANCEL BOTSTOCK',
                      onTap: () => BotStockBottomSheet.endBotStockConfirmation(
                          context, portfolioBotModel),
                    ),
                  ],
                );
              },
            ),
          ));
    } else {
      return Pair(
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: LoraPopUpMessage(
              backgroundColor: AskLoraColors.charcoal,
              title: 'Take the next step towards gift redemption!',
              titleColor: AskLoraColors.white,
              subTitle: 'The secret of getting ahead is getting started.',
              subTitleColor: AskLoraColors.white,
              buttonLabel: 'COMPLETE MILESTONE',
              onPrimaryButtonTap: () => DepositWelcomeScreen.open(
                  context: context, depositType: DepositType.firstTime),
              buttonPrimaryType: ButtonPrimaryType.solidGreen,
              bottomText: 'Next Step: Pay deposit',
            ),
          ),
          const SizedBox.shrink());
    }
  }

  void _portfolioListener(BuildContext context, PortfolioState state) {
    if (state.endBotStockResponse.state == ResponseState.loading ||
        state.rolloverBotStockResponse.state == ResponseState.loading) {
      CustomLoadingOverlay.show(context);
    } else {
      CustomLoadingOverlay.dismiss();
      if (state.endBotStockResponse.state == ResponseState.success) {
        BotStockResultScreen.open(
            context: context,
            arguments: Pair('Trade Request Received',
                '${botType.name} ${portfolioBotModel.ticker} will end at 17/3/2023 10.22}'));
      } else if (state.endBotStockResponse.state == ResponseState.error) {
        CustomInAppNotification.show(
            context, state.endBotStockResponse.message);
      }
      if (state.rolloverBotStockResponse.state == ResponseState.success) {
        BotStockResultScreen.open(
            context: context,
            arguments: Pair('Trade Request Received',
                '${botType.name} ${portfolioBotModel.ticker} will rollover at 17/3/2023 10.22}'));
      } else if (state.rolloverBotStockResponse.state == ResponseState.error) {
        CustomInAppNotification.show(
            context, state.endBotStockResponse.message);
      }
    }
  }

  static void open(
          {required BuildContext context,
          required PortfolioBotModel portfolioBotModel}) =>
      Navigator.pushNamed(context, route, arguments: portfolioBotModel);
}
