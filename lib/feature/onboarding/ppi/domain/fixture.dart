import 'package:flutter/material.dart';

import 'question.dart';

enum QuestionSection {
  privacy('privacy'),
  openness('openness'),
  conscientiousness('conscientiousness'),
  neuroticism('neuroticism'),
  investmentStyle('investment_style'),
  omniSearch('omnisearch'),
  extrovert('extrovert');

  final String value;

  const QuestionSection(this.value);
}

enum QuestionType {
  choices('choices'),
  slider('slider'),
  descriptive('descriptive'),
  omniSearch('omnisearch'),
  unique('unique');

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
  }

  Fixture fix(List<Question> questionCollection) {
    clearQuestion();
    for (var element in questionCollection) {
      if (element.section == QuestionSection.privacy.value) {
        setPrivacyQuestions = element;
      }
      if (element.section == QuestionSection.openness.value ||
          element.section == QuestionSection.conscientiousness.value ||
          element.section == QuestionSection.neuroticism.value ||
          element.section == QuestionSection.extrovert.value) {
        setPersonalisedQuestion = element;
      }
      if (element.section == QuestionSection.investmentStyle.value) {
        setInvestmentStyleQuestion = element;
      }
      if (element.section == QuestionSection.omniSearch.value) {
        element
          ..questionType = QuestionType.omniSearch.value
          ..section = QuestionSection.investmentStyle.value;
        setInvestmentStyleQuestion = element;
      }
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
