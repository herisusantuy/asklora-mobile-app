part of '../order_screen.dart';

class TrailWidget extends StatelessWidget {
  final bool showOnlyInformation;
  final String? value;
  final Function(String)? onChanged;

  const TrailWidget({
    Key key = const Key('trail_widget'),
    this.showOnlyInformation = false,
    this.value = '',
    this.onChanged,
  }) : super(key: key);

  static TrailWidget input({required Function(String) onChanged}) {
    return TrailWidget(
      onChanged: onChanged,
      showOnlyInformation: false,
    );
  }

  static TrailWidget info({required String value}) {
    return TrailWidget(
      value: value,
      showOnlyInformation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) =>
            previous.trailType != current.trailType,
        builder: (context, state) => Column(
              children: [
                if (!showOnlyInformation)
                  CustomExpandedRow(
                    'Trail Type',
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                            key: const Key('trail_type_button'),
                            label: Text(state.trailType.name),
                            icon: const Icon(Icons.arrow_drop_down),
                            onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (_) => BlocProvider.value(
                                      value:
                                          BlocProvider.of<OrderBloc>(context),
                                      child: BlocBuilder<OrderBloc, OrderState>(
                                        builder: (context, state) =>
                                            OrderBottomSheetWidget(
                                                key: const Key(
                                                    'trail_type_bottom_sheet'),
                                                title: 'Select Trail Type',
                                                children: [
                                              CustomBottomSheetCardWidget(
                                                  key: const Key(
                                                      'trail_type_amount_choice'),
                                                  keyButton: const Key(
                                                      'trail_type_amount_choice_button'),
                                                  onTap: () => context
                                                      .read<OrderBloc>()
                                                      .add(
                                                          const TrailTypeChanged(
                                                              TrailType
                                                                  .amount)),
                                                  label: TrailType.amount.name,
                                                  text:
                                                      'Trail an amount that is below the current price of the stock',
                                                  active: state.trailType ==
                                                      TrailType.amount),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              CustomBottomSheetCardWidget(
                                                  key: const Key(
                                                      'trail_type_percentage_choice'),
                                                  keyButton: const Key(
                                                      'trail_type_percentage_choice_button'),
                                                  onTap: () => context
                                                      .read<OrderBloc>()
                                                      .add(
                                                          const TrailTypeChanged(
                                                              TrailType
                                                                  .percentage)),
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
                    ? CustomExpandedRow(
                        'Trail Percentage',
                        text: '$value',
                        child: showOnlyInformation
                            ? null
                            : CustomTextInput(
                                textInputType: TextInputType.number,
                                labelText: '',
                                onChanged: onChanged ?? (_) {}),
                      )
                    : CustomExpandedRow('Trail Amount',
                        text: r'$10',
                        child: showOnlyInformation
                            ? null
                            : CustomTextInput(
                                textInputType: TextInputType.number,
                                labelText: '',
                                onChanged: onChanged ?? (_) {})),
              ],
            ));
  }
}
