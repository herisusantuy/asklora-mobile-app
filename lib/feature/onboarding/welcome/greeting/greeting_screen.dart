import 'package:flutter/material.dart';

import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../core/presentation/we_create/custom_button.dart';
import '../../ppi/presentation/ppi_screen.dart';
import '../widgets/memoji_widget.dart';

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
          MEmojiWidget(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel nunc, egestas pulvinar sed ac semper porta, xxx $name.',
              imageAsset: '/'),
          CustomButton(
            key: const Key('next_button'),
            label: 'Next',
            onClick: () => PpiScreen.open(context),
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          )
        ],
      ),
    );
  }

  static void open(BuildContext context, String name) =>
      Navigator.of(context).pushNamed(route, arguments: name);
}
