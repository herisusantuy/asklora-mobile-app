part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final BaseResponse<SignInResponse> response;
  final String emailAddress;
  final bool isEmailValid;
  final String emailAddressErrorText;
  final String password;
  final bool isPasswordValid;
  final bool isOtpRequired;

  const SignInState(
      {this.response = const BaseResponse(),
      this.emailAddress = '',
      this.isEmailValid = false,
      this.emailAddressErrorText = '',
      this.password = '',
      this.isPasswordValid = false,
      this.isOtpRequired = false})
      : super();

  @override
  List<Object> get props => [
        response,
        emailAddress,
        isEmailValid,
        emailAddressErrorText,
        password,
        isPasswordValid,
        isOtpRequired
      ];

  SignInState copyWith(
      {BaseResponse<SignInResponse>? response,
      String? emailAddress,
      bool? isEmailValid,
      String? emailAddressErrorText,
      String? password,
      bool? isPasswordValid,
      bool? isOtpRequired}) {
    return SignInState(
      response: response ?? this.response,
      emailAddress: emailAddress ?? this.emailAddress,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      emailAddressErrorText:
          emailAddressErrorText ?? this.emailAddressErrorText,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isOtpRequired: isOtpRequired ?? this.isOtpRequired,
    );
  }
}
