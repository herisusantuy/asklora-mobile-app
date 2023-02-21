import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/repository/user_journey_repository.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../tabs/tabs_screen.dart';
import '../../sign_in/bloc/sign_in_bloc.dart';
import '../../sign_in/repository/sign_in_repository.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../bloc/otp_bloc.dart';
import '../repository/otp_repository.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  static const String route = '/otp';

  final String email;
  final String password;

  const OtpScreen({required this.email, required this.password, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: AskLoraColors.text,
          elevation: 0,
        ),
        body: SafeArea(
            child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OtpBloc(otpRepository: OtpRepository())
                ..add(SmsOtpRequested(email)),
            ),
            BlocProvider(
              create: (context) => SignInBloc(
                  signInRepository: SignInRepository(TokenRepository()),
                  userJourneyRepository: UserJourneyRepository()),
            ),
          ],
          child:
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
            return MultiBlocListener(
              listeners: [
                BlocListener<OtpBloc, OtpState>(
                    listenWhen: (previous, current) =>
                        previous.response.state != current.response.state,
                    listener: ((context, state) {
                      switch (state.response.state) {
                        case ResponseState.error:
                          CustomInAppNotification.show(
                              context, state.response.message);
                          break;
                        case ResponseState.success:
                          CustomInAppNotification.show(
                              context, state.response.message);
                          break;
                        case ResponseState.unknown:
                          CustomInAppNotification.show(
                              context, state.response.message);
                          break;
                        default:
                          break;
                      }
                    })),
                BlocListener<SignInBloc, SignInState>(
                    listenWhen: (previous, current) =>
                        previous.response.state != current.response.state,
                    listener: ((context, state) {
                      switch (state.response.state) {
                        case ResponseState.error:
                          CustomInAppNotification.show(
                              context, state.response.message);
                          break;
                        case ResponseState.success:
                          TabsScreen.openAndRemoveAllRoute(context);
                          break;
                        default:
                          break;
                      }
                    }))
              ],
              child: OtpForm(
                onOtpResend: () =>
                    context.read<OtpBloc>().add(SmsOtpRequested(email)),
                onOtpSubmit: (otp) => {
                  context
                      .read<SignInBloc>()
                      .add(SignInWithOtpSubmitted(otp, email, password))
                },
              ),
            );
          }),
        )));
  }

  static void openReplace(
          BuildContext context, Pair<String, String> arguments) =>
      Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}
