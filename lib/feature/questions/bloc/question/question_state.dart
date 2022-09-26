part of 'question_bloc.dart';

class QuestionState extends Equatable {
  const QuestionState({
    this.response = const BaseResponse(),
    this.privacyQuestionIndex = 0,
    this.investmentStyleQuestionIndex = 0,
  }) : super();

  final BaseResponse response;
  final int privacyQuestionIndex;
  final int investmentStyleQuestionIndex;

  QuestionState copyWith(
      {BaseResponse? response,
      int? privacyQuestionIndex,
      int? investmentStyleQuestionIndex}) {
    return QuestionState(
        response: response ?? this.response,
        privacyQuestionIndex: privacyQuestionIndex ?? this.privacyQuestionIndex,
        investmentStyleQuestionIndex:
            investmentStyleQuestionIndex ?? this.investmentStyleQuestionIndex);
  }

  @override
  List<Object> get props =>
      [privacyQuestionIndex, investmentStyleQuestionIndex, response];
}
