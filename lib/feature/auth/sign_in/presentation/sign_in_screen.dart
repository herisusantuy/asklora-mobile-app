import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/token/repository/token_repository.dart';
import '../bloc/sign_in_bloc.dart';
import '../repository/sign_in_repository.dart';
import 'sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocProvider(
          create: (context) => SignInBloc(
            signInRepository: SignInRepository(
              TokenRepository(),
            ),
          ),
          child: const SignInForm(),
        ),
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
