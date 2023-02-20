import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/onfido/start_onfido.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/utils/storage/secure_storage.dart';
import '../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../../onboarding/welcome/carousel/presentation/carousel_screen.dart';
import '../../../orders/regular/presentation/regular_order_home_screen.dart';
import '../../../payment/deposits/presentation/deposit_screen.dart';
import '../../../payment/withdrawal/presentation/withdrawal_screen.dart';
import '../../../user/account/bloc/account_bloc.dart';
import '../../../user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import '../../../user/account/presentation/user_profile/user_profile_screen.dart';
import '../../../user/account/repository/account_repository.dart';
import '../../../user/kyc/domain/onfido_result_request.dart';
import '../../sign_out/bloc/sign_out_bloc.dart';
import '../../sign_out/repository/sign_out_repository.dart';

class SignInSuccessScreen extends StatelessWidget {
  static const route = '/sign_in_success_screen';

  const SignInSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            'Welcome!',
            type: FontType.h4SemiBold,
          ),
          actions: [_userButton(context)],
        ),
        body: Padding(
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
                        try {
                          await startOnfido(state.token).then((value) => context
                              .read<AccountBloc>()
                              .add(UpdateOnfidoResult(
                                  Reason.userCompleted.value,
                                  'Onfido SDK',
                                  state.token)));
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
                _upgradeAccountScreen(context),
                _padding(),
                _getOnfidoToken(),
                _padding(),
                _getWithdrawalButton(context),
                _padding(),
                _depositScreen(context),
                _padding(),
                _regularOrder(context),
                _padding(),
                _questionScreen(context),
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

  Widget _regularOrder(BuildContext context) => CustomTextButton(
      buttonText: 'Order (Regular)',
      onClick: () => RegularOrderHomeScreen.open(context));

  Widget _questionScreen(BuildContext context) => CustomTextButton(
      buttonText: 'Question PPI',
      onClick: () => PpiScreen.open(context,
          arguments: Pair(QuestionPageType.privacy, QuestionPageStep.privacy)));

  Widget _userButton(BuildContext context) {
    return InkWell(
      onTap: () {
        UserProfileScreen.open(context);
      },
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget _signOutButton() => BlocListener<SignOutBloc, SignOutState>(
        listener: (context, state) async {
          switch (state.response.state) {
            case ResponseState.error:
              CustomSnackBar(context)
                  .setMessage(state.response.message)
                  .showError();
              break;
            case ResponseState.success:
              CustomInAppNotification.show(context, 'Logged out successfully!');
              CarouselScreen.open(context);
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

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
