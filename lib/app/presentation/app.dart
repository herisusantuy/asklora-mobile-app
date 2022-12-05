import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../core/domain/token/repository/token_repository.dart';
import '../../core/styles/asklora_colors.dart';
import '../../core/utils/route_generator.dart';
import '../../feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../feature/onboarding/welcome/carousel/presentation/carousel_screen.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  static final Map<int, Color> _colorCodes = {
    50: const Color.fromRGBO(35, 35, 1, .1),
    100: const Color.fromRGBO(35, 35, 1, .2),
    200: const Color.fromRGBO(35, 35, 1, .3),
    300: const Color.fromRGBO(35, 35, 1, .4),
    400: const Color.fromRGBO(35, 35, 1, .5),
    500: const Color.fromRGBO(35, 35, 1, .6),
    600: const Color.fromRGBO(35, 35, 1, .7),
    700: const Color.fromRGBO(35, 35, 1, .8),
    800: const Color.fromRGBO(35, 35, 1, .9),
    900: const Color.fromRGBO(35, 35, 1, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouterGenerator.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch:
                MaterialColor(AskLoraColors.charcoal.value, _colorCodes)),
        home: BlocProvider(
          create: (_) =>
              AppBloc(tokenRepository: TokenRepository())..add(AppLaunched()),
          child: BlocConsumer<AppBloc, AppState>(
            listener: (_, __) => FlutterNativeSplash.remove(),
            builder: (context, state) {
              switch (state.status) {
                case AppStatus.authenticated:
                  return const SignInSuccessScreen();
                case AppStatus.unauthenticated:
                  return const CarouselScreen();
                case AppStatus.unknown:
                  return const SizedBox();
              }
            },
          ),
        ));
  }
}
