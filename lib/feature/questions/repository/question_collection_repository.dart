import 'dart:convert';

import 'package:flutter/services.dart';

import '../domain/fixture.dart';
import '../domain/question.dart';

class QuestionCollectionRepository {
  static QuestionCollectionRepository? _instance;

  factory QuestionCollectionRepository() =>
      _instance ??= QuestionCollectionRepository._();

  QuestionCollectionRepository._();

  final Fixture fixture = Fixture();

  String jsonQuestion = 'a';

  Future<Fixture> fetchQuestions() async {
    final String response =
        await rootBundle.loadString('assets/json/question_list.json');

    Iterable iterable = json.decode(response);
    var data = List<QuestionCollection>.from(
        iterable.map((model) => QuestionCollection.fromJson(model)));

    return fixture.fixture(data);
  }

  Future<Fixture> getQuestions() async {
    return fixture;
  }
}
