import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
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
import 'widgets/empty_transaction_placeholder.dart';
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
        body: BlocListener<TransactionHistoryBloc, TransactionHistoryState>(
          listenWhen: (previous, current) =>
              previous.response.state != current.response.state,
          listener: (context, state) {
            CustomLoadingOverlay.of(context).show(state.response.state);
          },
          child: const TransactionHistoryContent(),
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
