part of '../order_screen.dart';

class TimeInForceWidget extends StatelessWidget {
  const TimeInForceWidget({Key key = const Key('time_in_force_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow(
      'Time In Force',
      child: BlocBuilder<OrderBloc, OrderState>(
          buildWhen: (previous, current) =>
              previous.timeInForce != current.timeInForce,
          builder: (context, state) => Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                  key: const Key('time_in_force_button'),
                  label: Text(state.timeInForce.name),
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<OrderBloc>(context),
                            child: BlocBuilder<OrderBloc, OrderState>(
                              builder: (context, state) =>
                                  OrderBottomSheetWidget(
                                      key: const Key(
                                          'time_in_force_bottom_sheet'),
                                      title: 'Select Time in Force',
                                      children: [
                                    CustomBottomSheetCardWidget(
                                        key: const Key(
                                            'time_in_force_day_choice'),
                                        keyButton: const Key(
                                            'time_in_force_day_choice_button'),
                                        onTap: () => context
                                            .read<OrderBloc>()
                                            .add(const TimeInForceChanged(
                                                TimeInForce.day)),
                                        label: TimeInForce.day.name,
                                        text:
                                            "The order will be executed only the day it's live. The order will be cancelled if it isn't filled before the market closes",
                                        active: state.timeInForce ==
                                            TimeInForce.day),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    CustomBottomSheetCardWidget(
                                        key: const Key(
                                            'time_in_force_good_till_cancelled_choice'),
                                        keyButton: const Key(
                                            'time_in_force_good_till_cancelled_choice_button'),
                                        onTap: () => context
                                            .read<OrderBloc>()
                                            .add(const TimeInForceChanged(
                                                TimeInForce.goodTillCanceled)),
                                        label:
                                            TimeInForce.goodTillCanceled.name,
                                        text:
                                            "The order will be active until it's filled or cancelled",
                                        active: state.timeInForce ==
                                            TimeInForce.goodTillCanceled),
                                  ]),
                            ),
                          ))))),
    );
  }
}
