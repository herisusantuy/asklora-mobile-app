import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_up_bloc.dart';
import '../repository/sign_up_repository.dart';
import 'sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = '/sign_up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign-up')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocProvider(
          create: (context) {
            return SignUpBloc(
              signUpRepository: SignUpRepository(),
            );
          },
          child: const SignUpForm(),
        ),
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
