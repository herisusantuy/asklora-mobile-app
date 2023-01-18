part of 'demonstration_question_bloc.dart';

class DemonstrationQuestionState extends Equatable {
  final int questionIndex;
  final List<bool> questionAnsweredList;
  final List<QuestionCollection> questionCollection;

  const DemonstrationQuestionState(
      {this.questionIndex = 0,
      this.questionAnsweredList = const [],
      this.questionCollection = const []})
      : super();

  DemonstrationQuestionState copyWith({
    int? questionIndex,
    List<bool>? questionAnsweredList,
    List<QuestionCollection>? questionCollection,
  }) {
    return DemonstrationQuestionState(
        questionIndex: questionIndex ?? this.questionIndex,
        questionCollection: questionCollection ?? this.questionCollection,
        questionAnsweredList:
            questionAnsweredList ?? this.questionAnsweredList);
  }

  @override
  List<Object> get props =>
      [questionIndex, questionAnsweredList, questionCollection];

  void onTapNext(BuildContext context) {
    if (questionIndex + 1 >= questionCollection.length) {
      context
          .read<NavigationBloc<LearningPageStep>>()
          .add(const PageChanged(LearningPageStep.botList));
    } else {
      context.read<DemonstrationQuestionBloc>().add(NextQuestion());
    }
  }

  void onTapBack(BuildContext context) {
    if (questionIndex - 1 < 0) {
      context.read<NavigationBloc<LearningPageStep>>().add(const PagePop());
    } else {
      context.read<DemonstrationQuestionBloc>().add(PreviousQuestion());
    }
  }
}
