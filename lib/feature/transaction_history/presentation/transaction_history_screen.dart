import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/values/app_values.dart';
import '../../../generated/l10n.dart';
import '../../bot_stock/presentation/portfolio/portfolio_screen.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';
import '../bloc/transaction_history_bloc.dart';
import '../bot_order/detail/bot_order_transaction_history_detail_screen.dart';
import '../domain/grouped_model.dart';
import '../domain/transaction_model.dart';
import '../repository/transaction_history_repository.dart';
import 'widgets/transaction_history_group_title.dart';

part 'widgets/transaction_history_content.dart';

part 'widgets/transaction_history_group_widget.dart';

part 'widgets/transaction_history_list.dart';

part '../bot_order/bot_order_transaction_history_list.dart';

part '../bot_order/bot_order_transaction_history_card.dart';

part '../transfer/transfer_transaction_history_list.dart';

part '../transfer/transfer_transaction_history_card.dart';

class TransactionHistoryScreen extends StatelessWidget {
  static const String route = '/transaction_history_screen';

  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionHistoryBloc(
          transactionHistoryRepository: TransactionHistoryRepository())
        ..add(FetchTransaction()),
      child: CustomScaffold(
        body: BlocConsumer<TransactionHistoryBloc, TransactionHistoryState>(
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
                subTitle: S
                    .of(context)
                    .errorGettingInformationTransactionHistorySubTitle,
                primaryButtonLabel: S.of(context).buttonReloadPage,
                secondaryButtonLabel: S.of(context).buttonCancel,
                onSecondaryButtonTap: () => Navigator.pop(context),
                onPrimaryButtonTap: () => context
                    .read<TransactionHistoryBloc>()
                    .add(FetchTransaction()),
              ),
              showPopUp: state.response.state == ResponseState.error,
              content: const TransactionHistoryContent(),
            );
          },
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
