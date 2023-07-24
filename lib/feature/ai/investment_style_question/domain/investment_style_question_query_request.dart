import 'package:json_annotation/json_annotation.dart';

import '../../../tabs/lora_gpt/domain/query_request.dart';

part 'investment_style_question_query_request.g.dart';

@JsonSerializable()
class InvestmentStyleQuestionQueryRequest extends BaseQueryRequest {
  @JsonKey(name: 'user_id')
  final String userId;
  final String username;
  final String platform;
  final bool start;
  @JsonKey(name: 'ans')
  final int answer;

  const InvestmentStyleQuestionQueryRequest({
    required String input,
    this.userId = 'user_id',
    this.username = 'testing user',
    this.platform = 'mobile_app',
    required this.start,
    this.answer = -1,
  }) : super(input: input);

  factory InvestmentStyleQuestionQueryRequest.fromJson(
          Map<String, dynamic> json) =>
      _$InvestmentStyleQuestionQueryRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InvestmentStyleQuestionQueryRequestToJson(this);

  @override
  List<Object?> get props => [input, userId, username, platform, start, answer];
}
