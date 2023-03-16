import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/base_api_client.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../app/repository/user_journey_repository.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../onboarding/kyc/domain/get_account/get_account_response.dart';
import '../../../onboarding/kyc/repository/account_repository.dart';
import '../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../domain/sign_in_response.dart';
import '../repository/sign_in_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required SignInRepository signInRepository,
    required UserJourneyRepository userJourneyRepository,
    required SharedPreference sharedPreference,
    required AccountRepository accountRepository,
    required PpiResponseRepository ppiResponseRepository,
  })  : _signInRepository = signInRepository,
        _userJourneyRepository = userJourneyRepository,
        _sharedPreference = sharedPreference,
        _accountRepository = accountRepository,
        _ppiResponseRepository = ppiResponseRepository,
        super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
    on<SignInWithOtp>(_onSignInWithOtp);
  }

  final SignInRepository _signInRepository;
  final AccountRepository _accountRepository;
  final UserJourneyRepository _userJourneyRepository;
  final PpiResponseRepository _ppiResponseRepository;
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

      UserJourney? userJourney;
      final isOtpRequired = data.statusCode == 202;
      if (!isOtpRequired) {
        userJourney = await _userJourneyRepository.getUserJourney();

        GetAccountResponse getAccountResponse = await _fetchUserProfile();

        var snapshot = await _getUserSnapshot(getAccountResponse.username);
        if (snapshot.state == ResponseState.success) {
          if (userJourney == null) {
            ///user journey null means user activate from different devices
            await _ppiResponseRepository.linkUser(snapshot.data!.id);
            emit(state.copyWith(
                response: BaseResponse.complete(
                    data.copyWith(userJourney: UserJourney.investmentStyle))));
          } else {
            ///this is normal sign in flow
            emit(state.copyWith(
                response: BaseResponse.complete(
                    data.copyWith(userJourney: userJourney))));
          }
        } else {
          ///snapshot error should remove storage and emit error
          _signInRepository.removeStorageOnSignInFailed();
          emit(state.copyWith(response: BaseResponse.error()));
        }
      } else {
        ///this is when user need to input otp
        emit(state.copyWith(
            isOtpRequired: isOtpRequired,
            response: BaseResponse.complete(
                data.copyWith(userJourney: userJourney))));
      }
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
      _signInRepository.removeStorageOnSignInFailed();
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
      UserJourney? userJourney = await _userJourneyRepository.getUserJourney();

      GetAccountResponse getAccountResponse = await _fetchUserProfile();
      var snapshot = await _getUserSnapshot(getAccountResponse.username);
      if (snapshot.state == ResponseState.success) {
        emit(state.copyWith(
            response: BaseResponse.complete(data.copyWith(
                userJourney: userJourney ?? UserJourney.investmentStyle))));
      } else {
        ///snapshot error should remove storage and emit error
        _signInRepository.removeStorageOnSignInFailed();
        emit(state.copyWith(response: BaseResponse.error()));
      }
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

  Future<GetAccountResponse> _fetchUserProfile() async {
    /// TODO: Cache the whole account info.
    final accountInfo = await _accountRepository.getAccount();
    _sharedPreference.writeData(sfKeyEmail, accountInfo.email);
    _sharedPreference.writeData(sfKeyPpiUsername, accountInfo.username);
    return accountInfo;
  }

  Future<BaseResponse<SnapShot>> _getUserSnapshot(String username) async {
    var snapshot = await _ppiResponseRepository.getUserSnapShotUserId(username);
    _sharedPreference.writeData(sfKeyPpiAccountId, snapshot.data!.accountId);
    _sharedPreference.writeIntData(sfKeyPpiUserId, snapshot.data!.id);
    return snapshot;
  }
}
