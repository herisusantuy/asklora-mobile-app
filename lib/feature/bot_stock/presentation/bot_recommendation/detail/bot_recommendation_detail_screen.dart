import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../domain/bot_recommendation_model.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_trade_summary/bot_trade_summary_screen.dart';
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
      body: BlocProvider(
        create: (_) => BotStockBloc(botStockRepository: BotStockRepository())
          ..add(FetchBotDetail(
              ticker: botRecommendationModel.ticker,
              botId: botRecommendationModel.botId)),
        child: BlocConsumer<BotStockBloc, BotStockState>(
          listenWhen: (previous, current) =>
              previous.botDetailResponse.state !=
              current.botDetailResponse.state,
          listener: (context, state) {
            if (state.botDetailResponse.state == ResponseState.loading) {
              CustomLoadingOverlay.of(context).show();
            } else {
              CustomLoadingOverlay.of(context).dismiss();
            }
          },
          buildWhen: (previous, current) =>
              previous.botDetailResponse.state !=
              current.botDetailResponse.state,
          builder: (context, state) => CustomLayoutWithBlurPopUp(
            loraPopUpMessageModel: LoraPopUpMessageModel(
              title: 'Unable to get information',
              subTitle:
                  'There was an error when trying to get your Investment Details. Please try reloading the page',
              primaryButtonLabel: 'RELOAD PAGE',
              secondaryButtonLabel: 'CANCEL',
              onSecondaryButtonTap: () => Navigator.pop(context),
              onPrimaryButtonTap: () => context.read<BotStockBloc>().add(
                  (FetchBotDetail(
                      ticker: botRecommendationModel.ticker,
                      botId: botRecommendationModel.botId))),
            ),
            showPopUp: state.botDetailResponse.state == ResponseState.error,
            content: BotStockForm(
              useHeader: true,
              title:
                  '${botType.upperCaseName} ${botRecommendationModel.ticker}',
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
                    label: 'TRADE',
                    onTap: () {
                      if (botRecommendationModel.freeBot) {
                        BotTradeSummaryScreen.open(
                            context: context,
                            arguments: Pair(botRecommendationModel, 500));
                      } else {
                        BotStockBottomSheet.amountBotStockForm(
                            context, botRecommendationModel);
                      }
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void open(
          {required BuildContext context,
          required BotRecommendationModel botRecommendationModel}) =>
      Navigator.pushNamed(context, route, arguments: botRecommendationModel);
}
