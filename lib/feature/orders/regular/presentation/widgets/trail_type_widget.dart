part of '../order_screen.dart';

class TrailTypeWidget extends StatelessWidget {
  const TrailTypeWidget({Key key = const Key('trail_type_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) =>
            previous.trailType != current.trailType,
        builder: (context, state) => Column(
              children: [
                CustomExpandedRow(
                  'Trail Type',
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                          label: Text(state.trailType.name),
                          icon: const Icon(Icons.arrow_drop_down),
                          onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                    value: BlocProvider.of<OrderBloc>(context),
                                    child: BlocBuilder<OrderBloc, OrderState>(
                                      builder: (context, state) =>
                                          OrderBottomSheetWidget(
                                              title: 'Select Trail Type',
                                              children: [
                                            CustomBottomSheetCardWidget(
                                                onTap: () => context
                                                    .read<OrderBloc>()
                                                    .add(const TrailTypeChanged(
                                                        TrailType.amount)),
                                                label: TrailType.amount.name,
                                                text:
                                                    'Trail an amount that is below the current price of the stock',
                                                active: state.trailType ==
                                                    TrailType.amount),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            CustomBottomSheetCardWidget(
                                                onTap: () => context
                                                    .read<OrderBloc>()
                                                    .add(const TrailTypeChanged(
                                                        TrailType.percentage)),
                                                label:
                                                    TrailType.percentage.name,
                                                text:
                                                    'Trail a percentage that is below the current price of the stock',
                                                active: state.trailType ==
                                                    TrailType.percentage)
                                          ]),
                                    ),
                                  )))),
                ),
                state.trailType == TrailType.percentage
                    ? const CustomExpandedRow(
                        'Trail Percentage',
                        text: '15%',
                      )
                    : const CustomExpandedRow(
                        'Trail Amount',
                        text: r'$10',
                      ),
              ],
            ));
  }
}
