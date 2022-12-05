import 'package:flutter/material.dart';

import '../../values/app_values.dart';
import '../we_create/custom_app_bar.dart';
import 'master_text_field.dart';

class TextFieldExperimentScreen extends StatelessWidget {
  const TextFieldExperimentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparentMinimal(),
      body: Listener(
        onPointerDown: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: AppValues.screenHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('MASTER'),
              SizedBox(
                height: 12,
              ),
              MasterTextField(
                label: 'Label',
                errorText: 'Please fill the label',
              )
            ],
          ),
        ),
      ),
    );
  }
}
