part of '../order_screen.dart';

class TradingHoursWidget extends StatelessWidget {
  const TradingHoursWidget({Key key = const Key('trading_hours_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow(
      'Trading Hours',
      child: BlocBuilder<OrderBloc, OrderState>(
          buildWhen: (previous, current) =>
              previous.tradingHours != current.tradingHours,
          builder: (context, state) => Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                  label: Text(state.tradingHours.name),
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<OrderBloc>(context),
                            child: BlocBuilder<OrderBloc, OrderState>(
                              builder: (context, state) =>
                                  OrderBottomSheetWidget(
                                      title: 'Select Trading Hours',
                                      children: [
                                    CustomBottomSheetCardWidget(
                                        onTap: () => context
                                            .read<OrderBloc>()
                                            .add(const TradingHoursChanged(
                                                TradingHours.regular)),
                                        label: TradingHours.regular.name,
                                        text:
                                            'Orders will be executed from 09:30 ET - 16:00 ET (normal market hours)',
                                        active: state.tradingHours ==
                                            TradingHours.regular),
                                    _spaceHeight,
                                    CustomBottomSheetCardWidget(
                                        onTap: () => context
                                            .read<OrderBloc>()
                                            .add(const TradingHoursChanged(
                                                TradingHours.extended)),
                                        label: TradingHours.extended.name,
                                        text:
                                            'Orders will be executed from 04:00 ET - 20:00 ET',
                                        active: state.tradingHours ==
                                            TradingHours.extended),
                                    _spaceHeight,
                                    const CustomText(
                                      'Please note that extended trading hours are only available for limit orders',
                                      type: FontType.smallText,
                                      padding: EdgeInsets.only(bottom: 16),
                                    ),
                                    const CustomText(
                                      'When trading extended hours, you should  review the Extended Hours Trading Risk Disclosure to make sure you’re familiar with the potential risks',
                                      type: FontType.smallText,
                                      padding: EdgeInsets.only(bottom: 16),
                                    ),
                                  ]),
                            ),
                          ))))),
    );
  }

  Widget get _spaceHeight => const SizedBox(
        height: 16,
      );
}
