import 'package:flutter/material.dart';

import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_status_widget.dart';
import '../../../tabs/tabs_screen.dart';
import '../../widgets/balance_base_widget.dart';
import '../utils/deposit_utils.dart';

class DepositResultScreen extends StatelessWidget {
  static const String route = '/deposit_result_screen';
  final StatusType statusType;
  final DepositType depositType;

  const DepositResultScreen(
      {required this.statusType, required this.depositType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BalanceBaseWidget(
        title: 'Deposit',
        useHeader: false,
        content: CustomStatusWidget(
          title: 'Deposit Request Submitted',
          statusType: statusType,
          subTitle: _getResultProps(context).left,
        ),
        bottomButton: _getResultProps(context).right);
  }

  Pair<String, Widget> _getResultProps(BuildContext context) {
    switch (depositType) {
      case DepositType.firstTime:
        return Pair(
            'Your account opening application and initial deposit will be reviewed within 1-2 working days. You will be informed via email and app notification once your account is approved.',
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: PrimaryButton(
                label: 'DONE',
                onTap: () => TabsScreen.open(context),
              ),
            ));
      default:
        return Pair(
            'Your deposit request is submitted. You will be informed via email and app notification as soon as your deposit arrives.',
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonPair(
                primaryButtonLabel: 'DONE',
                primaryButtonOnClick: () => TabsScreen.open(context),
                secondaryButtonLabel: 'VIEW TRANSACTION HISTORY',
                secondaryButtonOnClick: () {},
              ),
            ));
    }
  }

  static void open(
          {required BuildContext context,
          required Pair<DepositType, StatusType> arguments}) =>
      Navigator.pushNamed(context, route, arguments: arguments);
}
