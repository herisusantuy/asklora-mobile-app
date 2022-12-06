import 'package:flutter/material.dart';
import 'core/presentation/buttons/button_example.dart';
import 'core/presentation/text_fields/text_field_example.dart';
import 'core/values/app_values.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asklora Testing',
      home: Scaffold(
        body: Padding(
          padding: AppValues.screenHorizontalPadding,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            children: const [
              ButtonExample(),
              SizedBox(
                height: 24,
              ),
              TextFieldExample()
            ],
          ),
        ),
      ));
}
