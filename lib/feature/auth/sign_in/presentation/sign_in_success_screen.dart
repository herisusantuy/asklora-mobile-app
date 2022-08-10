import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onfido/flutter_onfido.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/utils/storage/secure_storage.dart';
import '../../../../home_screen.dart';
import '../../../payment/deposits/presentation/deposit_screen.dart';
import '../../../payment/withdrawal/presentation/withdrawal_screen.dart';
import '../../../user/account/bloc/account_bloc.dart';
import '../../../user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import '../../../user/account/repository/account_repository.dart';
import '../../../user/kyc/domain/onfido_result_request.dart';
import '../../sign_out/bloc/sign_out_bloc.dart';
import '../../sign_out/repository/sign_out_repository.dart';

class SignInSuccessScreen extends StatelessWidget {
  static const route = '/sign_in_success_screen';

  const SignInSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Success Login'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AccountBloc(
                getAccountRepository: AccountRepository(),
                secureStorage: SecureStorage()),
          ),
          BlocProvider(
            create: (context) => SignOutBloc(
                tokenRepository: TokenRepository(),
                signOutRepository: SignOutRepository()),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocListener<AccountBloc, AccountState>(
                    listener: (context, state) async {
                      switch (state.status) {
                        case AccountStatus.failure:
                          CustomSnackBar(context)
                              .setMessage(state.responseMessage)
                              .showError();
                          break;
                        case AccountStatus.success:
                          CustomSnackBar(context)
                              .setMessage(state.responseMessage)
                              .show();
                          break;
                        default:
                          break;
                      }
                      if (state is OnfidoSdkToken) {
                        // TODO: Refactor this into Widget and Bloc
                        try {
                          await FlutterOnfido.start(
                            config: OnfidoConfig(
                              sdkToken: state.token,
                              flowSteps: OnfidoFlowSteps(
                                welcome: false,
                                captureDocument: OnfidoCaptureDocumentStep(
                                    countryCode: OnfidoCountryCode.HKG,
                                    docType: OnfidoDocumentType
                                        .NATIONAL_IDENTITY_CARD),
                                captureFace: OnfidoCaptureFaceStep(
                                    OnfidoCaptureType.PHOTO),
                              ),
                            ),
                            iosAppearance: const OnfidoIOSAppearance(),
                          ).then((value) => context.read<AccountBloc>().add(
                              UpdateOnfidoResult(Reason.userCompleted.value,
                                  'Onfido SDK', state.token)));
                        } on PlatformException {
                          context.read<AccountBloc>().add(UpdateOnfidoResult(
                              Reason.userExited.value,
                              'Onfido SDK',
                              state.token));
                        } catch (e) {
                          context.read<AccountBloc>().add(UpdateOnfidoResult(
                              Reason.sdkError.value,
                              'Onfido SDK',
                              state.token));
                        }
                      }
                    },
                    child: const SizedBox()),
                _getAccountButton(),
                _padding(),
                _upgradeAccountScreen(context),
                _padding(),
                _getOnfidoToken(),
                _padding(),
                _getWithdrawalButton(context),
                _padding(),
                _depositScreen(context),
                _padding(),
                _signOutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWithdrawalButton(BuildContext context) => CustomTextButton(
      buttonText: 'Withdraw', onClick: () => WithdrawalScreen.open(context));

  Widget _upgradeAccountScreen(BuildContext context) => CustomTextButton(
        buttonText: 'Upgrade Account Screen',
        onClick: () => UpgradeAccountScreen.open(context),
      );

  Widget _depositScreen(BuildContext context) => CustomTextButton(
      buttonText: 'Deposit', onClick: () => DepositScreen.open(context));

  Widget _getAccountButton() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomTextButton(
            buttonText: 'Get Account',
            isLoading: state.status == AccountStatus.fetchingAccount,
            disable: state.status == AccountStatus.fetchingAccount,
            onClick: () => context.read<AccountBloc>().add(GetAccount()),
            borderRadius: 5,
          );
        },
      );

  Widget _signOutButton() => BlocListener<SignOutBloc, SignOutState>(
        listener: (context, state) async {
          switch (state.response.state) {
            case ResponseState.error:
              CustomSnackBar(context)
                  .setMessage(state.response.message)
                  .showError();
              break;
            case ResponseState.success:
              CustomSnackBar(context).setMessage(state.response.message).show();
              HomeScreen.openReplace(context);
              break;
            default:
              break;
          }
        },
        child: BlocBuilder<SignOutBloc, SignOutState>(
          buildWhen: ((previous, current) =>
              previous.response.state != current.response.state),
          builder: (context, state) {
            return CustomTextButton(
              buttonText: 'Sign Out',
              disable: state.response.state == ResponseState.loading,
              isLoading: state.response.state == ResponseState.loading,
              onClick: () =>
                  context.read<SignOutBloc>().add(const SignOutSubmitted()),
              borderRadius: 5,
            );
          },
        ),
      );

  Widget _getOnfidoToken() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomTextButton(
            buttonText: 'Open Verification',
            isLoading: state.status == AccountStatus.fetchingOnfidoToken,
            disable: state.status == AccountStatus.fetchingOnfidoToken,
            onClick: () => context.read<AccountBloc>().add(GetSdkToken()),
            borderRadius: 5,
          );
        },
      );

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );

  static void openAndRemoveAllRoute(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }
}
