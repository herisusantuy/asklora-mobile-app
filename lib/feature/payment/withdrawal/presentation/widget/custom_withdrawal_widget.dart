import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/withdrawal_bloc.dart';

class CustomWithdrawalWidget extends StatelessWidget {
  final Widget child;
  final Widget? navigationButton;
  final bool disableButton;
  final Function? onSubmit;
  final String? title;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? header;

  const CustomWithdrawalWidget(
      {this.title,
      required this.child,
      this.onSubmit,
      this.disableButton = true,
      this.navigationButton,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.header,
      Key? key})
      : super(key: key);

  void _onTapBack(BuildContext context) =>
      context.read<NavigationBloc<WithdrawalPagesStep>>().add(const PagePop());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onTapBack(context);
        return false;
      },
      child: SafeArea(
        child: Column(
          children: [
            header ??
                Row(
                  children: [
                    InkWell(
                        onTap: () => _onTapBack(context),
                        child: const Icon(
                          Icons.chevron_left,
                          size: 52,
                        )),
                    Expanded(child: CustomText(title ?? '', type: FontType.h3)),
                  ],
                ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: child,
              ),
            ),
            navigationButton ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
