part of 'question_bloc.dart';

class QuestionState extends Equatable {
  const QuestionState({
    this.response = const BaseResponse(),
    this.privacyQuestionIndex = 0,
    this.personalisationQuestionIndex = 0,
    this.investmentStyleQuestionIndex = 0,
    this.totalPages = 14,
    this.currentPages = 1,
  }) : super();

  final BaseResponse response;
  final int privacyQuestionIndex;
  final int personalisationQuestionIndex;
  final int investmentStyleQuestionIndex;
  final int totalPages;
  final int currentPages;

  QuestionState copyWith({
    BaseResponse? response,
    int? privacyQuestionIndex,
    int? personalisationQuestionIndex,
    int? investmentStyleQuestionIndex,
    int? totalPages,
    int? currentPages,
  }) {
    return QuestionState(
      response: response ?? this.response,
      privacyQuestionIndex: privacyQuestionIndex ?? this.privacyQuestionIndex,
      personalisationQuestionIndex:
          personalisationQuestionIndex ?? this.personalisationQuestionIndex,
      investmentStyleQuestionIndex:
          investmentStyleQuestionIndex ?? this.investmentStyleQuestionIndex,
      totalPages: totalPages ?? this.totalPages,
      currentPages: currentPages ?? this.currentPages,
    );
  }

  @override
  List<Object> get props => [
        privacyQuestionIndex,
        personalisationQuestionIndex,
        investmentStyleQuestionIndex,
        response,
        currentPages
      ];
}
