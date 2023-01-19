import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/values/app_values.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/investment_style_welcome_screen.dart';
import '../../sign_up/repository/sign_up_repository.dart';
import '../email_activation_bloc.dart';

class EmailActivationScreen extends StatelessWidget {
  static const route = '/email_activation_screen';

  const EmailActivationScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return EmailActivationBloc(SignUpRepository(), TokenRepository());
        },
        child: BlocConsumer<EmailActivationBloc, EmailActivationState>(
            listener: (context, state) {
          if (state.response.state == ResponseState.loading) {
            CustomLoadingOverlay.show(context);
          } else {
            CustomLoadingOverlay.dismiss();
          }
          if (state.deeplinkStatus == DeeplinkStatus.success) {
            InvestmentStyleWelcomeScreen.open(context);
          }
          switch (state.response.state) {
            case ResponseState.error:
              CustomInAppNotification.show(context, state.response.message);
              break;
            case ResponseState.success:
              CustomInAppNotification.show(context, state.response.message);
              break;
            default:
              break;
          }
        }, builder: (context, state) {
          final headerWidget = state.deeplinkStatus == DeeplinkStatus.failed
              ? const LoraMemojiHeader(
                  text:
                      'Sorry! Your request has been timed out. Let’s try and activate your account again.',
                  loraMemojiType: LoraMemojiType.lora6)
              : const LoraMemojiHeader(
                  text: 'Check your email and activate your account.');
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return CustomScaffold(
                enableBackNavigation: false,
                body: Padding(
                  padding: AppValues.screenHorizontalPadding,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            headerWidget,
                            ButtonPair(
                                primaryButtonOnClick: () => context
                                    .read<EmailActivationBloc>()
                                    .add(ResendEmailActivationLink(userName)),
                                secondaryButtonOnClick: () =>
                                    Navigator.pop(context),
                                primaryButtonLabel: 'RESEND ACTIVATION LINK',
                                secondaryButtonLabel: 'SIGN UP AGAIN')
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          );
        }));
  }

  static void open(BuildContext context, String userName) =>
      Navigator.of(context).pushNamed(route, arguments: userName);
}
