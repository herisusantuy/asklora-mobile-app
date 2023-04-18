import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../generated/l10n.dart';
import '../../../bot_stock/utils/bot_stock_utils.dart';
import '../../domain/grouped_model.dart';
import '../../domain/transaction_model.dart';
import '../../presentation/widgets/transaction_history_group_title.dart';
import '../../presentation/widgets/transaction_history_tab.dart';
import '../../repository/transaction_history_repository.dart';
import 'domain/bot_activities_transaction_history_model.dart';
import 'domain/bot_summary_transaction_history_model.dart';
import 'bloc/bot_transaction_history_detail_bloc.dart';

part 'widgets/bot_order_transaction_history_detail_content.dart';

part 'bot_order_transaction_history_summary_screen.dart';

part 'bot_order_transaction_history_activities_screen.dart';

part 'widgets/bot_order_transaction_history_summary_card.dart';
part 'widgets/bot_order_transaction_history_activities_group_widget.dart';
part 'widgets/bot_order_transaction_history_activities_card.dart';

class BotOrderTransactionHistoryDetailScreen extends StatelessWidget {
  final TransactionModel transactionModel;
  static const String route = '/bot_transaction_history_detail_screen';

  const BotOrderTransactionHistoryDetailScreen(
      {required this.transactionModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BotTransactionHistoryDetailBloc(
          transactionHistoryRepository: TransactionHistoryRepository())
        ..add(FetchBotTransactionDetail(transactionModel.id!)),
      child: CustomScaffold(
        enableBackNavigation: false,
        body: BlocConsumer<BotTransactionHistoryDetailBloc,
            BotTransactionHistoryDetailState>(
          listenWhen: (previous, current) =>
              previous.response.state != current.response.state,
          listener: (context, state) {
            CustomLoadingOverlay.of(context).show(state.response.state);
          },
          buildWhen: (previous, current) =>
              previous.response.state != current.response.state,
          builder: (context, state) {
            return CustomLayoutWithBlurPopUp(
              loraPopUpMessageModel: LoraPopUpMessageModel(
                title: S.of(context).errorGettingInformationTitle,
                subTitle: S.of(context).errorGettingInformationSubTitle(
                    S.of(context).transactionHistory),
                primaryButtonLabel: S.of(context).buttonReloadPage,
                secondaryButtonLabel: S.of(context).buttonCancel,
                onSecondaryButtonTap: () => Navigator.pop(context),
                onPrimaryButtonTap: () => context
                    .read<BotTransactionHistoryDetailBloc>()
                    .add(FetchBotTransactionDetail(transactionModel.id!)),
              ),
              showPopUp: state.response.state == ResponseState.error,
              content: BotOrderTransactionHistoryDetailContent(
                title: transactionModel.titleString,
                botStatus: transactionModel.statusString,
                summaries: state.response.data?.summary ?? [],
              ),
            );
          },
        ),
      ),
    );
  }

  static void open(BuildContext context, TransactionModel transactionModel) =>
      Navigator.pushNamed(context, route, arguments: transactionModel);
}
