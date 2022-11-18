import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_centered_text_input.dart';
import '../../greeting/greeting_screen.dart';
import '../bloc/lora_ask_name_bloc.dart';
import '../../widgets/memoji_widget.dart';

class LoraAskNameScreen extends StatelessWidget {
  static const route = '/lora_ask_name_screen';

  const LoraAskNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: BlocProvider(
        create: (_) => LoraAskNameBloc(),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const MEmojiWidget(
                  text:
                      "Hi! I'm Lora, your AI investment coach. What should I call you?",
                  imageAsset: '/',
                ),
                Builder(
                    builder: (context) => CustomCenteredTextInput(
                      key: const Key('name_input'),
                          onChanged: (value) => context
                              .read<LoraAskNameBloc>()
                              .add(NameChanged(value)),
                          hintText: 'Your Name',
                          padding: const EdgeInsets.only(
                              top: 18, left: 32, right: 32),
                        )),
              ],
            )),
            _nextButton
          ],
        ),
      ),
    );
  }

  Widget get _nextButton => BlocBuilder<LoraAskNameBloc, LoraAskNameState>(
      builder: (context, state) => CustomButton(
        key: const Key('next_button'),
            label: 'Next',
            disable: state.name.isEmpty,
            onClick: () => GreetingScreen.open(context, state.name),
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          ));

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
