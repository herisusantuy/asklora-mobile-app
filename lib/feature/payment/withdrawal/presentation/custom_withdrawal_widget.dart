import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/custom_text.dart';
import '../bloc/withdrawal_bloc.dart';

class CustomWithdrawalWidget extends StatelessWidget {
  final List<Widget> children;
  final WithdrawalPages? backTo;
  final Widget? navigationButton;
  final bool disableButton;
  final Function? onSubmit;
  final String? title;
  final CrossAxisAlignment crossAxisAlignment;
  final bool backButtonVisibility;
  final Widget? customHeader;

  const CustomWithdrawalWidget(
      {this.title,
      required this.children,
      this.backTo,
      this.onSubmit,
      this.disableButton = true,
      this.navigationButton,
      this.backButtonVisibility = true,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.customHeader,
      Key? key})
      : super(key: key);

  void _onTapBack(BuildContext context) => backTo != null
      ? context.read<WithdrawalBloc>().add(PageChanged(backTo!))
      : Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onTapBack(context);
        return false;
      },
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: customHeader ??
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () => _onTapBack(context),
                          child: const Icon(
                            Icons.chevron_left,
                            size: 52,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomText(title ?? '', type: FontType.h2),
                      ),
                    ],
                  ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: children,
                    ),
                  ),
                ],
              ),
            ),
          ),
          navigationButton ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
