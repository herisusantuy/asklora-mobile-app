import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../core/utils/route_generator.dart';
import '../../core/utils/token_validator.dart';
import '../../feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../home_screen.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  static const String route = '/app';

  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouterGenerator.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: App.route,
        home: BlocProvider(
          create: (_) => AppBloc(
            tokenValidator: TokenValidator(),
          )..add(AppLaunched()),
          child: BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              switch (state.status) {
                case AppStatus.authenticated:
                  SignInSuccessScreen.openAndRemoveAllRoute(context);
                  break;
                case AppStatus.unauthenticated:
                case AppStatus.unknown:
                default:
                  HomeScreen.openReplace(context);
                  break;
              }
              FlutterNativeSplash.remove();
            },
            child: Container(),
          ),
        ));
  }
}
