part of 'user_response_bloc.dart';

abstract class UserResponseEvent extends Equatable {
  const UserResponseEvent();
}

class SendResponse extends UserResponseEvent {
  final PpiUserResponseRequest ppiUserResponseRequest;

  @override
  List<Object?> get props => [ppiUserResponseRequest];

  const SendResponse(this.ppiUserResponseRequest);
}

class SendBulkResponse extends UserResponseEvent {
  final List<PpiUserResponseRequest> ppiUserResponseRequest;

  @override
  List<Object?> get props => [ppiUserResponseRequest];

  const SendBulkResponse(this.ppiUserResponseRequest);
}

class SkipResponse extends UserResponseEvent {
  @override
  List<Object?> get props => [];

  const SkipResponse();
}

class UpdateppiUserResponse extends UserResponseEvent {
  final PpiUserResponse ppiUserResponse;

  @override
  List<Object?> get props => [ppiUserResponse];

  const UpdateppiUserResponse(this.ppiUserResponse);
}
