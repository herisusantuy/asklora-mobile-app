import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../app/repository/user_journey_repository.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../onboarding/kyc/repository/account_repository.dart';
import '../../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../../../tabs/presentation/tab_screen.dart';
import '../../repository/auth_repository.dart';
import '../../sign_in/bloc/sign_in_bloc.dart';
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
    return CustomScaffold(
        body: SafeArea(
            child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OtpBloc(otpRepository: OtpRepository())
                ..add(SmsOtpRequested(email)),
            ),
            BlocProvider(
              create: (context) => SignInBloc(
                  authRepository: AuthRepository(TokenRepository()),
                  userJourneyRepository: UserJourneyRepository(),
                  accountRepository: AccountRepository(),
                  sharedPreference: SharedPreference(),
                  ppiResponseRepository: PpiResponseRepository()),
            ),
          ],
          child:
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
            return MultiBlocListener(
              listeners: [
                BlocListener<OtpBloc, OtpState>(
                    listenWhen: (previous, current) =>
                        previous.response.state != current.response.state,
                    listener: ((context, state) =>
                        CustomLoadingOverlay.of(context)
                            .show(state.response.state))),
                BlocListener<SignInBloc, SignInState>(
                    listenWhen: (previous, current) =>
                        previous.response.state != current.response.state,
                    listener: ((context, state) {
                      CustomLoadingOverlay.of(context)
                          .show(state.response.state);

                      switch (state.response.state) {
                        case ResponseState.error:
                          CustomInAppNotification.show(
                              context, state.response.message);
                          break;
                        case ResponseState.success:
                          context
                              .read<AppBloc>()
                              .add(const GetUserJourneyFromLocal());
                          TabScreen.openAndRemoveAllRoute(context);
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
                      .add(SignInWithOtp(otp, email, password))
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
