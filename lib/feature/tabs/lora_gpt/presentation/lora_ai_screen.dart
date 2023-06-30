import 'package:flutter/material.dart';
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
import '../bloc/lora_gpt_bloc.dart';
import '../domain/conversation.dart';
import '../repository/lora_gpt_repository.dart';
import 'widget/in_chat_bubble_widget.dart';
import 'widget/lora_thinking_widget.dart';
import 'widget/out_chat_bubble_widget.dart';
import 'widget/utils/breathing_glowing_button.dart';

part 'lora_ai_overlay_screen.dart';

part 'lora_gpt_screen.dart';

class LoraAiScreen extends StatelessWidget {
  const LoraAiScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (_) => LoraGptBloc(
          loraGptRepository: LoraGptRepository(),
          sharedPreference: SharedPreference())
        ..add(const ShowOverLayScreen())
        ..add(const OnScreenLaunch()),
      child: BlocBuilder<LoraGptBloc, LoraGptState>(
          builder: (context, state) => state.shouldShowOverlay
              ? const LoraAiOverlayScreen()
              : const LoraGptScreen()));
}
