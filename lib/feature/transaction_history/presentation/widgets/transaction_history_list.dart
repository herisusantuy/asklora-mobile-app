part of '../transaction_history_screen.dart';

class TransactionHistoryList extends StatelessWidget {
  final List<GroupedTransactionModel> groupedTransactions;

  const TransactionHistoryList({required this.groupedTransactions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        reverse: true,
        children: groupedTransactions
            .map((e) => groupList(
                title: e.groupTitle,
                data: e.data,
                showBottomBorder: groupedTransactions.indexOf(e) == 0))
            .toList(),
      );

  Widget groupList(
      {required String title,
      required List<TransactionModel> data,
      bool showBottomBorder = false}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: showBottomBorder
                  ? const BorderSide(color: AskLoraColors.gray, width: 0.5)
                  : BorderSide.none)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _groupTitle(title),
          ...data
              .map((e) =>
                  _transactionCard(e, data.indexOf(e) != data.length - 1))
              .toList()
        ],
      ),
    );
  }

  Widget _transactionCard(
      TransactionModel transactionModel, bool showBottomBorder) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 21, 17, 26),
      decoration: BoxDecoration(
          border: Border(
              bottom: showBottomBorder
                  ? const BorderSide(color: AskLoraColors.gray, width: 0.5)
                  : BorderSide.none)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                        child: CustomTextNew(transactionModel.title ?? '')),
                    const BotFreeBadge(),
                  ],
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              CustomTextNew(
                'HKD ${transactionModel.amount}',
                style: AskLoraTextStyles.subtitle2,
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextNew(
            transactionModel.status ?? '',
            style:
                AskLoraTextStyles.body2.copyWith(color: AskLoraColors.darkGray),
          )
        ],
      ),
    );
  }

  Widget _groupTitle(String title) {
    return Container(
      width: double.infinity,
      padding: AppValues.screenHorizontalPadding.copyWith(top: 8, bottom: 8),
      color: AskLoraColors.whiteSmoke,
      child: CustomTextNew(
        title,
        style: AskLoraTextStyles.subtitle4,
      ),
    );
  }
}
