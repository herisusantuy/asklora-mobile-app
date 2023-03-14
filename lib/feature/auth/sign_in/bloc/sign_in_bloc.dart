import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/base_api_client.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../app/repository/user_journey_repository.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../user/account/repository/account_repository.dart';
import '../domain/sign_in_response.dart';
import '../repository/sign_in_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
      {required SignInRepository signInRepository,
      required UserJourneyRepository userJourneyRepository,
      required SharedPreference sharedPreference,
      required AccountRepository accountRepository})
      : _signInRepository = signInRepository,
        _userJourneyRepository = userJourneyRepository,
        _sharedPreference = sharedPreference,
        _accountRepository = accountRepository,
        super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
    on<SignInWithOtp>(_onSignInWithOtp);
  }

  final SignInRepository _signInRepository;
  final AccountRepository _accountRepository;
  final UserJourneyRepository _userJourneyRepository;
  final SharedPreference _sharedPreference;

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(
        response: BaseResponse.unknown(),
        emailAddress: event.emailAddress,
        isEmailValid: event.emailAddress.isValidEmail(),
        emailAddressErrorText:
            (event.emailAddress.toLowerCase().isValidEmail() ||
                    event.emailAddress.isEmpty)
                ? ''
                : 'Enter valid email'));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
        response: BaseResponse.unknown(),
        password: event.password,
        isPasswordValid: event.password.isValidPassword(),
        passwordErrorText:
            (event.password.isValidPassword() || event.password.isEmpty)
                ? ''
                : 'Enter valid password'));
  }

  void _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _signInRepository.signIn(
          email: state.emailAddress, password: state.password);
      UserJourney userJourney = await _userJourneyRepository.getUserJourney();

      final isOtpRequired = data.statusCode == 202;
      if (!isOtpRequired) {
        await _fetchUserProfile();
      }

      emit(state.copyWith(
          isOtpRequired: isOtpRequired,
          response:
              BaseResponse.complete(data.copyWith(userJourney: userJourney))));
    } on UnauthorizedException {
      emit(state.copyWith(
          response: BaseResponse.error(message: 'Invalid Password')));
    } on NotFoundException {
      emit(state.copyWith(
          response: BaseResponse.error(
              message: 'User does not exist with the given email')));
    } on NotAcceptableException {
      emit(state.copyWith(
          response: BaseResponse.error(message: 'User email is not verified')));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  void _onSignInWithOtp(
    SignInWithOtp event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _signInRepository.signInWithOtp(
          otp: event.otp, email: event.email, password: event.password);
      UserJourney userJourney = await _userJourneyRepository.getUserJourney();

      await _fetchUserProfile();

      emit(state.copyWith(
          response:
              BaseResponse.complete(data.copyWith(userJourney: userJourney))));
    } on UnauthorizedException {
      emit(state.copyWith(
          response: BaseResponse.error(message: 'Invalid Password')));
    } on NotFoundException {
      emit(state.copyWith(
          response: BaseResponse.error(
              message: 'User does not exist with the given email')));
    } on NotAcceptableException {
      emit(state.copyWith(
          response: BaseResponse.error(message: 'User email is not verified')));
    } on BadRequestException {
      emit(
          state.copyWith(response: BaseResponse.error(message: 'Invalid OTP')));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  Future<void> _fetchUserProfile() async {
    /// TODO: Cache the whole account info.
    final accountInfo = await _accountRepository.getAccount();
    _sharedPreference.writeData(sfKeyEmail, accountInfo.email);
  }
}
