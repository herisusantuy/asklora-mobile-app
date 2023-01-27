import 'package:flutter/material.dart';

import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_status_widget.dart';
import '../utils/deposit_utils.dart';
import 'widgets/deposit_base_widget.dart';

class DepositResultScreen extends StatelessWidget {
  static const String route = '/deposit_result_screen';
  final StatusType statusType;
  final DepositType depositType;

  const DepositResultScreen(
      {required this.statusType, required this.depositType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DepositBaseWidget(
        useHeader: false,
        content: CustomStatusWidget(
          title: 'Deposit Request Submitted',
          statusType: statusType,
          subTitle: _getResultProps.left,
        ),
        bottomButton: _getResultProps.right);
  }

  Pair<String, Widget> get _getResultProps {
    switch (depositType) {
      case DepositType.firstTime:
        return Pair(
            'Your account opening application and initial deposit will be reviewed within 1-2 working days. You will be informed via email and app notification once your account is approved.',
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: PrimaryButton(
                label: 'DONE',
                onTap: () {},
              ),
            ));
      default:
        return Pair(
            'Your deposit request is submitted. You will be informed via email and app notification as soon as your deposit arrives.',
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonPair(
                primaryButtonLabel: 'DONE',
                primaryButtonOnClick: () {},
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
