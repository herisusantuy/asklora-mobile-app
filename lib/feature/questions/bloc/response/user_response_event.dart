part of 'user_response_bloc.dart';

abstract class UserResponseEvent extends Equatable {
  const UserResponseEvent();
}

class SendResponse extends UserResponseEvent {
  final UserResponseRequest userResponseRequest;

  @override
  List<Object?> get props => [userResponseRequest];

  const SendResponse(this.userResponseRequest);
}

class SendBulkResponse extends UserResponseEvent {
  final List<UserResponseRequest> userResponseRequest;

  @override
  List<Object?> get props => [userResponseRequest];

  const SendBulkResponse(this.userResponseRequest);
}

class SkipResponse extends UserResponseEvent {
  @override
  List<Object?> get props => [];

  const SkipResponse();
}

class UpdateEndpointResponse extends UserResponseEvent {
  final EndpointResponse endpointResponse;

  @override
  List<Object?> get props => [endpointResponse];

  const UpdateEndpointResponse(this.endpointResponse);
}
