part of 'question_bloc.dart';

class QuestionState extends Equatable {
  const QuestionState({
    this.response = const BaseResponse(),
    this.privacyQuestionIndex = 0,
    this.personalisationQuestionIndex = 0,
    this.investmentStyleQuestionIndex = 0,
    this.totalPrivacyPages = 0,
    this.totalPersonalisationPages = 0,
    this.totalInvestmentStylePages = 0,
    this.currentPrivacyPages = 0,
    this.currentPersonalisationPages = 0,
    this.currentInvestmentStylePages = 0,
  }) : super();

  final BaseResponse response;
  final int privacyQuestionIndex;
  final int personalisationQuestionIndex;
  final int investmentStyleQuestionIndex;
  final int totalPrivacyPages;
  final int totalPersonalisationPages;
  final int totalInvestmentStylePages;
  final int currentPrivacyPages;
  final int currentPersonalisationPages;
  final int currentInvestmentStylePages;

  QuestionState copyWith({
    BaseResponse? response,
    int? privacyQuestionIndex,
    int? personalisationQuestionIndex,
    int? investmentStyleQuestionIndex,
    int? totalPrivacyPages,
    int? totalPersonalisationPages,
    int? totalInvestmentStylePages,
    int? currentPrivacyPages,
    int? currentPersonalisationPages,
    int? currentInvestmentStylePages,
  }) {
    return QuestionState(
      response: response ?? this.response,
      privacyQuestionIndex: privacyQuestionIndex ?? this.privacyQuestionIndex,
      personalisationQuestionIndex:
          personalisationQuestionIndex ?? this.personalisationQuestionIndex,
      investmentStyleQuestionIndex:
          investmentStyleQuestionIndex ?? this.investmentStyleQuestionIndex,
      totalPrivacyPages: totalPrivacyPages ?? this.totalPrivacyPages,
      totalPersonalisationPages:
          totalPersonalisationPages ?? this.totalPersonalisationPages,
      totalInvestmentStylePages:
          totalInvestmentStylePages ?? this.totalInvestmentStylePages,
      currentPrivacyPages: currentPrivacyPages ?? this.currentPrivacyPages,
      currentPersonalisationPages:
          currentPersonalisationPages ?? this.currentPersonalisationPages,
      currentInvestmentStylePages:
          currentInvestmentStylePages ?? this.currentInvestmentStylePages,
    );
  }

  @override
  List<Object> get props => [
        privacyQuestionIndex,
        personalisationQuestionIndex,
        investmentStyleQuestionIndex,
        response,
        currentPrivacyPages,
        currentPersonalisationPages,
        currentInvestmentStylePages,
        totalPrivacyPages,
        totalPersonalisationPages,
        totalInvestmentStylePages,
      ];
}
