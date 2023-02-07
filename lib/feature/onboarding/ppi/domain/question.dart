import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/storage/shared_preference.dart';

part 'question.g.dart';

@JsonSerializable()
class QuestionCollection {
  @JsonKey(name: 'data')
  List<Question> questions;

  QuestionCollection(this.questions);

  factory QuestionCollection.fromJson(Map<String, dynamic> json) =>
      _$QuestionCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionCollectionToJson(this);
}

@JsonSerializable()
class Question {
  @JsonKey(name: 'answers')
  List<Choices>? choices;
  String? hints;
  String? question;
  String? section;
  @JsonKey(name: 'question_type')
  String? questionType;
  String? questionIndex;
  @JsonKey(name: 'question_id')
  String? questionId;
  int selectedOption;

  Question({
    this.choices,
    this.hints,
    this.question,
    this.section,
    this.questionType,
    this.questionIndex,
    this.questionId,
    this.selectedOption = -1,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  Future<bool> save() async {
    debugPrint('Krishna save question ${jsonEncode(toJson())}');
    return await SharedPreference()
        .writeData(questionId!, jsonEncode(toJson()));
  }

  Future<Question?> getCachedQuestion() async {
    var data = await SharedPreference().readData(questionId!);
    if (data == null) {
      return null;
    }
    debugPrint('Krishna getCachedQuestion ${jsonDecode(jsonEncode(data))}');
    return Future.value(Question.fromJson(jsonDecode(data)));
  }

  Question copyWith({
    List<Choices>? choices,
    String? hints,
    String? question,
    String? section,
    String? questionType,
    String? questionIndex,
    String? questionId,
    int? selectedOption,
  }) {
    return Question(
      choices: choices ?? this.choices,
      hints: hints ?? this.hints,
      question: question ?? this.question,
      section: section ?? this.section,
      questionType: questionType ?? this.questionType,
      questionIndex: questionIndex ?? this.questionIndex,
      questionId: questionId ?? this.questionId,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }

  @override
  String toString() {
    return 'Choices { hints: $hints, question: $question, section: $section, questionType: $questionType, selectedOption: $selectedOption }';
  }
}

class Choices {
  String? name;
  String? score;
  bool? selectable;

  Choices({this.name, this.score, this.selectable});

  Choices.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'].toString();
    selectable = json['selectable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['score'] = score;
    data['selectable'] = selectable;
    return data;
  }

  @override
  String toString() {
    return 'Choices { name: $name, score: $score }';
  }
}
