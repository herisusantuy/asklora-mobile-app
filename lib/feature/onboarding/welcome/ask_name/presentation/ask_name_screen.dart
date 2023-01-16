import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/presentation/we_create/custom_centered_text_input.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../greeting/greeting_screen.dart';
import '../bloc/lora_ask_name_bloc.dart';

class AskNameScreen extends StatelessWidget {
  static const route = '/lora_ask_name_screen';

  const AskNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: true,
      body: BlocProvider(
        create: (_) => LoraAskNameBloc(),
        child: Padding(
          padding: AppValues.screenHorizontalPadding,
          child: LayoutBuilder(
            builder: (context, constraint) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        LoraMemojiHeader(
                            text: S.of(context).askNameScreenPlaceholder),
                        CustomCenteredTextInput(
                            key: const Key('name_input'),
                            onChanged: (value) => context
                                .read<LoraAskNameBloc>()
                                .add(NameChanged(value)),
                            hintText: S.of(context).askNameScreenTextFieldHint,
                            textInputType: TextInputType.name),
                      ],
                    ),
                    _nextButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _nextButton => BlocBuilder<LoraAskNameBloc, LoraAskNameState>(
      builder: (context, state) => Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 35),
          child: PrimaryButton(
            key: const Key('next_button'),
            label: S.of(context).buttonNext,
            disabled: state.name.isEmpty,
            onTap: () => GreetingScreen.open(context, state.name),
          )));

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
