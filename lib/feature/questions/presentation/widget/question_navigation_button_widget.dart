import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../bloc/response/user_response_bloc.dart';

class QuestionNavigationButtonWidget extends StatelessWidget {
  final Function() onNext;
  final Function() onCancel;
  final Function onSubmitSuccess;
  final bool disable;

  const QuestionNavigationButtonWidget(
      {required this.onSubmitSuccess,
      required this.onNext,
      required this.onCancel,
      this.disable = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserResponseBloc, UserResponseState>(
        listenWhen: (previous, current) =>
            previous.responseState != current.responseState,
        listener: (context, state) {
          if (state.responseState == ResponseState.success) {
            onSubmitSuccess();
          } else if (state.responseState == ResponseState.error) {
            //TODO change error handling whenever endpoint is available
            onSubmitSuccess();
          }
        },
        buildWhen: (previous, current) =>
            previous.responseState != current.responseState,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomTextButton(
                  key: const Key('question_next_button'),
                  disable: disable,
                  isLoading: state.responseState == ResponseState.loading,
                  buttonText: 'Next',
                  onClick: onNext,
                  borderRadius: 6,
                  primaryColor: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                    key: const Key('question_cancel_button'),
                    onTap: onCancel,
                    child: const CustomText(
                      'Cancel',
                      type: FontType.smallText,
                    )),
              ],
            ),
          );
        });
  }
}
