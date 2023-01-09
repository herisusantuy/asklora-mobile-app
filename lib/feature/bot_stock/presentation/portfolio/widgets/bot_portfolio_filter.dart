part of '../portfolio_screen.dart';

class BotPortfolioFilter extends StatelessWidget {
  const BotPortfolioFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BotStockBloc, BotStockState>(builder: (context, state) {
      if (state.botPortfolioResponse.state != ResponseState.error) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: CustomDropdown(
              contentPadding:
                  TextFieldStyle.contentPadding.copyWith(top: 12, bottom: 12),
              hintText: 'All Botstocks',
              itemsList: BotStockFilter.values.map((e) => e.name).toList(),
              onChanged: (value) => context.read<BotStockBloc>().add(
                  FetchBotPortfolio(
                      botStockFilter: BotStockFilter.values
                          .firstWhere((element) => element.name == value)))),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
