import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/alert_dialog.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../bloc/bank_account_bloc.dart';
import '../../presentation/custom_payment_button_button.dart';
import '../bloc/deposit_bloc.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';

class DepositWelcomeScreen extends StatelessWidget {
  const DepositWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<DepositPageStep>(
      title: 'Deposit',
      navigationButton: BlocConsumer<BankAccountBloc, BankAccountState>(
        listener: (context, state) {
          if (state.response.state == ResponseState.success) {
            context
                .read<NavigationBloc<DepositPageStep>>()
                .add(const PageChanged(DepositPageStep.depositMethod));
          } else if (state.response.state == ResponseState.success) {
            showAlertDialog(context, state.response.message,
                onPressedOk: () {});
          }
        },
        builder: (context, state) => CustomPaymentButton(
          key: const Key('deposit_welcome_screen_next_button'),
          title: 'Next',
          onSubmit: () => showAlertDialog(context,
              'Please note that for same day deposits, there is a deposit cutoff time of 15:00HKT. If you deposit after this time, your request will be processed in the next business day',
              title: '',
              onPressedOk: () => context
                  .read<BankAccountBloc>()
                  .add(const RegisteredBankAccountCheck())),
          isLoading: state.response.state == ResponseState.loading,
          disable: false,
        ),
      ),
      child: ListView(
        children: [
          const CustomText(
            'AskLORA allows you to deposit either through wire, FPS, or set up an eDDA. Here are the steps that you need to take to deposit with us:',
            key: Key('subtitle_deposit_welcome_screen'),
            padding: EdgeInsets.only(top: 10, bottom: 30),
            type: FontType.smallTextBold,
          ),
          ..._fpsMethodGuide,
          const SizedBox(
            height: 32,
          ),
          ..._eDdaMethodGuide,
          const SizedBox(
            height: 32,
          ),
          ..._depositNotes
        ],
      ),
    );
  }

  List<Widget> get _depositNotes => [
        const CustomText(
          'Notes:',
          key: Key('deposit_notes'),
          padding: EdgeInsets.only(bottom: 6),
          type: FontType.smallText,
        ),
        _customTextRow('1',
            'We work with Alpaca Securities LLC (“Alpaca”) in the US to handle your funds. Your deposit will be sent to Alpaca every business day and your account will be credited as soon as the money arrives in Alpaca’s bank account. As such, please note that by law, we do not hold your funds in HK for more than 24 hours.',
            fontType: FontType.smallText),
        _customTextRow('2',
            'There is a cutoff time by which your deposits will actually be credited to your account. Please click here to learn more about cutoff times.',
            fontType: FontType.smallText),
        _customTextRow('3',
            'By depositing with AskLORA, you indicate that you have read and agreed to be bound by the terms set out in the Alpaca Customer Agreement and LORA Technologies Client Agreement',
            fontType: FontType.smallText),
      ];

  List<Widget> get _fpsMethodGuide => [
        const CustomText(
          'If you’re wire transferring or transferring using FPS',
          key: Key('fps_method_subtitle_guide'),
          padding: EdgeInsets.only(bottom: 6),
          type: FontType.smallText,
        ),
        _customTextRow('1', 'Choose your deposit method'),
        _customTextRow('2',
            "Transfer the funds to LORA's bank account through your bank app"),
        _customTextRow('3', 'Upload proof of remittance'),
      ];

  List<Widget> get _eDdaMethodGuide => [
        const CustomText(
          'If you’re transferring using eDDA',
          key: Key('edda_method_subtitle_guide'),
          padding: EdgeInsets.only(bottom: 6),
          type: FontType.smallText,
        ),
        _customTextRow('1', 'Connect your bank account with us'),
        _customTextRow('2', 'Input your desired deposit amount'),
      ];

  Widget _customTextRow(String index, String text,
          {FontType fontType = FontType.bodyText}) =>
      Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: CustomText('$index.', type: fontType)),
            Expanded(flex: 14, child: CustomText(text, type: fontType))
          ],
        ),
      );
}
