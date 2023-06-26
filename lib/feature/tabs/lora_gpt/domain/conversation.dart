import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

enum ConversationType { me, lora, loading, reset }

abstract class Conversation extends Equatable {
  ConversationType type();

  static empty() => const [];

  @override
  List<Object?> get props => [type()];
}

@JsonSerializable()
class Lora extends Conversation {
  final String response;

  @JsonKey(name: 'request_id')
  final String requestId;
  @JsonKey(name: 'type')
  final String respType;

  @JsonKey(name: 'new_session')
  final bool newSession;

  Lora(this.response, this.requestId, this.respType, this.newSession);

  @override
  ConversationType type() => ConversationType.lora;

  factory Lora.fromJson(Map<String, dynamic> json) => _$LoraFromJson(json);

  Map<String, dynamic> toJson() => _$LoraToJson(this);

  @override
  List<Object?> get props => [response, requestId, respType, newSession];

  static Lora get defaultMessage => Lora(
      '👋Hi! I’m Lora. Let me know if you have any questions or requests on stocks investments.',
      '',
      '',
      false);
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
  List<Object?> get props => [query];
}

class Loading extends Conversation {
  @override
  ConversationType type() => ConversationType.reset;
}

class Reset extends Conversation {
  @override
  ConversationType type() => ConversationType.loading;
}
