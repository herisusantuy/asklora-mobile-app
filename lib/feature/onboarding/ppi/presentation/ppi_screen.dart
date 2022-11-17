import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_loading_widget.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../bloc/question/question_bloc.dart';
import '../bloc/response/user_response_bloc.dart';
import '../repository/ppi_question_repository.dart';
import '../repository/ppi_response_repository.dart';
import 'personalisation_question/personalisation_question_screen.dart';
import 'ppi_result_screen.dart';
import 'privacy_question/privacy_question_screen.dart';

class PpiScreen extends StatelessWidget {
  static const String route = '/ppi_screen';
  final QuestionPageStep initialQuestionPage;

  const PpiScreen(
      {Key? key, this.initialQuestionPage = QuestionPageStep.privacy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => UserResponseBloc(
                ppiResponseRepository: PpiResponseRepository())),
        BlocProvider(
            create: (_) =>
                QuestionBloc(ppiQuestionRepository: PpiQuestionRepository())
                  ..add(const LoadQuestions())),
        BlocProvider(
            create: (_) =>
                NavigationBloc<QuestionPageStep>(initialQuestionPage)),
      ],
      child: Scaffold(
          body: BlocConsumer<NavigationBloc<QuestionPageStep>,
              NavigationState<QuestionPageStep>>(
        listenWhen: (_, current) => current.lastPage == true,
        listener: (context, state) {
          Navigator.pop(context);
        },
        builder: (context, state) => _pages(state),
      )),
    );
  }

  Widget _pages(NavigationState navigationState) {
    return BlocBuilder<QuestionBloc, QuestionState>(builder: (context, state) {
      if (state.response.state == ResponseState.success) {
        switch (navigationState.page) {
          case QuestionPageStep.privacy:
            return PrivacyQuestionScreen(
              initialIndex: state.privacyQuestionIndex,
            );
          case QuestionPageStep.privacyResultSuccess:
            return PpiResultScreen(
              mEmojiText:
                  'Thank you for your trust. Unfortunately my age is a secret...',
              ppiResultType: PpiResultType.success,
              additionalMessage: 'Let’s talk about your personality.',
              onPrimaryButtonTap: () => context
                  .read<NavigationBloc<QuestionPageStep>>()
                  .add(const PageChanged(QuestionPageStep.personalisation)),
            );
          case QuestionPageStep.privacyResultFailed:
            return PpiResultScreen(
              mEmojiText:
              'I’m sorry, but….(explain the reason why they failed. e.g. too young)',
              ppiResultType: PpiResultType.failed,
              additionalMessage: '-Reason-',
              onPrimaryButtonTap: ()=>Navigator.pop(context),
            );
          case QuestionPageStep.personalisation:
            return PersonalisationQuestionScreen(
              initialIndex: state.personalisationQuestionIndex,
            );
          case QuestionPageStep.personalisationResultEnd:
            return PpiResultScreen(
              mEmojiText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel nunc, egestas pulvinar sed ac semper porta.',
              ppiResultType: PpiResultType.end,
              additionalMessage: '(Screen that show some kind of a result to moviate user / user feel like they get a reward after answering the ques)',
              onPrimaryButtonTap: ()=>SignUpScreen.open(context),
            );
          default:
            return const SizedBox.shrink();
        }
      } else if (state.response.state == ResponseState.loading) {
        return const CustomLoadingWidget();
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
