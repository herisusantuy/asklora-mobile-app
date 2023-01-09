import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../../../../core/domain/pair.dart';
import '../../../../../../core/presentation/buttons/others/others_button.dart';
import '../../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/presentation/text_fields/custom_dropdown.dart';
import '../../../../../../core/presentation/text_fields/style/text_field_style.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/shimmer.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../bloc/bot_stock_bloc.dart';

import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_utils.dart';
import '../widgets/custom_base_silver_box.dart';
import '../../../../core/presentation/lora_popup_message.dart';
import '../widgets/pair_column_text.dart';
import 'detail/bot_portfolio_detail_screen.dart';

part 'widgets/bot_portfolio_card.dart';

part 'widgets/bot_portfolio_card_shimmer.dart';

part 'widgets/bot_portfolio_list.dart';

part 'widgets/bot_portfolio_filter.dart';

class PortfolioScreen extends StatelessWidget {
  static const String route = '/portfolio_screen';

  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository())
        ..add(const FetchBotPortfolio()),
      child: CustomScaffold(
          useSafeArea: false,
          backgroundColor: AskLoraColors.white,
          enableBackNavigation: false,
          body: ListView(
            padding:
                AppValues.screenHorizontalPadding.copyWith(top: 15, bottom: 15),
            children: [
              ..._botStockDetail,
              const SizedBox(
                height: 40,
              ),
              CustomTextNew(
                'Your Botstocks',
                style: AskLoraTextStyles.h2
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              const SizedBox(
                height: 10,
              ),
              const BotPortfolioFilter(),
              const BotPortfolioList(),
            ],
          )),
    );
  }

  List<Widget> get _botStockDetail => [
        SafeArea(
          child: CustomBaseSilverBox(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextNew(
                      'Botstock Values (USD)',
                      style: AskLoraTextStyles.body4,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomTextNew(
                      '1322.05',
                      style: AskLoraTextStyles.h2,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: AskLoraColors.charcoal, shape: BoxShape.circle),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AskLoraColors.primaryGreen,
                  size: 22,
                ),
              )
            ],
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: CustomBaseSilverBox(
                    child: Column(
              children: const [
                PairColumnText(
                    title1: 'Withdrawable Amount (USD)',
                    title2: 'Buying Power (USD)',
                    subTitle1: '1,200.00',
                    subTitle2: '250.00'),
                SizedBox(
                  height: 14,
                ),
                PairColumnText(
                    title1: 'Total Values',
                    title2: 'Total P/L',
                    subTitle1: '1,100.00',
                    subTitle2: '10.02%'),
              ],
            ))),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                OthersButton(
                  buttonOthersType: ButtonOthersType.fund,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                OthersButton(
                  buttonOthersType: ButtonOthersType.withdraw,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ];

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
