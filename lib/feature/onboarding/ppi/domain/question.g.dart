// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionCollection _$QuestionCollectionFromJson(Map<String, dynamic> json) =>
    QuestionCollection(
      (json['data'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionCollectionToJson(QuestionCollection instance) =>
    <String, dynamic>{
      'data': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      choices: (json['answers'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
      hints: json['hints'] as String?,
      question: json['question'] as String?,
      section: json['section'] as String?,
      questionType: json['question_type'] as String?,
      questionIndex: json['questionIndex'] as String?,
      questionId: json['question_id'] as String?,
      selectedOption: json['selectedOption'] as int? ?? -1,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'answers': instance.choices,
      'hints': instance.hints,
      'question': instance.question,
      'section': instance.section,
      'question_type': instance.questionType,
      'questionIndex': instance.questionIndex,
      'question_id': instance.questionId,
      'selectedOption': instance.selectedOption,
    };
