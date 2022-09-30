import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/presentation/custom_loading_widget.dart';
import '../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../bloc/question/question_bloc.dart';
import '../bloc/response/user_response_bloc.dart';
import '../repository/question_answer_repository.dart';
import '../repository/question_collection_repository.dart';
import 'investment_style_question/investment_style_question_screen.dart';
import 'privacy_question/privacy_question_screen.dart';

class QuestionScreen extends StatelessWidget {
  static const String route = '/question_screen';
  final QuestionPageStep initialQuestionPage;

  const QuestionScreen(
      {Key? key, this.initialQuestionPage = QuestionPageStep.privacy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => UserResponseBloc(
                userResponseRepository: UserResponseRepository())),
        BlocProvider(
            create: (_) => QuestionBloc(
                questionCollectionRepository: QuestionCollectionRepository())
              ..add(const LoadQuestions())),
        BlocProvider(
            create: (_) =>
                NavigationBloc<QuestionPageStep>(initialQuestionPage)),
      ],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
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
    return BlocBuilder<QuestionBloc, QuestionState>(
        buildWhen: (previous, current) => previous.response != current.response,
        builder: (context, state) {
          if (state.response.state == ResponseState.success) {
            switch (navigationState.page) {
              case QuestionPageStep.privacy:
                return const PrivacyQuestionScreen();
              case QuestionPageStep.investmentStyle:
                return const InvestmentStyleQuestionScreen();
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
