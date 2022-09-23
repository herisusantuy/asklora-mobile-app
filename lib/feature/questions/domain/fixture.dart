

import 'question.dart';

enum QuestionSection {
  privacy('privacy'),
  openness('openness'),
  conscientiousness('conscientiousness'),
  neuroticism('neuroticism'),
  investmentStyle('investment_style'),
  feedBack('feedback');


  final String value;

  const QuestionSection(this.value);
}

enum QuestionType {
  choices('choices'),
  slider('slider'),
  descriptive('descriptive'),
  feedBack('feedback');

  final String value;

  const QuestionType(this.value);
}

class Fixture {
  static Fixture? _instance;

  factory Fixture() => _instance ??= Fixture._();

  Fixture._();

  List<QuestionCollection> privacyQuestions = [];
  List<QuestionCollection> personalisedQuestion = [];
  List<QuestionCollection> investmentStyleQuestion = [];
  List<QuestionCollection> feedBackQuestion = [];

  List<QuestionCollection> get getFeedBackQuestions {
    return feedBackQuestion;
  }

  set setFeedBackQuestions(QuestionCollection questionCollection) {
    feedBackQuestion.add(questionCollection);
  }

  List<QuestionCollection> get getPrivacyQuestions {
    return privacyQuestions;
  }

  set setPrivacyQuestions(QuestionCollection questionCollection) {
    privacyQuestions.add(questionCollection);
  }

  List<QuestionCollection> get getPersonalisedQuestion {
    return personalisedQuestion;
  }

  set setPersonalisedQuestion(QuestionCollection questionCollection) {
    personalisedQuestion.add(questionCollection);
  }

  List<QuestionCollection> get getInvestmentStyleQuestion {
    return investmentStyleQuestion;
  }

  set setInvestmentStyleQuestion(QuestionCollection questionCollection) {
    investmentStyleQuestion.add(questionCollection);
  }

  Fixture fixture(List<QuestionCollection> questionCollection) {
    for (var element in questionCollection) {
      if (element.questions!.section == QuestionSection.privacy.value) {
        setPrivacyQuestions = element;
      }
      if (element.questions!.section == QuestionSection.openness.value ||
          element.questions!.section ==
              QuestionSection.conscientiousness.value ||
          element.questions!.section == QuestionSection.neuroticism.value) {
        setPersonalisedQuestion = element;
      }
      if (element.questions!.section == QuestionSection.investmentStyle.value) {
        setInvestmentStyleQuestion = element;
      }
      if(element.questions!.section == QuestionSection.feedBack.value){
        setFeedBackQuestions = element;
      }
    }
    return this;
  }

  int indexOfPrivacyQuestionsByUid(String uid) =>
      privacyQuestions.indexWhere((question) => question.uid == uid);

  int indexOfPersonalisedQuestionsByUid(String uid) =>
      personalisedQuestion.indexWhere((question) => question.uid == uid);

  int indexOfInvestmentStyleQuestionByUid(String uid) =>
      investmentStyleQuestion.indexWhere((question) => question.uid == uid);
}
