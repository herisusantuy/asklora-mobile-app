import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/utils/build_configs/app_config_widget.dart';
import 'core/utils/shared_prefs.dart';
import 'home_screen.dart';

const int _durationInMillis = 700;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SharedPrefs().init();

  runApp(AppConfigWidget(child: const HomeScreen()));

  Future.delayed(const Duration(milliseconds: _durationInMillis), () {
    FlutterNativeSplash.remove();
  });
}
