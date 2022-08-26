part of '../order_screen.dart';

class TimeInForceWidget extends StatelessWidget {
  const TimeInForceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? timeInForceValue = 'Day';
    return CustomExpandedRow(
      'Time in Force',
      widgetValue: CustomDropdown(
          key: const Key('time_in_force_dropdown'),
          hintName: timeInForceValue,
          value: timeInForceValue,
          itemsList: const [
            'Day',
            'Week',
            'Month',
          ],
          onChanged: (value) => timeInForceValue = value),
    );
  }
}
