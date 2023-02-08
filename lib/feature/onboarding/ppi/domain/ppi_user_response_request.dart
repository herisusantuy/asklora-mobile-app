class PpiSelectionRequest {
  final String name;
  final String questionId;
  final String section;
  final String types;
  final String points;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['section'] = section;
    data['question_type'] = types;
    data['score'] = points;
    return data;
  }

  PpiSelectionRequest(
      {required this.name,
      required this.questionId,
      required this.section,
      required this.types,
      required this.points});
}
