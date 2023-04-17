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
import '../../../../../generated/l10n.dart';
import '../../../../bot_stock/utils/bot_stock_utils.dart';
import '../../../bloc/transaction_history_bloc.dart';
import '../../../domain/transaction_model.dart';
import '../../../repository/transaction_history_repository.dart';
import '../../widgets/transaction_history_group_title.dart';
import '../../widgets/transaction_history_tab.dart';
import '../domain/bot_summary_transaction_model.dart';

part 'widgets/transaction_history_detail_content.dart';

part 'widgets/transaction_history_bot_summary_screen.dart';

part 'widgets/transaction_history_bot_activities_screen.dart';

part 'widgets/bot_order_transaction_history_summary_card.dart';

class BotTransactionHistoryDetailScreen extends StatelessWidget {
  final TransactionModel transactionModel;
  static const String route = '/bot_transaction_history_detail_screen';

  const BotTransactionHistoryDetailScreen(
      {required this.transactionModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionHistoryBloc(
          transactionHistoryRepository: TransactionHistoryRepository())
        ..add(FetchBotTransactionDetail(transactionModel.id!)),
      child: CustomScaffold(
        enableBackNavigation: false,
        body: BlocConsumer<TransactionHistoryBloc, TransactionHistoryState>(
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
          builder: (context, state) {
            return CustomLayoutWithBlurPopUp(
              loraPopUpMessageModel: LoraPopUpMessageModel(
                title: S.of(context).errorGettingInformationTitle,
                subTitle: S.of(context).errorGettingInformationSubTitle(
                    'your Transaction History'),
                primaryButtonLabel: S.of(context).buttonReloadPage,
                secondaryButtonLabel: S.of(context).buttonCancel,
                onSecondaryButtonTap: () => Navigator.pop(context),
                onPrimaryButtonTap: () => context
                    .read<TransactionHistoryBloc>()
                    .add(FetchTransaction()),
              ),
              showPopUp: state.response.state == ResponseState.error,
              content: TransactionHistoryContent(
                title: transactionModel.titleString,
                botStatus: transactionModel.statusString,
                summaries: state.botDetailResponse.data?.summary ?? [],
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
