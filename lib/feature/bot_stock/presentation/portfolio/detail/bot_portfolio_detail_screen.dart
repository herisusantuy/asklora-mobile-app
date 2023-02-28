import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
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
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_stock_result_screen.dart';
import '../../widgets/column_text.dart';
import '../../widgets/bot_stock_form.dart';
import '../../widgets/pair_column_text.dart';
import '../bloc/portfolio_bloc.dart';
import '../domain/portfolio_bot_detail_model.dart';
import '../domain/portfolio_bot_model.dart';
import '../repository/portfolio_repository.dart';
import '../utils/portfolio_enum.dart';
import 'widgets/bot_portfolio_detail_content.dart';

part 'widgets/key_info.dart';

part 'widgets/performance.dart';

part 'widgets/bot_portfolio_detail_header.dart';

class BotPortfolioDetailScreen extends StatelessWidget {
  static const String route = '/bot_portfolio_detail_screen';
  final PortfolioBotModel portfolioBotModel;

  late final BotType botType;

  BotPortfolioDetailScreen({required this.portfolioBotModel, Key? key})
      : super(key: key) {
    botType = BotType.findByString(portfolioBotModel.botAppType);
  }

  @override
  Widget build(BuildContext context) {
    final Pair<Widget, Widget> portfolioDetailProps =
        _getPortfolioDetailProps(context);
    return CustomScaffold(
      enableBackNavigation: false,
      body: BlocProvider(
        create: (_) => PortfolioBloc(portfolioRepository: PortfolioRepository())
          ..add(FetchBotPortfolioDetail(
              ticker: portfolioBotModel.ticker,
              botId: portfolioBotModel.botId)),
        child: BlocConsumer<PortfolioBloc, PortfolioState>(
          listenWhen: (previous, current) =>
              previous.botPortfolioDetailResponse.state !=
                  current.botPortfolioDetailResponse.state ||
              previous.endBotStockResponse.state !=
                  current.endBotStockResponse.state ||
              previous.rolloverBotStockResponse.state !=
                  current.rolloverBotStockResponse.state,
          listener: _portfolioListener,
          buildWhen: (previous, current) =>
              previous.botPortfolioDetailResponse.state !=
              current.botPortfolioDetailResponse.state,
          builder: (context, state) => CustomLayoutWithBlurPopUp(
            showReloadPopUp:
                state.botPortfolioDetailResponse.state == ResponseState.error,
            onTapReload: () => context.read<PortfolioBloc>().add(
                  (FetchBotPortfolioDetail(
                      ticker: portfolioBotModel.ticker,
                      botId: portfolioBotModel.botId)),
                ),
            content: BotStockForm(
                useHeader: true,
                customHeader: BotPortfolioDetailHeader(
                  portfolioBotModel: portfolioBotModel,
                  botType: botType,
                ),
                padding: EdgeInsets.zero,
                content: BotPortfolioDetailContent(
                  portfolioBotModel: portfolioBotModel,
                  botType: botType,
                  portfolioDetailProps: portfolioDetailProps,
                  portfolioBotDetailModel:
                      state.botPortfolioDetailResponse.data,
                ),
                bottomButton: portfolioDetailProps.right),
          ),
        ),
      ),
    );
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
    if (state.botPortfolioDetailResponse.state == ResponseState.loading ||
        state.endBotStockResponse.state == ResponseState.loading ||
        state.rolloverBotStockResponse.state == ResponseState.loading) {
      CustomLoadingOverlay.show(context);
    } else {
      CustomLoadingOverlay.dismiss();
      if (state.botPortfolioDetailResponse.state == ResponseState.error) {
        CustomInAppNotification.show(
            context, state.botPortfolioDetailResponse.message);
      } else if (state.botPortfolioDetailResponse.state ==
          ResponseState.error) {
        CustomInAppNotification.show(
            context, state.botPortfolioDetailResponse.message);
      }
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
