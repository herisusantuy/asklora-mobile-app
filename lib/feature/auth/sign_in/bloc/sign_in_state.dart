part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final BaseResponse<SignInResponse> response;
  final String emailAddress;
  final bool isEmailValid;
  final ValidationCode emailAddressValidationText;
  final String password;
  final bool isOtpRequired;

  const SignInState(
      {this.response = const BaseResponse(),
      this.emailAddress = '',
      this.isEmailValid = false,
      this.emailAddressValidationText = ValidationCode.empty,
      this.password = '',
      this.isOtpRequired = false})
      : super();

  @override
  List<Object> get props => [
        response,
        emailAddress,
        isEmailValid,
        emailAddressValidationText,
        password,
        isOtpRequired
      ];

  SignInState copyWith(
      {BaseResponse<SignInResponse>? response,
      String? emailAddress,
      bool? isEmailValid,
      ValidationCode? emailAddressValidationText,
      String? password,
      bool? isOtpRequired}) {
    return SignInState(
      response: response ?? this.response,
      emailAddress: emailAddress ?? this.emailAddress,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      emailAddressValidationText:
          emailAddressValidationText ?? this.emailAddressValidationText,
      password: password ?? this.password,
      isOtpRequired: isOtpRequired ?? this.isOtpRequired,
    );
  }
}
