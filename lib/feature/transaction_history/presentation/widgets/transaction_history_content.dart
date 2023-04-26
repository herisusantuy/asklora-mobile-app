part of '../transaction_history_screen.dart';

class TransactionHistoryContent extends StatelessWidget {
  const TransactionHistoryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          CustomHeader(title: S.of(context).transactionHistoryTitle),
          Container(
            margin: AppValues.screenHorizontalPadding.copyWith(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AskLoraColors.whiteSmoke,
            ),
            height: 40,
            child: TabBar(
                labelStyle: AskLoraTextStyles.subtitle4,
                padding: const EdgeInsets.all(2),
                indicatorColor: Colors.red,
                labelColor: AskLoraColors.charcoal,
                unselectedLabelColor: AskLoraColors.darkGray,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AskLoraColors.primaryGreen),
                tabs: [
                  Tab(
                    text: S.of(context).transactionHistoryTabAll,
                  ),
                  Tab(
                    text: S.of(context).transactionHistoryTabOrders,
                  ),
                  Tab(
                    text: S.of(context).transactionHistoryTabTransfer,
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: TabBarView(children: [
              TransactionHistoryList(),
              BotOrderTransactionHistoryList(),
              TransferTransactionHistoryList(),
            ]),
          ),
        ],
      ),
    );
  }
}
