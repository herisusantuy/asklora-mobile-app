import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

enum ConversationType { me, lora, loading, reset, next, component }

abstract class Conversation extends Equatable {
  ConversationType type();

  static empty() => const [];

  @override
  List<Object?> get props => [type()];
}

class Lora extends Conversation {
  final String text;
  final bool isTyping;

  Lora(this.text, {this.isTyping = false});

  @override
  ConversationType type() => ConversationType.lora;

  @override
  List<Object?> get props => [type(), text];

  static Lora get defaultMessage => Lora(
        "👋Hi! I'm Lora. Let me know if you have any questions or requests on stocks investments.",
      );
}

class LoraError extends Lora {
  LoraError()
      : super('Lora is working on some optimizations to serve you better.');

  @override
  List<Object?> get props => [type(), text];
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
  final String text;
  final String userName;

  Me(this.text, this.userName) : super();

  @override
  ConversationType type() => ConversationType.me;

  @override
  List<Object?> get props => [text, type()];
}

class NextButton extends Conversation {
  @override
  ConversationType type() => ConversationType.next;

  @override
  List<Object?> get props => [type()];
}

class Loading extends Conversation {
  @override
  ConversationType type() => ConversationType.loading;

  @override
  List<Object?> get props => [type()];
}

class Reset extends Conversation {
  @override
  ConversationType type() => ConversationType.reset;

  @override
  List<Object?> get props => [type()];
}
