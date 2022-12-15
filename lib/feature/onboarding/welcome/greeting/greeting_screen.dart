import 'package:flutter/material.dart';

import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../ppi/bloc/question/question_bloc.dart';
import '../../ppi/presentation/ppi_screen.dart';

class GreetingScreen extends StatelessWidget {
  static const route = '/greeting_screen';
  final String name;

  const GreetingScreen({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoraMemojiWidget(
              text:
                  'You’re starting a NEW investment journey. Let’s give you a new and different name - Sassy $name.'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 14),
              child: PrimaryButton(
                key: const Key('next_button'),
                label: 'NEXT',
                onTap: () => PpiScreen.open(context,
                    arguments: Pair(QuestionPageType.privacyAndPersonalisation,
                        QuestionPageStep.privacy)),
              )),
        ],
      ),
    );
  }

  static void open(BuildContext context, String name) =>
      Navigator.of(context).pushNamed(route, arguments: name);
}
