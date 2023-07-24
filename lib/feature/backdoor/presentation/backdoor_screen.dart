import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/custom_scaffold.dart';
import '../bloc/backdoor_screen_bloc.dart';
import '../domain/backdoor_repository.dart';

class BackdoorScreen extends StatelessWidget {
  static const String route = '/backdoor_screen';

  const BackdoorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: BlocProvider(
          create: (context) => BackdoorScreenBloc(BackdoorRepository()),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(children: [
                  TextFormField(
                    onChanged: (str) {
                      context
                          .read<BackdoorScreenBloc>()
                          .add(OnBaseUrlChanged(str));
                    },
                    onFieldSubmitted: (str) {
                      context
                          .read<BackdoorScreenBloc>()
                          .add(OnBaseUrlChanged(str));
                    },
                  )
                ]),
              );
            },
          ),
        ),
        enableBackNavigation: true);
  }

  static open(BuildContext context) {
    Navigator.pushNamed(context, route);
  }
}
