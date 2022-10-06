class UserResponseRequest {
  final String questionId;
  final String section;
  final String types;
  final String points;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['section'] = section;
    data['types'] = types;
    data['points'] = points;
    return data;
  }

  UserResponseRequest(
      {required this.questionId,
      required this.section,
      required this.types,
      required this.points});
}
