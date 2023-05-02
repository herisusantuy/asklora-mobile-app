import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/domain/base_response.dart';
import '../../../core/domain/pair.dart';
import '../../../core/presentation/bot_badge/lora_pop_up_message_with_bot_badge.dart';
import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/lora_popup_message/lora_popup_message.dart';
import '../../../core/presentation/round_colored_box.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/utils/extensions.dart';
import '../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';
import '../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../tabs_screen.dart';
import 'bloc/home_screen_bloc.dart';
import 'custom_header/custom_sliver_persistent_header.dart';
import 'widgets/on_boarding_status/on_boarding_status.dart';

part 'widgets/home_screen_content_widget.dart';

part 'widgets/home_screen_free_bot_stock_timer_widget.dart';

part 'widgets/home_screen_horizontal_padding_widget.dart';

part 'widgets/home_screen_investment_style_widget.dart';

part 'widgets/home_screen_milestone_completion_reminder_widget.dart';

part 'widgets/home_screen_need_help_button_widget.dart';

part 'widgets/home_screen_pop_up_message_widget.dart';

part 'widgets/home_screen_pop_up_message_with_bot_badge_widget.dart';

class HomeScreenForm extends StatelessWidget {
  const HomeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocProvider(
        create: (context) =>
            HomeScreenBloc(ppiResponseRepository: PpiResponseRepository())
              ..add(GetUserSnapShots()),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverPersistentHeader(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 100,
                ),
                const HomeScreenHorizontalPaddingWidget(
                  child: OnBoardingStatus(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const HomeScreenContentWidget(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
