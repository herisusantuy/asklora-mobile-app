import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class CustomScaffold extends Scaffold {
  CustomScaffold({super.key, super.body})
      : super(extendBodyBehindAppBar: true, appBar: CustomAppBar());
}
