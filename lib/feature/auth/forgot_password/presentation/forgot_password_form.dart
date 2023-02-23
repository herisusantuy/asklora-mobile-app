import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../core/utils/extensions.dart';
import '../bloc/forgot_password_bloc.dart';
import 'forgot_password_success_screen.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          previous.response.state != current.response.state,
      listener: (context, state) {
        switch (state.response.state) {
          case ResponseState.loading:
            CustomLoadingOverlay.show(context);
            break;
          case ResponseState.success:
            CustomLoadingOverlay.dismiss();
            CustomInAppNotification.show(context, state.response.data.detail);
            ForgotPasswordSuccessScreen.open(context);
            break;
          case ResponseState.error:
            context
                .read<ForgotPasswordBloc>()
                .add(ForgotPasswordEmailChanged(state.email));
            CustomLoadingOverlay.dismiss();
            CustomSnackBar(context)
                .setMessage(state.response.message)
                .showError();
            break;
          default:
            break;
        }
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      _padding(),
                      const CustomTextNew(
                        'Please enter your email. Instructions will be sent to reset your password.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      _emailInput(),
                    ],
                  ),
                  Column(
                    children: [
                      const CustomTextNew(
                        'Can’t remember your email address?\nEmail us at cs@asklora.ai',
                        textAlign: TextAlign.center,
                      ),
                      _padding(),
                      _forgotPasswordButton(),
                      context.padding(topPadding: 20),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _emailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: ((previous, current) => previous.email != current.email),
          builder: (context, state) {
            return MasterTextField(
                key: const Key('forgot_password_email_input'),
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                maxLine: 1,
                labelText: 'Email',
                hintText: 'Email',
                errorText: state.emailErrorText,
                onChanged: (email) => context
                    .read<ForgotPasswordBloc>()
                    .add(ForgotPasswordEmailChanged(email)));
          }),
    );
  }

  Widget _forgotPasswordButton() =>
      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return PrimaryButton(
              key: const Key('forgot_password_submit_button'),
              label: 'SUBMIT',
              disabled: !state.isEmailValid,
              onTap: () => context
                  .read<ForgotPasswordBloc>()
                  .add(const ForgotPasswordSubmitted()));
        },
      );

  Padding _padding() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
      );
}
