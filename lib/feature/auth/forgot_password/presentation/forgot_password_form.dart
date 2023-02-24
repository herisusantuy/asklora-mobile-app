import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/text_fields/master_text_field.dart';
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
        ResponseState responseState = state.response.state;
        if (responseState == ResponseState.loading) {
          CustomLoadingOverlay.show(context);
        } else {
          CustomLoadingOverlay.dismiss();
          CustomInAppNotification.show(context, state.response.message);
          if (responseState == ResponseState.success) {
            ForgotPasswordSuccessScreen.open(context);
          } else if (responseState == ResponseState.error) {
            context
                .read<ForgotPasswordBloc>()
                .add(ForgotPasswordEmailChanged(state.email));
          }
        }
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextNew(
                  'Please enter your email. Instructions will be sent to reset your password.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                _emailInput(),
              ],
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
}
