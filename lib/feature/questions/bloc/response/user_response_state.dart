part of 'user_response_bloc.dart';

class UserResponseState extends Equatable {
  final ResponseState responseState;
  final EndpointResponse endpointResponse;

  const UserResponseState(
      {this.responseState = ResponseState.unknown, this.endpointResponse = const EndpointResponse(),});

  UserResponseState copyWith({
    ResponseState? responseState,
    EndpointResponse? endpointResponse,
  }) {
    return UserResponseState(
        responseState: responseState ?? this.responseState,
      endpointResponse: endpointResponse ?? this.endpointResponse,
    );
  }

  @override
  List<Object> get props => [responseState, endpointResponse];
}
