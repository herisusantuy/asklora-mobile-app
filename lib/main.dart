import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/presentation/app.dart';
import 'core/utils/build_configs/app_config_widget.dart';
import 'core/utils/token_validator.dart';

main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(AppConfigWidget(
      child: App(
    tokenValidator: TokenValidator(),
  )));
}
