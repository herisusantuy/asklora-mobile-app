import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../bloc/deposit_bloc.dart';
import '../shareable/widget/custom_deposit_widget.dart';

class DepositMethodScreen extends StatelessWidget {
  const DepositMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      backTo: DepositPageStep.welcome,
      children: [
        const CustomText(
          'Deposit Method',
          padding: EdgeInsets.only(top: 10, bottom: 40),
          type: FontType.h2,
        ),
        const CustomText(
          'Please select method of deposit',
          padding: EdgeInsets.only(top: 10, bottom: 50),
          type: FontType.h4,
        ),
        _wireTransferButton(context),
        _fpsButton(context),
        _whatIsFpsButton(context),
        _eDdaButton(context),
        _whatIsEddaButton(context)
      ],
    );
  }

  Widget _wireTransferButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: CustomTextButton(
            key: const Key('wire_transfer_button'),
            borderRadius: 5,
            buttonText: 'WIRE TRANSFER',
            onClick: () {
              context
                  .read<DepositBloc>()
                  .add(const DepositMethodSelected(DepositMethod.wireTransfer));
              context
                  .read<DepositBloc>()
                  .add(const PageChanged(DepositPageStep.selectBank));
            }));
  }

  Widget _eDdaButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomTextButton(
            key: const Key('edda_button'),
            borderRadius: 5,
            buttonText: 'Electronic Direct Debit Authorization (eDDA)',
            onClick: () {
              context
                  .read<DepositBloc>()
                  .add(const DepositMethodSelected(DepositMethod.eDda));
              context
                  .read<DepositBloc>()
                  .add(const PageChanged(DepositPageStep.eDdaInitiate));
            }));
  }

  Widget _fpsButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: CustomTextButton(
            key: const Key('fps_button'),
            borderRadius: 5,
            buttonText: 'FPS',
            onClick: () {
              context
                  .read<DepositBloc>()
                  .add(const DepositMethodSelected(DepositMethod.fps));
              context
                  .read<DepositBloc>()
                  .add(const PageChanged(DepositPageStep.selectBank));
            }));
  }

  Widget _whatIsFpsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
          key: const Key('what_is_fps_button'),
          child: const CustomText('What is FPS?'),
          onTap: () => context
              .read<DepositBloc>()
              .add(const PageChanged(DepositPageStep.fpsMeaning))),
    );
  }

  Widget _whatIsEddaButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
          key: const Key('what_is_edda_button'),
          child: const CustomText('What is eDDA?'),
          onTap: () => context
              .read<DepositBloc>()
              .add(const PageChanged(DepositPageStep.eDdaMeaning))),
    );
  }
}
