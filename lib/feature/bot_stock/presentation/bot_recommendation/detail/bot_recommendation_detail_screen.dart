import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/repository/transaction_repository.dart';
import '../../../../../core/utils/back_button_interceptor/back_button_interceptor_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../../tabs/bloc/tab_screen_bloc.dart';
import '../../../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../domain/bot_recommendation_model.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_trade_summary/bot_trade_summary_screen.dart';
import '../../portfolio/bloc/portfolio_bloc.dart';
import '../../widgets/bot_stock_form.dart';
import 'widgets/bot_recommendation_detail_content.dart';

part 'widgets/bot_recommendation_chart.dart';

class BotRecommendationDetailScreen extends StatelessWidget {
  static const String route = '/bot_recommendation_detail_screen';
  final BotRecommendationModel botRecommendationModel;

  const BotRecommendationDetailScreen(
      {required this.botRecommendationModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType =
        BotType.findByString(botRecommendationModel.botAppType);
    return CustomScaffold(
      enableBackNavigation: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) {
            BotStockBloc botStockBloc = BotStockBloc(
                botStockRepository: BotStockRepository(),
                transactionRepository: TransactionRepository());
            _fetchBotDetail(botStockBloc);
            return botStockBloc;
          }),
          BlocProvider(
              create: (_) =>
                  BackButtonInterceptorBloc()..add(InitiateInterceptor()))
        ],
        child:
            BlocListener<BackButtonInterceptorBloc, BackButtonInterceptorState>(
          listener: (context, state) {
            if (state is OnPressedBack) {
              Navigator.pop(context);
            }
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
                      '${botType.upperCaseName} ${botRecommendationModel.tickerSymbol}',
                  padding: EdgeInsets.zero,
                  content: BotRecommendationDetailContent(
                    botRecommendationModel: botRecommendationModel,
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
                        if (botRecommendationModel.freeBot) {
                          context
                              .read<BackButtonInterceptorBloc>()
                              .add(RemoveInterceptor());
                          BotTradeSummaryScreen.openWithBackCallBack(
                              context: context,
                              botTradeSummaryModel: BotTradeSummaryModel(
                                  botType: botType,
                                  botRecommendationModel:
                                      botRecommendationModel,
                                  botDetailModel: state.botDetailResponse.data!,
                                  amount: 500,
                                  onCreateOrderSuccessCallback: () {
                                    context
                                        .read<PortfolioBloc>()
                                        .add(FetchBalance());
                                    context
                                        .read<PortfolioBloc>()
                                        .add(const FetchActiveOrders());
                                    context.read<TabScreenBloc>().add(
                                        const TabChanged(TabPage.portfolio));
                                    context
                                        .read<ForYouBloc>()
                                        .add(GetInvestmentStyleState());
                                  }),
                              backCallBack: () {
                                context
                                    .read<BackButtonInterceptorBloc>()
                                    .add(InitiateInterceptor());
                              });
                        } else {
                          BotStockBottomSheet.amountBotStockForm(
                              context,
                              botType,
                              botRecommendationModel,
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
      ),
    );
  }

  void _fetchBotDetail(BotStockBloc botStockBloc) {
    botStockBloc.add(FetchBotDetail(
        ticker: botRecommendationModel.ticker,
        botId: botRecommendationModel.botId,
        isFreeBot: botRecommendationModel.freeBot));
  }

  static void open(
      {required BuildContext context,
      required BotRecommendationModel botRecommendationModel}) {
    Navigator.pushNamed(context, route, arguments: botRecommendationModel)
        .then((value) {
      context.read<TabScreenBloc>().add(TabChanged(TabPage.forYou.setData()));
    });
  }
}
