import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../core/domain/ai/component.dart';
import '../../../../core/domain/ai/conversation.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/ai/buttons/glowing_button.dart';
import '../../../../core/presentation/ai/chat/chat_lora_header.dart';
import '../../../../core/presentation/ai/chat/in_chat_bubble_widget.dart';
import '../../../../core/presentation/ai/chat/lora_thinking_widget.dart';
import '../../../../core/presentation/ai/chat/out_chat_bubble_widget.dart';
import '../../../../core/presentation/ai/lora_animation_green.dart';
import '../../../../core/presentation/ai/utils/ai_utils.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/text_fields/style/text_field_style.dart';
import '../../../../core/presentation/tutorial/Utils/tutorial_journey.dart';
import '../../../../core/presentation/tutorial/bloc/tutorial_bloc.dart';
import '../../../../core/presentation/tutorial/custom_show_case_view.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/feature_flags.dart';
import '../../../../generated/l10n.dart';
import '../../../bot_stock/presentation/portfolio/bloc/portfolio_bloc.dart';
import '../../../bot_stock/utils/bot_stock_utils.dart';
import '../../bloc/tab_screen_bloc.dart';
import '../bloc/lora_gpt_bloc.dart';
import '../domain/portfolio_query_request.dart';
import 'widget/ai_debug_widget.dart';
import 'widget/component_widget.dart';
import 'widget/session_reset_widget.dart';

part 'lora_ai_overlay_screen.dart';

part 'lora_gpt_screen.dart';

part 'widget/ai_chat_list.dart';

class LoraAiScreen extends StatelessWidget {
  const LoraAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PortfolioBloc, PortfolioState>(
            listenWhen: (previous, current) {
          return previous.transactionBalanceResponse !=
              current.transactionBalanceResponse;
        }, listener: (context, state) {
          if (state.transactionBalanceResponse.state == ResponseState.success) {
            context.read<LoraGptBloc>().add(StorePortfolioDetails(
                totalPortfolioPnl:
                    state.transactionBalanceResponse.data?.totalPnLPct ?? 0));
          }
        }),
        BlocListener<PortfolioBloc, PortfolioState>(
            listenWhen: (previous, current) {
          return previous.botActiveOrderResponse !=
              current.botActiveOrderResponse;
        }, listener: (context, state) {
          if (state.botActiveOrderResponse.state == ResponseState.success) {
            final botstocks = state.botActiveOrderResponse.data
                ?.map((e) => Botstock(
                    ticker: e.symbol,
                    botType: BotType.findByString(e.botAppsName).internalName,
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
                  .add(StoreTabPageEvent(tabPage: state.currentTabPage));
            }),
      ],
      child: BlocBuilder<LoraGptBloc, LoraGptState>(
        builder: (context, state) => ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AskLoraColors.black.withOpacity(0.4),
                    image: const DecorationImage(
                        image: AssetImage('assets/lora_gpt_background.png'),
                        fit: BoxFit.cover)),
                child: const LoraGptScreen()),
          ),
        ),
      ),
    );
  }
}
