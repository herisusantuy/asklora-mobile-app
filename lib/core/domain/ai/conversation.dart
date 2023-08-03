import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

enum ConversationType { me, lora, loading, reset, next, component }

abstract class Conversation extends Equatable {
  final bool isNeedCallback;

  ConversationType type();

  const Conversation({this.isNeedCallback = false});

  static empty() => const [];

  @override
  List<Object?> get props => [type()];
}

class Lora extends Conversation {
  final String text;

  const Lora(this.text, {bool isNeedCallback = true})
      : super(isNeedCallback: isNeedCallback);

  @override
  ConversationType type() => ConversationType.lora;

  @override
  List<Object?> get props => [type(), text, isNeedCallback];

  Lora copyWith({bool? isNeedCallback}) =>
      Lora(text, isNeedCallback: isNeedCallback ?? this.isNeedCallback);
}

class LoraError extends Lora {
  const LoraError({bool isNeedCallback = true})
      : super('Lora is working on some optimizations to serve you better.',
            isNeedCallback: isNeedCallback);

  @override
  List<Object?> get props => [type(), text, isNeedCallback];
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

  const Me(this.text, this.userName) : super();

  @override
  ConversationType type() => ConversationType.me;

  @override
  List<Object?> get props => [text, type(), isNeedCallback];
}

class NextButton extends Conversation {
  @override
  ConversationType type() => ConversationType.next;

  const NextButton() : super(isNeedCallback: false);

  @override
  List<Object?> get props => [type(), isNeedCallback];
}

class Loading extends Conversation {
  @override
  ConversationType type() => ConversationType.loading;

  const Loading() : super(isNeedCallback: false);

  @override
  List<Object?> get props => [type(), isNeedCallback];
}

class Reset extends Conversation {
  @override
  ConversationType type() => ConversationType.reset;

  const Reset() : super(isNeedCallback: false);

  @override
  List<Object?> get props => [type(), isNeedCallback];
}
