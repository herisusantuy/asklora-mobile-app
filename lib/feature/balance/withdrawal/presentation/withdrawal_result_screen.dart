import 'package:flutter/material.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_status_widget.dart';
import '../../../tabs/tabs_screen.dart';
import '../../widgets/balance_base_form.dart';

class WithdrawalResultScreen extends StatelessWidget {
  static const String route = '/withdrawal_result_screen';

  const WithdrawalResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BalanceBaseForm(
        useHeader: false,
        content: const CustomStatusWidget(
          title: 'Your withdrawal request is submitted.',
          statusType: StatusType.success,
          subTitle:
              'You will be informed via email and app notification as soon as the funds are paid to your account.',
        ),
        bottomButton: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ButtonPair(
            primaryButtonLabel: 'DONE',
            primaryButtonOnClick: () => TabsScreen.open(context),
            secondaryButtonLabel: 'VIEW TRANSACTION HISTORY',
            secondaryButtonOnClick: () {},
          ),
        ));
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
