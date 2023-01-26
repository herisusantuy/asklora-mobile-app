import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../bot_stock/presentation/bot_recommendation/bot_recommendation_screen.dart';
import '../../../bot_stock/presentation/widgets/bot_bottom_sheet_widget.dart';
import '../../../bot_stock/repository/bot_stock_repository.dart';
import '../../../bot_stock/utils/bot_stock_utils.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../onboarding/welcome/carousel/presentation/carousel_screen.dart';
import '../../demonstration_question/widgets/demonstration_tooltip_guide.dart';
import '../../learning_screen.dart';
import '../bloc/demonstration_bot_bloc.dart';

part 'widgets/demonstration_bot_list.dart';

class DemonstrationBotScreen extends StatelessWidget {
  static const String route = '/demonstration_bot_screen';

  final BotType botType;
  final JustTheController tooltipController;

  const DemonstrationBotScreen(
      {required this.tooltipController, required this.botType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<NavigationBloc<LearningPageStep>>().add(const PagePop());
        return false;
      },
      child: BlocProvider(
        create: (_) =>
            DemonstrationBotBloc(botStockRepository: BotStockRepository())
              ..add(FetchBotDemonstration()),
        child: BlocListener<DemonstrationBotBloc, DemonstrationBotState>(
          listenWhen: (previous, current) =>
              previous.botDemonstrationResponse.state !=
              current.botDemonstrationResponse.state,
          listener: (context, state) {
            if (state.botDemonstrationResponse.state == ResponseState.success) {
              _showBottomSheet(context);
            }
          },
          child: Padding(
            padding: AppValues.screenHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(context),
                _contents(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contents(BuildContext context) => Expanded(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 35),
          children: [
            _header(context),
            DemonstrationBotList(
              botType: botType,
              verticalMargin: 14,
              tooltipController: tooltipController,
            ),
            _loraMemojiWidget,
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      );

  Widget _backButton(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: InkWell(
            onTap: () => context
                .read<NavigationBloc<LearningPageStep>>()
                .add(const PagePop()),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24,
              color: AskLoraColors.charcoal,
            )),
      );

  Widget _header(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            'Investments for you, by you',
            style: AskLoraTextStyles.h2.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextNew(
            'For demonstration purposes only. NOT a real trade.',
            style:
                AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
          ),
        ],
      );

  Widget get _loraMemojiWidget => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            const LoraMemojiHeader(
                text: 'Not feeling it? Try something different.'),
            PrimaryButton(label: 'CHANGE INVESTMENT STYLE', onTap: () {}),
          ],
        ),
      );

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (_) => WillPopScope(
              onWillPop: () async {
                Navigator.pop(context);
                context
                    .read<NavigationBloc<LearningPageStep>>()
                    .add(const PagePop());
                return false;
              },
              child: BotBottomSheetWidget(
                title:
                    "Let's see the recommendations based on your Investment style.",
                primaryButtonLabel: 'VIEW RECOMMENDATIONS',
                secondaryButtonLabel: 'CONTINUE LATER',
                onPrimaryButtonTap: () {
                  tooltipController.showTooltip();
                  Navigator.pop(context);
                },
                onSecondaryButtonTap: () => CarouselScreen.open(context),
              ),
            ));
  }

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
