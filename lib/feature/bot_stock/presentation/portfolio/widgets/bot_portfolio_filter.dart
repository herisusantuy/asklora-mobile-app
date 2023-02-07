part of '../portfolio_screen.dart';

class BotPortfolioFilter extends StatelessWidget {
  const BotPortfolioFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
        buildWhen: (previous, current) =>
            previous.botStockFilter != current.botStockFilter,
        builder: (context, state) {
          if (state.botPortfolioResponse.state != ResponseState.error) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CustomDropdown(
                initialValue: state.botStockFilter.name,
                contentPadding:
                    TextFieldStyle.contentPadding.copyWith(top: 12, bottom: 12),
                hintText: 'All Botstocks',
                itemsList: BotStockFilter.values.map((e) => e.name).toList(),
                onChanged: (value) => context.read<PortfolioBloc>().add(
                    BotStockFilterChanged(BotStockFilter.values
                        .firstWhere((element) => element.name == value))),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
