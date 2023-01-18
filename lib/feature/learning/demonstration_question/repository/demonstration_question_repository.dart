import 'dart:convert';

import 'package:flutter/services.dart';
import '../../../onboarding/ppi/domain/question.dart';

class DemonstrationQuestionRepository {
  Future<List<QuestionCollection>> fetchQuestions() async {
    final String response = await rootBundle
        .loadString('assets/json/demonstration_question_list.json');

    Iterable iterable = json.decode(response);
    return List<QuestionCollection>.from(
        iterable.map((model) => QuestionCollection.fromJson(model)));
  }
}
