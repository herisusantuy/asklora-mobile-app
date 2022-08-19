import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/deposit_bloc.dart';
import '../../bloc/navigation_bloc/navigation_bloc.dart';

class DepositNextButton extends StatelessWidget {
  final bool disable;
  final DepositPageStep nextTo;
  final String label;

  const DepositNextButton(
      {required this.nextTo,
      this.disable = true,
      Key? key,
      this.label = 'Next'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: CustomTextButton(
        disable: disable,
        buttonText: label,
        onClick: () {
          context
              .read<NavigationBloc<DepositPageStep>>()
              .add(PageChanged(nextTo));
        },
        borderRadius: 5,
      ),
    );
  }
}
