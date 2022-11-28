import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/presentation/custom_text_input.dart';
import '../../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../bloc/kyc_bloc.dart';
import '../../widgets/kyc_base_form.dart';

class DisclosureAffiliationBaseInputScreen extends StatelessWidget {
  final double progress;
  final Function(String) onFirstNameChanged;
  final Function(String) onLastNameChanged;
  final Widget bottomButton;

  const DisclosureAffiliationBaseInputScreen(
      {required this.progress,
      Key? key,
      required this.onFirstNameChanged,
      required this.onLastNameChanged,
      required this.bottomButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      progress: progress,
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: Listener(
        onPointerDown: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            const CustomText(
              'Please provide the name of affiliated person.',
              type: FontType.smallText,
              padding: AppValues.screenHorizontalPadding,
            ),
            _textInput(
                label: 'English First Name',
                onChanged: onFirstNameChanged,
                hintText: 'English First Name',
                padding: AppValues.screenHorizontalPadding.copyWith(top: 38)),
            _textInput(
                label: 'English Last Name',
                onChanged: onLastNameChanged,
                hintText: 'English Last Name',
                padding: AppValues.screenHorizontalPadding.copyWith(top: 28)),
          ],
        ),
      ),
      bottomButton: bottomButton,
    );
  }

  Widget _textInput(
          {required String label,
          EdgeInsets padding = EdgeInsets.zero,
          required Function(String) onChanged,
          String hintText = ''}) =>
      Padding(
        padding: padding,
        child: CustomTextInput(
          textCapitalization: TextCapitalization.words,
          onChanged: onChanged,
          labelText: label,
          hintText: hintText,
          textInputFormatterList: [fullEnglishNameFormatter()],
          textInputType: TextInputType.text,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      );
}
