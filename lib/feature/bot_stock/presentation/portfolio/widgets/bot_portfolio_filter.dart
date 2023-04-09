part of '../portfolio_screen.dart';

class BotPortfolioFilter extends StatelessWidget {
  const BotPortfolioFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => JustTheTooltip(
        fadeInDuration: const Duration(milliseconds: 500),
        fadeOutDuration: Duration.zero,
        elevation: 0,
        isModal: true,
        shadow: null,
        backgroundColor: Colors.transparent,
        barrierDismissible: true,
        tailLength: 0,
        tailBuilder: (Offset tip, Offset point2, Offset point3) {
          return Path();
        },
        content: Container(
          margin: const EdgeInsets.only(top: 12, right: 8),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.6,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AskLoraColors.white,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          child: BlocProvider.value(
            value: BlocProvider.of<PortfolioBloc>(context),
            child: BlocBuilder<PortfolioBloc, PortfolioState>(
                buildWhen: (previous, current) =>
                    previous.activeFilterChecked !=
                        current.activeFilterChecked ||
                    previous.pendingFilterChecked !=
                        current.pendingFilterChecked,
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomCheckbox(
                        text: 'Active',
                        isChecked: state.activeFilterChecked,
                        onChanged: (value) => context
                            .read<PortfolioBloc>()
                            .add(ActiveFilterChecked(value!)),
                      ),
                      CustomCheckbox(
                        text: 'Pending',
                        isChecked: state.pendingFilterChecked,
                        onChanged: (value) => context
                            .read<PortfolioBloc>()
                            .add(PendingFilterChecked(value!)),
                      ),
                    ],
                  );
                }),
          ),
        ),
        child: getSvgIcon('icon_bot_filter'),
      );
}
