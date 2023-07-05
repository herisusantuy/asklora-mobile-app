import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/text_fields/style/text_field_style.dart';
import '../../../../core/presentation/tutorial/Utils/tutorial_journey.dart';
import '../../../../core/presentation/tutorial/custom_show_case_view.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../generated/l10n.dart';
import '../../../bot_stock/bloc/bot_stock_bloc.dart';
import '../../../bot_stock/presentation/portfolio/bloc/portfolio_bloc.dart';
import '../../../bot_stock/utils/bot_stock_utils.dart';
import '../../bloc/tab_screen_bloc.dart';
import '../bloc/lora_gpt_bloc.dart';
import '../domain/conversation.dart';
import '../domain/portfolio_query_request.dart';
import '../repository/lora_gpt_repository.dart';
import 'widget/drag_indicator_widget.dart';
import 'widget/in_chat_bubble_widget.dart';
import 'widget/lora_thinking_widget.dart';
import 'widget/out_chat_bubble_widget.dart';
import 'widget/utils/breathing_glowing_button.dart';

part 'lora_ai_overlay_screen.dart';

part 'lora_gpt_screen.dart';

part 'widget/ai_chat_list.dart';

class LoraAiScreen extends StatelessWidget {
  const LoraAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoraGptBloc(
            loraGptRepository: LoraGptRepository(),
            sharedPreference: SharedPreference())
          ..add(const ShowOverLayScreen())
          ..add(const OnScreenLaunch()),
        child: MultiBlocListener(
            listeners: [
              BlocListener<PortfolioBloc, PortfolioState>(
                  listenWhen: (previous, current) {
                return previous.transactionBalanceResponse !=
                    current.transactionBalanceResponse;
              }, listener: (context, state) {
                if (state.transactionBalanceResponse.state ==
                    ResponseState.success) {
                  context.read<LoraGptBloc>().add(StorePortfolioDetails(
                      totalPortfolioPnl:
                          state.transactionBalanceResponse.data?.totalPnLPct ??
                              0));
                }
              }),
              BlocListener<PortfolioBloc, PortfolioState>(
                  listenWhen: (previous, current) {
                return previous.botActiveOrderResponse !=
                    current.botActiveOrderResponse;
              }, listener: (context, state) {
                if (state.botActiveOrderResponse.state ==
                    ResponseState.success) {
                  final botstocks = state.botActiveOrderResponse.data
                      ?.map((e) => Botstock(
                          ticker: e.symbol,
                          botType:
                              BotType.findByString(e.botAppsName).internalName,
                          duration: e.botDuration,
                          totalPnl: e.totalPnLPct.toString(),
                          expiryDate: e.expireDate ?? e.optimalTime))
                      .toList();

                  context
                      .read<LoraGptBloc>()
                      .add(StorePortfolioBotStocks(botstocks: botstocks ?? []));
                }
              }),
              BlocListener<TabScreenBloc, TabScreenState>(
                  listenWhen: (previous, current) =>
                      previous.currentTabPage != current.currentTabPage,
                  listener: (context, state) {
                    context
                        .read<LoraGptBloc>()
                        .add(StoreTabPageState(tabPage: state.currentTabPage));
                  }),
            ],
            child: BlocBuilder<LoraGptBloc, LoraGptState>(
                builder: (context, state) => state.shouldShowOverlay
                    ? const LoraAiOverlayScreen()
                    : const LoraGptScreen())));
  }
}
