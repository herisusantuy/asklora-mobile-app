import 'question.dart';

enum QuestionSection {
  privacy('privacy'),
  openness('openness'),
  conscientiousness('conscientiousness'),
  neuroticism('neuroticism'),
  investmentStyle('investment_style');
  // feedBack('feedback');

  final String value;

  const QuestionSection(this.value);
}

enum QuestionType {
  choices('choices'),
  slider('slider'),
  descriptive('descriptive'),
  omniSearch('omnisearch'),
  unique('unique');
  // feedBack('feedback');

  final String value;

  const QuestionType(this.value);
}

class Fixture {
  static Fixture? _instance;

  factory Fixture() => _instance ??= Fixture._();

  Fixture._();

  List<Question> privacyQuestions = [];
  List<Question> personalisedQuestion = [];
  List<Question> investmentStyleQuestion = [];

  // List<QuestionCollection> feedBackQuestion = [];

  // List<QuestionCollection> get getFeedBackQuestions {
  //   return feedBackQuestion;
  // }
  //
  // set setFeedBackQuestions(QuestionCollection questionCollection) {
  //   feedBackQuestion.add(questionCollection);
  // }

  List<Question> get getPrivacyQuestions {
    return privacyQuestions;
  }

  set setPrivacyQuestions(Question question) {
    privacyQuestions.add(question);
  }

  List<Question> get getPersonalisedQuestion {
    return personalisedQuestion;
  }

  set setPersonalisedQuestion(Question question) {
    personalisedQuestion.add(question);
  }

  List<Question> get getInvestmentStyleQuestion {
    return investmentStyleQuestion;
  }

  set setInvestmentStyleQuestion(Question question) {
    investmentStyleQuestion.add(question);
  }

  void clearQuestion() {
    investmentStyleQuestion.clear();
    personalisedQuestion.clear();
    privacyQuestions.clear();
    // feedBackQuestion.clear();
  }

  Fixture fix(List<Question> questionCollection) {
    clearQuestion();
    for (var element in questionCollection) {
      if (element.section == QuestionSection.privacy.value) {
        setPrivacyQuestions = element;
      }
      if (element.section == QuestionSection.openness.value ||
          element.section == QuestionSection.conscientiousness.value ||
          element.section == QuestionSection.neuroticism.value) {
        setPersonalisedQuestion = element;
      }
      if (element.section == QuestionSection.investmentStyle.value) {
        setInvestmentStyleQuestion = element;
      }
      // if (element.section == QuestionSection.feedBack.value) {
      //   setFeedBackQuestions = element;
      // }
    }
    return this;
  }

  int indexOfPrivacyQuestionsByUid(String uid) =>
      privacyQuestions.indexWhere((question) => question.questionId == uid);

  int indexOfPersonalisedQuestionsByUid(String uid) =>
      personalisedQuestion.indexWhere((question) => question.questionId == uid);

  int indexOfInvestmentStyleQuestionByUid(String uid) => investmentStyleQuestion
      .indexWhere((question) => question.questionId == uid);
}
