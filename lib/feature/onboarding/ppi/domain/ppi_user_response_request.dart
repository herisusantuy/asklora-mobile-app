class PpiSelectionRequest {
  final String questionId;
  final String answer;
  final int userId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['answer'] = answer;
    data['user_id'] = userId;
    return data;
  }

  PpiSelectionRequest(
      {required this.userId, required this.questionId, required this.answer});

  @override
  String toString() =>
      '{questionId: $questionId, answer: $answer, userId: $userId}';
}
