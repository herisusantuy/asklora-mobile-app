part of 'user_response_bloc.dart';

abstract class UserResponseEvent extends Equatable {
  const UserResponseEvent();
}

class SendResponse extends UserResponseEvent {
  final PpiSelectionRequest ppiUserResponseRequest;

  @override
  List<Object?> get props => [ppiUserResponseRequest];

  const SendResponse(this.ppiUserResponseRequest);
}

class SaveUserResponse extends UserResponseEvent {
  final Question question;
  final String selectedAnswer;

  const SaveUserResponse(this.question, this.selectedAnswer);

  @override
  List<Object?> get props => [question.toString()];
}

class SendBulkResponse extends UserResponseEvent {
  final List<PpiSelectionRequest> ppiUserResponseRequest;

  @override
  List<Object?> get props => [ppiUserResponseRequest];

  const SendBulkResponse(this.ppiUserResponseRequest);
}

class SkipResponse extends UserResponseEvent {
  @override
  List<Object?> get props => [];

  const SkipResponse();
}

class UpdatePpiUserResponse extends UserResponseEvent {
  final PpiUserResponse ppiUserResponse;

  @override
  List<Object?> get props => [ppiUserResponse];

  const UpdatePpiUserResponse(this.ppiUserResponse);
}
