import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../domain/fixture.dart';
import '../domain/question.dart';

class PpiQuestionRepository {
  static PpiQuestionRepository? _instance;

  factory PpiQuestionRepository() => _instance ??= PpiQuestionRepository._();

  PpiQuestionRepository._();

  final Fixture fixture = Fixture();

  Future<Fixture> fetchQuestions() async {
    final String response =
        await rootBundle.loadString('assets/json/question_list.json');

    List<Question> questions = List.empty(growable: true);

    questions = (jsonDecode(response) as List)
        .map((i) => Question.fromJson(i))
        .toList();
    return fixture.fix(questions);
  }

  Future<Fixture> getQuestions() async {
    return fixture;
  }
}
