part of '../transaction_history_screen.dart';

class TransactionHistoryContent extends StatefulWidget {
  const TransactionHistoryContent({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryContent> createState() =>
      _TransactionHistoryContentState();
}

class _TransactionHistoryContentState extends State<TransactionHistoryContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Orders',
    ),
    Tab(
      text: 'Transfer',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
          context
              .read<TransactionHistoryBloc>()
              .add(FilterTransaction(_tabController.index));
        }
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHeader(title: 'Transaction History'),
        Container(
          margin: AppValues.screenHorizontalPadding.copyWith(top: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AskLoraColors.whiteSmoke,
          ),
          height: 40,
          child: TabBar(
              controller: _tabController,
              labelStyle: AskLoraTextStyles.subtitle4,
              padding: const EdgeInsets.all(2),
              indicatorColor: Colors.red,
              labelColor: AskLoraColors.charcoal,
              unselectedLabelColor: AskLoraColors.darkGray,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AskLoraColors.primaryGreen),
              tabs: _tabs),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
            buildWhen: (previous, current) =>
                previous.transactions != current.transactions,
            builder: (context, state) =>
                TransactionHistoryList(groupedTransactions: state.transactions),
          ),
        ),
      ],
    );
  }
}
