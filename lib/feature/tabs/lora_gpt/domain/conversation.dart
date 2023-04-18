import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

enum ConversationType { me, lora, loading }

abstract class Conversation extends Equatable {
  late int timestamp;

  Conversation() {
    timestamp = DateTime.now().millisecondsSinceEpoch;
  }

  ConversationType type();

  static empty() => const [];

  @override
  List<Object?> get props => [timestamp];
}

@JsonSerializable()
class Lora extends Conversation {
  final String response;

  @JsonKey(name: 'session_id')
  final String sessionId;
  @JsonKey(name: 'type')
  final String respType;

  @JsonKey(name: 'usage')
  final Usage? usage;

  Lora(this.response, this.sessionId, this.respType, this.usage) : super();

  @override
  ConversationType type() => ConversationType.lora;

  factory Lora.fromJson(Map<String, dynamic> json) => _$LoraFromJson(json);

  Map<String, dynamic> toJson() => _$LoraToJson(this);

  @override
  List<Object?> get props => [response, sessionId, respType, usage, timestamp];
}

@JsonSerializable()
class Usage extends Equatable {
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;
  @JsonKey(name: 'completion_tokens')
  final int completionTokens;
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  const Usage(this.promptTokens, this.completionTokens, this.totalTokens);

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);

  @override
  List<Object?> get props => [
        promptTokens,
        completionTokens,
        totalTokens,
      ];
}

class Me extends Conversation {
  final String query;

  Me(this.query) : super();

  @override
  ConversationType type() => ConversationType.me;

  @override
  List<Object?> get props => [query, timestamp];
}

class Loading extends Conversation {
  @override
  ConversationType type() => ConversationType.loading;
}
