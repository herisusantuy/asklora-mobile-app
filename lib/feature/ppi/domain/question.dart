class QuestionCollection {
  String? collection;
  Question? questions;
  String? uid;

  QuestionCollection({this.collection, this.questions, this.uid});

  QuestionCollection.fromJson(Map<String, dynamic> json) {
    collection = json['collection'];
    questions =
        json['questions'] != null ? Question.fromJson(json['questions']) : null;
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collection'] = collection;
    if (questions != null) {
      data['questions'] = questions!.toJson();
    }
    data['uid'] = uid;
    return data;
  }
}

class Question {
  List<Choices>? choices;
  String? hints;
  String? question;
  String? section;
  String? types;
  String? questionIndex;

  Question(
      {this.choices,
      this.hints,
      this.question,
      this.section,
      this.types,
      this.questionIndex});

  Question.fromJson(Map<String, dynamic> json) {
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    hints = json['hints'];
    question = json['question'];
    section = json['section'];
    types = json['types'];
    questionIndex = json['question_index'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    data['hints'] = hints;
    data['question'] = question;
    data['section'] = section;
    data['types'] = types;
    data['question_index'] = questionIndex;
    return data;
  }
}

class Choices {
  String? name;
  String? point;

  Choices({this.name, this.point});

  Choices.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['point'] = point;
    return data;
  }

  @override
  String toString() {
    return 'Choices{name: $name, point: $point}';
  }
}
