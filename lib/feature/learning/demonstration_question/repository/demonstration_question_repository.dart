import 'dart:convert';

import 'package:flutter/services.dart';
import '../../../onboarding/ppi/domain/question.dart';

class DemonstrationQuestionRepository {
  Future<List<Question>> fetchQuestions() async {
    final String response = await rootBundle
        .loadString('assets/json/demonstration_question_list.json');

    // Iterable iterable = json.decode(response);

    List<Question> questions = List.empty(growable: true);

    questions = (jsonDecode(response) as List)
        .map((i) => Question.fromJson(i))
        .toList();

    // return List<Question>.from(
    //     iterable.map((model) => QuestionCollection.fromJson(model)));

    return questions;
  }
}
