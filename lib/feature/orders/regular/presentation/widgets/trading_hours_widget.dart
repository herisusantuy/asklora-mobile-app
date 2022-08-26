part of '../order_screen.dart';

class TradingHoursWidget extends StatelessWidget {
  const TradingHoursWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? tradingHoursValue = 'Extended';
    return CustomExpandedRow(
      'Trading Hours',
      child: CustomDropdown(
          key: const Key('time_in_force_dropdown'),
          hintName: tradingHoursValue,
          value: tradingHoursValue,
          itemsList: const [
            'Extended',
            '1 Hour',
            '2 Hour',
          ],
          onChanged: (value) => tradingHoursValue = value),
    );
  }
}
