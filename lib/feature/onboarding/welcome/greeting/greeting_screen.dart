import 'package:flutter/material.dart';

import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/values/app_values.dart';
import '../../ppi/bloc/question/question_bloc.dart';
import '../../ppi/presentation/ppi_screen.dart';

class GreetingScreen extends StatelessWidget {
  static const route = '/greeting_screen';
  final String name;

  const GreetingScreen({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoraMemojiWidget(
                      text:
                          'You’re starting a NEW investment journey. Let’s give you a new and different name - Sassy $name.'),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 35, top: 24),
                      child: PrimaryButton(
                        key: const Key('next_button'),
                        label: 'NEXT',
                        onTap: () => PpiScreen.open(context,
                            arguments: Pair(
                                QuestionPageType.privacyAndPersonalisation,
                                QuestionPageStep.privacy)),
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  static void open(BuildContext context, String name) =>
      Navigator.of(context).pushNamed(route, arguments: name);
}
