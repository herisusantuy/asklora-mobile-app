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
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/presentation/suspended_account_screen.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/repository/transaction_repository.dart';
import '../../../domain/orders/bot_active_order_detail_model.dart';
import '../../../domain/orders/bot_active_order_model.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_performance/bot_performance_chart.dart';
import '../../bot_stock_result_screen.dart';
import '../../widgets/bot_stock_form.dart';
import '../../../../../core/presentation/column_text/column_text_with_tooltip.dart';
import '../../../../../core/presentation/column_text/pair_column_text_with_tooltip.dart';
import '../bloc/portfolio_bloc.dart';
import 'widgets/bot_portfolio_detail_content.dart';

part 'widgets/bot_portfolio_detail_header.dart';

part 'widgets/key_info.dart';

part 'widgets/performance.dart';

part 'widgets/buttons/bot_rollover_button.dart';

part 'widgets/buttons/bot_cancel_button.dart';

part 'widgets/buttons/bot_terminate_button.dart';

class BotPortfolioDetailScreen extends StatelessWidget {
  static const String route = '/bot_portfolio_detail_screen';
  final BotActiveOrderModel botActiveOrderModel;

  late final BotType botType;
  late final BotStatus botStatus;

  BotPortfolioDetailScreen({required this.botActiveOrderModel, Key? key})
      : super(key: key) {
    botType = BotType.findByString(botActiveOrderModel.botAppsName);
    botStatus = BotStatus.findByOmsStatus(botActiveOrderModel.status,
        expireDate: botActiveOrderModel.expireDate);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: BlocProvider(
        create: (_) => PortfolioBloc(
            botStockRepository: BotStockRepository(),
            transactionHistoryRepository: TransactionRepository())
          ..add(FetchActiveOrderDetail(botOrderId: botActiveOrderModel.uid)),
        child: BlocConsumer<PortfolioBloc, PortfolioState>(
          listenWhen: (previous, current) =>
              previous.botActiveOrderDetailResponse.state !=
              current.botActiveOrderDetailResponse.state,
          listener: (context, state) => CustomLoadingOverlay.of(context)
              .show(state.botActiveOrderDetailResponse.state),
          buildWhen: (previous, current) =>
              previous.botActiveOrderDetailResponse.state !=
              current.botActiveOrderDetailResponse.state,
          builder: (context, state) {
            final BotActiveOrderDetailModel? botActiveOrderDetailModel =
                state.botActiveOrderDetailResponse.data;
            return RefreshIndicator(
              onRefresh: () async => context.read<PortfolioBloc>().add(
                  FetchActiveOrderDetail(botOrderId: botActiveOrderModel.uid)),
              child: CustomLayoutWithBlurPopUp(
                loraPopUpMessageModel: LoraPopUpMessageModel(
                  title: S.of(context).errorGettingInformationTitle,
                  subTitle:
                      S.of(context).errorGettingInformationPortfolioSubTitle,
                  primaryButtonLabel: S.of(context).buttonReloadPage,
                  secondaryButtonLabel: S.of(context).buttonCancel,
                  onSecondaryButtonTap: () => Navigator.pop(context),
                  onPrimaryButtonTap: () => context.read<PortfolioBloc>().add(
                      (FetchActiveOrderDetail(
                          botOrderId: botActiveOrderModel.uid))),
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
                      portfolioBotDetailModel: botActiveOrderDetailModel,
                    ),
                    bottomButton:
                        _getBottomButton(context, botActiveOrderDetailModel)),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget? _getBottomButton(BuildContext context,
      BotActiveOrderDetailModel? botActiveOrderDetailModel) {
    if (botActiveOrderDetailModel != null &&
        UserJourney.compareUserJourney(
            context: context, target: UserJourney.deposit)) {
      return Padding(
        padding:
            AppValues.screenHorizontalPadding.copyWith(top: 36, bottom: 30),
        child: Column(
          children: [
            ///TODO : NEED TO TEMPORARY REMOVED AS AL1-2846
            // if (botStatus == BotStatus.liveExpireSoon)
            //   Padding(
            //     padding: const EdgeInsets.only(bottom: 20.0),
            //     child: BotRolloverButton(
            //       botActiveOrderDetailModel: botActiveOrderDetailModel,
            //       botType: botType,
            //     ),
            //   ),

            ///TODO : TEMPORARY FIX TO ALWAYS SHOW TERMINATE BUTTON
            // if (botStatus == BotStatus.active ||
            //     botStatus == BotStatus.activeExpireSoon)
            BotTerminateButton(
              botActiveOrderDetailModel: botActiveOrderDetailModel,
              botType: botType,
            ),

            ///TODO : TEMPORARY FIX TO ALWAYS SHOW CANCEL BUTTON
            //if (botStatus == BotStatus.pending)
            // BotCancelButton(
            //   botActiveOrderDetailModel: botActiveOrderDetailModel,
            // ),
          ],
        ),
      );
    } else {
      return null;
    }
  }

  static void open(
          {required BuildContext context,
          required BotActiveOrderModel botActiveOrderModel}) =>
      Navigator.pushNamed(context, route, arguments: botActiveOrderModel);
}
