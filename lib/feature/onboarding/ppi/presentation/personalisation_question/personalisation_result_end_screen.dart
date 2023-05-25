import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../../bloc/response/user_response_bloc.dart';
import '../../domain/ppi_user_response.dart';
import '../ppi_result_screen.dart';

class PersonalisationResultEndScreen extends StatelessWidget {
  const PersonalisationResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<UserResponseBloc, UserResponseState>(
          listener: (context, state) {
        CustomLoadingOverlay.of(context).show(state.responseState);
        switch (state.responseState) {
          case ResponseState.success:
            break;
          case ResponseState.error:
            context
                .read<QuestionBloc>()
                .add(const CurrentPersonalisationPageDecremented());
            context
                .read<NavigationBloc<QuestionPageStep>>()
                .add(const PagePop());
            break;
          default:
        }
      }, builder: (context, state) {
        if (state.ppiResponseState == PpiResponseState.finishAddResponse) {
          context.read<UserResponseBloc>().add(SendBulkResponse());
        }

        if (state.responseState == ResponseState.success &&
            state.ppiResponseState == PpiResponseState.dispatchResponse) {
          final scores = state.snapShot?.data?.scores;

          return PpiResultScreen(
            loraMemojiType: LoraMemojiType.lora7,
            ppiResult: PpiResult.success,
            memojiText: 'Do you know?',
            additionalMessage: _getMessage(scores),
            bottomButton: PrimaryButton(
                key: const Key('next_button'),
                label: 'GOT IT',
                onTap: () => SignUpScreen.open(context)),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }

  String _getMessage(Scores? scores) {
    const high = 9;
    String message = '';
    if (scores == null) {
      return message;
    }
    if (scores.openness >= high && scores.neuroticism >= high) {
      message =
          'You are pretty open-minded to new things!\nLet’s be a little bit aggressive!';
    } else if (scores.openness >= high && scores.neuroticism < high) {
      message =
          'You are one of those people who’s down for trying anything new!\nLet’s be more aggressive!';
    } else if (scores.openness < high && scores.neuroticism >= high) {
      message =
          'You prefer a stable and safe journey!\nLet’s aim to make small wins in a steady manner!';
    } else if (scores.openness < high && scores.neuroticism < high) {
      message =
          'You prefer a stable and safe journey!\nLet’s try a more balanced strategy!';
    }
    return message;
  }
}
