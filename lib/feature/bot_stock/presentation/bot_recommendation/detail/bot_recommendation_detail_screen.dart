import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/repository/transaction_repository.dart';
import '../../../../../core/utils/log.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../../tabs/bloc/tab_screen_bloc.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../domain/bot_recommendation_model.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_trade_summary/bot_trade_summary_screen.dart';
import '../../widgets/bot_stock_form.dart';
import 'widgets/bot_recommendation_detail_content.dart';

part 'widgets/bot_recommendation_chart.dart';

class BotRecommendationDetailScreen extends StatefulWidget {
  static const String route = '/bot_recommendation_detail_screen';
  final BotRecommendationModel botRecommendationModel;

  const BotRecommendationDetailScreen(
      {required this.botRecommendationModel, Key? key})
      : super(key: key);

  @override
  State<BotRecommendationDetailScreen> createState() =>
      _BotRecommendationDetailScreenState();

  static void open(
      {required BuildContext context,
      required BotRecommendationModel botRecommendationModel}) {
    Navigator.pushNamed(context, route, arguments: botRecommendationModel)
        .then((value) {
      context.read<TabScreenBloc>().add(TabChanged(TabPage.forYou.setData()));
    });
  }
}

class _BotRecommendationDetailScreenState
    extends State<BotRecommendationDetailScreen> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(backButtonInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(backButtonInterceptor);
    super.dispose();
  }

  bool backButtonInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final BotType botType =
        BotType.findByString(widget.botRecommendationModel.botAppType);
    return CustomScaffold(
      enableBackNavigation: false,
      body: BlocProvider(
        create: (_) {
          BotStockBloc botStockBloc = BotStockBloc(
              botStockRepository: BotStockRepository(),
              transactionRepository: TransactionRepository());
          _fetchBotDetail(botStockBloc);
          return botStockBloc;
        },
        child: BlocConsumer<BotStockBloc, BotStockState>(
          listenWhen: (previous, current) =>
              previous.botDetailResponse.state !=
              current.botDetailResponse.state,
          listener: (context, state) {
            CustomLoadingOverlay.of(context)
                .show(state.botDetailResponse.state);
          },
          buildWhen: (previous, current) =>
              previous.botDetailResponse.state !=
              current.botDetailResponse.state,
          builder: (context, state) => RefreshIndicator(
            onRefresh: () async =>
                _fetchBotDetail(context.read<BotStockBloc>()),
            child: CustomLayoutWithBlurPopUp(
              loraPopUpMessageModel: LoraPopUpMessageModel(
                title: S.of(context).errorGettingInformationTitle,
                subTitle: S
                    .of(context)
                    .errorGettingInformationInvestmentDetailSubTitle,
                primaryButtonLabel: S.of(context).buttonReloadPage,
                secondaryButtonLabel: S.of(context).buttonCancel,
                onSecondaryButtonTap: () => Navigator.pop(context),
                onPrimaryButtonTap: () =>
                    _fetchBotDetail(context.read<BotStockBloc>()),
              ),
              showPopUp: state.botDetailResponse.state == ResponseState.error,
              content: BotStockForm(
                useHeader: true,
                title:
                    '${botType.upperCaseName} ${widget.botRecommendationModel.tickerSymbol}',
                padding: EdgeInsets.zero,
                content: BotRecommendationDetailContent(
                  botRecommendationModel: widget.botRecommendationModel,
                  botType: botType,
                  botDetailModel: state.botDetailResponse.data,
                ),
                bottomButton: Padding(
                  padding: AppValues.screenHorizontalPadding
                      .copyWith(top: 24, bottom: 30),
                  child: PrimaryButton(
                    disabled: state.botDetailResponse.state ==
                            ResponseState.loading ||
                        state.botDetailResponse.state == ResponseState.error,
                    label: S.of(context).trade,
                    onTap: () {
                      if (widget.botRecommendationModel.freeBot) {
                        BotTradeSummaryScreen.open(
                            context: context,
                            botTradeSummaryModel: BotTradeSummaryModel(
                                botType: botType,
                                botRecommendationModel:
                                    widget.botRecommendationModel,
                                botDetailModel: state.botDetailResponse.data!,
                                amount: 500));
                      } else {
                        BotStockBottomSheet.amountBotStockForm(
                            context,
                            botType,
                            widget.botRecommendationModel,
                            state.botDetailResponse.data!,
                            state.buyingPower);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _fetchBotDetail(BotStockBloc botStockBloc) {
    botStockBloc.add(FetchBotDetail(
        ticker: widget.botRecommendationModel.ticker,
        botId: widget.botRecommendationModel.botId,
        isFreeBot: widget.botRecommendationModel.freeBot));
  }
}
