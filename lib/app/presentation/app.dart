import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../core/domain/token/repository/token_repository.dart';
import '../../core/utils/route_generator.dart';
import '../../feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../feature/onboarding/kyc/presentation/kyc_screen.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
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
                  return const KycScreen();
                case AppStatus.unknown:
                  return const SizedBox();
              }
            },
          ),
        ));
  }
}
