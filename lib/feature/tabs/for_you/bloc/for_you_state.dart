part of 'for_you_bloc.dart';

class ForYouState extends Equatable {
  const ForYouState({
    this.response = const BaseResponse(),
  });

  final BaseResponse<String> response;

  @override
  List<Object?> get props {
    return [
      response,
    ];
  }

  ForYouState copyWith({
    BaseResponse<String>? response,
  }) {
    return ForYouState(
      response: response ?? this.response,
    );
  }
}
