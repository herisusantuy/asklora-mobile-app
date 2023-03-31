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
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../../balance/deposit/utils/deposit_utils.dart';
import '../../../domain/orders/bot_active_order_detail_model.dart';
import '../../../domain/orders/bot_active_order_model.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_stock_result_screen.dart';
import '../../widgets/bot_stock_form.dart';
import '../../widgets/column_text.dart';
import '../../widgets/pair_column_text.dart';
import '../bloc/portfolio_bloc.dart';
import '../repository/portfolio_repository.dart';
import 'widgets/bot_portfolio_detail_content.dart';

part 'widgets/bot_portfolio_detail_header.dart';

part 'widgets/key_info.dart';

part 'widgets/performance.dart';

class BotPortfolioDetailScreen extends StatelessWidget {
  static const String route = '/bot_portfolio_detail_screen';
  final BotActiveOrderModel botActiveOrderModel;

  late final BotType botType;
  late final BotStatus botStatus;

  BotPortfolioDetailScreen({required this.botActiveOrderModel, Key? key})
      : super(key: key) {
    botType = BotType.findByString(botActiveOrderModel.botAppsName);
    botStatus = BotStatus.findByString(
        botActiveOrderModel.status, botActiveOrderModel.expireDate);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: BlocProvider(
        create: (_) => PortfolioBloc(
            portfolioRepository: PortfolioRepository(),
            botStockRepository: BotStockRepository())
          ..add(FetchActiveOrderDetail(orderId: botActiveOrderModel.pk)),
        child: BlocConsumer<PortfolioBloc, PortfolioState>(
          listenWhen: (previous, current) =>
              previous.botActiveOrderDetailResponse.state !=
                  current.botActiveOrderDetailResponse.state ||
              previous.endBotStockResponse.state !=
                  current.endBotStockResponse.state ||
              previous.rolloverBotStockResponse.state !=
                  current.rolloverBotStockResponse.state ||
              previous.cancelBotStockResponse.state !=
                  current.cancelBotStockResponse.state,
          listener: _portfolioListener,
          buildWhen: (previous, current) =>
              previous.botActiveOrderDetailResponse.state !=
              current.botActiveOrderDetailResponse.state,
          builder: (context, state) {
            if (state.botActiveOrderDetailResponse.state ==
                ResponseState.success) {
              final BotActiveOrderDetailModel botActiveOrderDetailModel =
                  state.botActiveOrderDetailResponse.data!;
              final Pair<Widget, Widget> portfolioDetailProps =
                  _getPortfolioDetailProps(context, botActiveOrderDetailModel);
              return CustomLayoutWithBlurPopUp(
                loraPopUpMessageModel: LoraPopUpMessageModel(
                  title: 'Unable to get information',
                  subTitle:
                      'There was an error when trying to get your Portfolio. Please try reloading the page',
                  primaryButtonLabel: 'RELOAD PAGE',
                  secondaryButtonLabel: 'CANCEL',
                  onSecondaryButtonTap: () => Navigator.pop(context),
                  onPrimaryButtonTap: () => context.read<PortfolioBloc>().add(
                      (FetchActiveOrderDetail(
                          orderId: botActiveOrderModel.pk))),
                ),
                showPopUp: state.botActiveOrderDetailResponse.state ==
                    ResponseState.error,
                content: BotStockForm(
                    useHeader: true,
                    customHeader: BotPortfolioDetailHeader(
                      botActiveOrderModel: botActiveOrderModel,
                      botType: botType,
                      botStatus: botStatus,
                    ),
                    padding: EdgeInsets.zero,
                    content: BotPortfolioDetailContent(
                      botStatus: botStatus,
                      botType: botType,
                      portfolioDetailProps: portfolioDetailProps,
                      portfolioBotDetailModel: botActiveOrderDetailModel,
                    ),
                    bottomButton: portfolioDetailProps.right),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Pair<Widget, Widget> _getPortfolioDetailProps(BuildContext context,
      BotActiveOrderDetailModel botActiveOrderDetailModel) {
    if (UserJourney.compareUserJourney(
        context: context, target: UserJourney.deposit)) {
      return Pair(
          const SizedBox.shrink(),
          Padding(
            padding:
                AppValues.screenHorizontalPadding.copyWith(top: 36, bottom: 30),
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    if (botStatus == BotStatus.activeExpiresSoon)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: PrimaryButton(
                          label: 'ROLLOVER BOTSTOCK',
                          onTap: () =>
                              BotStockBottomSheet.rolloverBotStockConfirmation(
                                  context,
                                  orderId: botActiveOrderDetailModel.pk,
                                  expireDate:
                                      botActiveOrderDetailModel.expireDate),
                        ),
                      ),
                    PrimaryButton(
                      buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
                      label: botStatus == BotStatus.active ||
                              botStatus == BotStatus.activeExpiresSoon
                          ? 'END BOTSTOCK'
                          : 'CANCEL BOTSTOCK',
                      onTap: () => botStatus == BotStatus.active||
                          botStatus == BotStatus.activeExpiresSoon
                          ? BotStockBottomSheet.endBotStockConfirmation(
                              context,
                              botActiveOrderDetailModel.pk,
                              botActiveOrderDetailModel.botDetail.botName,
                              botActiveOrderDetailModel.tickerDetail.ticker)
                          : BotStockBottomSheet.cancelBotStockConfirmation(
                              context, botActiveOrderDetailModel.pk),
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
              primaryButtonLabel: 'COMPLETE MILESTONE',
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
    if (state.botActiveOrderDetailResponse.state == ResponseState.loading ||
        state.endBotStockResponse.state == ResponseState.loading ||
        state.rolloverBotStockResponse.state == ResponseState.loading ||
        state.cancelBotStockResponse.state == ResponseState.loading) {
      CustomLoadingOverlay.of(context).appear();
    } else {
      CustomLoadingOverlay.of(context).dismiss();
      if (state.endBotStockResponse.state == ResponseState.success) {
        BotStockResultScreen.open(
            context: context,
            arguments: Pair('Trade Request Received',
                '${botType.name} ${botActiveOrderModel.ticker} will end at 17/3/2023 10.22'));
      } else if (state.endBotStockResponse.state == ResponseState.error) {
        CustomInAppNotification.show(
            context, state.endBotStockResponse.message);
      }
      if (state.cancelBotStockResponse.state == ResponseState.success) {
        BotStockResultScreen.open(
            context: context,
            arguments: const Pair('Trade Canceled',
                'The trade has been cancelled and your investment amount has been returned to your account'));
      } else if (state.cancelBotStockResponse.state == ResponseState.error) {
        CustomInAppNotification.show(
            context, state.cancelBotStockResponse.message);
      }
      if (state.rolloverBotStockResponse.state == ResponseState.success) {
        BotStockResultScreen.open(
            context: context,
            arguments: Pair('Trade Request Received',
                '${botType.name} ${botActiveOrderModel.ticker} will rollover at ${newExpiryDateOnRollover(botActiveOrderModel.expireDate)}'));
      } else if (state.rolloverBotStockResponse.state == ResponseState.error) {
        CustomInAppNotification.show(
            context, state.rolloverBotStockResponse.message);
      }
    }
  }

  static void open(
          {required BuildContext context,
          required BotActiveOrderModel botActiveOrderModel}) =>
      Navigator.pushNamed(context, route, arguments: botActiveOrderModel);
}
