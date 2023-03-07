part of '../for_you_investment_style_screen.dart';

class ForYouOthersQuestionScreen extends StatelessWidget {
  final List<Question> questions;
  final bool isFirstQuestion;

  const ForYouOthersQuestionScreen(
      {required this.questions, this.isFirstQuestion = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserResponseBloc, UserResponseState>(
        buildWhen: (previous, current) =>
            previous.ppiResponseState != current.ppiResponseState ||
            previous.responseState != current.responseState,
        builder: (context, state) {
          return CustomLayoutWithBlurPopUp(
            title: 'No Botstock recommendations',
            subTitle:
                'Oops! Looks like there aren’t enough recommendations that meet your current investment profile - Let’s go through your Investment Style again to find suitable recommendations.',
            buttonLabel: 'RETAKE INVESTMENT STYLE',
            showReloadPopUp:
                state.ppiResponseState == PpiResponseState.dispatchResponse &&
                    state.responseState == ResponseState.error,
            content: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomStretchedLayout(
                contentPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                content: Column(
                  children: [
                    const QuestionTitle(
                      question: 'Get in your investment zone',
                      paddingBottom: 24,
                    ),
                    const LoraRoundedCornerBanner(
                      text:
                          'Find Botstocks that fit you the best by letting me know your Investment Style.',
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    ...questions
                        .map((e) => _questionDropdown(context, e))
                        .toList()
                  ],
                ),
                bottomButton: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: BlocBuilder<UserResponseBloc, UserResponseState>(
                    buildWhen: (previous, current) =>
                        previous.ppiResponseState != current.ppiResponseState,
                    builder: (context, state) {
                      return isFirstQuestion
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: PrimaryButton(
                                  disabled: _disableButton(context),
                                  label: 'VIEW BOTSTOCK RECOMMENDATION',
                                  onTap: () => context
                                      .read<UserResponseBloc>()
                                      .add(SendBulkResponse())),
                            )
                          : ButtonPair(
                              primaryButtonOnClick: () => context
                                  .read<UserResponseBloc>()
                                  .add(SendBulkResponse()),
                              secondaryButtonOnClick: () => context
                                  .read<
                                      NavigationBloc<
                                          InvestmentStyleQuestionType>>()
                                  .add(const PagePop()),
                              disablePrimaryButton: _disableButton(context),
                              primaryButtonLabel:
                                  'VIEW BOTSTOCK RECOMMENDATION',
                              secondaryButtonLabel: 'BACK');
                    },
                  ),
                ),
              ),
            ),
            onTapReload: () {
              context.read<UserResponseBloc>().add(const ResetState());
              if (context
                      .read<ForYouQuestionBloc>()
                      .state
                      .response
                      .data!
                      .left !=
                  null) {
                context.read<NavigationBloc<InvestmentStyleQuestionType>>().add(
                    const PageChanged(InvestmentStyleQuestionType.omnisearch));
              }
            },
          );
        });
  }

  Widget _questionDropdown(BuildContext context, Question question) =>
      Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              question.question ?? '',
              style: AskLoraTextStyles.subtitle2,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomDropdown(
                initialValue: _getInitialValue(context, question),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
                itemsList: question.choices!.map((e) => e.name ?? '').toList(),
                onChanged: (value) {
                  context.read<UserResponseBloc>().add(SaveUserResponse(
                      question,
                      question.choices!
                          .firstWhere((element) => element.name == value)
                          .id
                          .toString()));
                })
          ],
        ),
      );

  String _getInitialValue(BuildContext context, Question question) {
    Choices? choices = question.choices!.firstWhereOrNull((element) =>
        element.id == PpiDefaultAnswer.getIndex(context, question.questionId!));
    return choices?.name ?? '';
  }

  bool _disableButton(BuildContext context) {
    bool disableButton = false;
    for (var element in questions) {
      if (_getInitialValue(context, element).isEmpty) {
        disableButton = true;
        break;
      }
    }
    return disableButton;
  }
}
