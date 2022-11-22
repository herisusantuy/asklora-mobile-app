import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/custom_loading_widget.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../bloc/question/question_bloc.dart';
import '../bloc/response/user_response_bloc.dart';
import '../repository/ppi_question_repository.dart';
import '../repository/ppi_response_repository.dart';
import 'investment_style_question/investment_style_question_screen.dart';
import 'investment_style_question/investment_style_result_end_screen.dart';
import 'investment_style_question/investment_style_welcome_screen.dart';
import 'personalisation_question/personalisation_question_screen.dart';
import 'personalisation_question/personalisation_result_end_screen.dart';
import 'privacy_question/privacy_question_screen.dart';
import 'privacy_question/privacy_result_failed_screen.dart';
import 'privacy_question/privacy_result_success_screen.dart';

class PpiScreen extends StatelessWidget {
  static const String route = '/ppi_screen';
  final QuestionPageStep initialQuestionPage;
  final QuestionPageType questionPageType;

  const PpiScreen(
      {Key? key,
      required this.questionPageType,
      required this.initialQuestionPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => UserResponseBloc(
                ppiResponseRepository: PpiResponseRepository())),
        BlocProvider(
            create: (_) => QuestionBloc(
                ppiQuestionRepository: PpiQuestionRepository(),
                questionPageType: questionPageType)
              ..add(const LoadQuestions())),
        BlocProvider(
            create: (_) =>
                NavigationBloc<QuestionPageStep>(initialQuestionPage)),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          body: BlocConsumer<NavigationBloc<QuestionPageStep>,
              NavigationState<QuestionPageStep>>(
            listenWhen: (_, current) => current.lastPage == true,
            listener: (context, state) {
              Navigator.pop(context);
            },
            builder: (context, state) => Column(
              children: [
                _progressIndicator(),
                Expanded(child: _pages(state)),
              ],
            ),
          )),
    );
  }

  Widget _progressIndicator() {
    return BlocBuilder<QuestionBloc, QuestionState>(
        buildWhen: (previous, current) =>
            previous.currentPages != current.currentPages ||
            previous.totalPages != current.totalPages,
        builder: (context, state) => LinearProgressIndicator(
              backgroundColor: Colors.grey[350],
              value: state.currentPages / state.totalPages,
              color: Colors.grey[700],
            ));
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
            return const PrivacyResultSuccessScreen();
          case QuestionPageStep.privacyResultFailed:
            return const PrivacyResultFailedScreen();
          case QuestionPageStep.personalisation:
            return PersonalisationQuestionScreen(
              initialIndex: state.personalisationQuestionIndex,
            );
          case QuestionPageStep.personalisationResultEnd:
            return const PersonalisationResultEndScreen();
          case QuestionPageStep.investmentStyleWelcome:
            return const InvestmentStyleWelcomeScreen();
          case QuestionPageStep.investmentStyle:
            return const InvestmentStyleQuestionScreen();
          case QuestionPageStep.investmentStyleResultEnd:
            return const InvestmentStyleResultEndScreen();
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

  static void open(BuildContext context,
          {required Pair<QuestionPageType, QuestionPageStep> arguments}) =>
      Navigator.pushNamed(context, route, arguments: arguments);
}
