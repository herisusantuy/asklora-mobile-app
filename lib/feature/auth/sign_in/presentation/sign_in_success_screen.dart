import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onfido/flutter_onfido.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/utils/storage/secure_storage.dart';
import '../../../user/account/bloc/account_bloc.dart';
import '../../../user/account/repository/account_repository.dart';
import '../../../user/kyc/domain/onfido_result_request.dart';

class SignInSuccessScreen extends StatelessWidget {
  const SignInSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Success Login'),
      ),
      body: BlocProvider(
        create: (context) =>
            AccountBloc(getAccountRepository: AccountRepository()),
        child: BlocListener<AccountBloc, AccountState>(
          listener: (context, state) async {
            switch (state.status) {
              case GetAccountStatus.failure:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: CustomText(state.responseMessage),
                  ));
                break;
              case GetAccountStatus.success:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: CustomText(state.responseMessage),
                  ));
                break;
              default:
                break;
            }
            if (state is OnfidoSdkToken) {
              // TODO: Refactor this into Widget and Bloc
              try {
                var result = await FlutterOnfido.start(
                  config: OnfidoConfig(
                    sdkToken: state.token,
                    flowSteps: OnfidoFlowSteps(
                      welcome: false,
                      captureDocument: OnfidoCaptureDocumentStep(
                          countryCode: OnfidoCountryCode.HKG,
                          docType: OnfidoDocumentType.NATIONAL_IDENTITY_CARD),
                      captureFace:
                          OnfidoCaptureFaceStep(OnfidoCaptureType.PHOTO),
                    ),
                  ),
                  iosAppearance: const OnfidoIOSAppearance(),
                );

                context.read<AccountBloc>().add(UpdateOnfidoResult(
                    Reason.userCompleted.value, 'Onfido SDK', state.token));
              } on PlatformException {
                context.read<AccountBloc>().add(UpdateOnfidoResult(
                    Reason.userExited.value, 'Onfido SDK', state.token));
              } catch (e) {
                context.read<AccountBloc>().add(UpdateOnfidoResult(
                    Reason.sdkError.value, 'Onfido SDK', state.token));
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getAccountButton(),
                _padding(),
                _upgradeUserAccount(),
                _padding(),
                _getOnfidoToken()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getAccountButton() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomTextButton(
            buttonText: 'Get Account',
            isLoading: state.status == GetAccountStatus.fetchingAccount,
            disable: state.status == GetAccountStatus.fetchingAccount,
            onClick: () => context.read<AccountBloc>().add(GetAccount()),
            borderRadius: 5,
          );
        },
      );

  Widget _upgradeUserAccount() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomTextButton(
            buttonText: 'Upgrade Account',
            isLoading: state.status == GetAccountStatus.upgradingAccount,
            disable: state.status == GetAccountStatus.upgradingAccount,
            onClick: () async {
              var email = await SecureStorage().readSecureData('email');
              context.read<AccountBloc>().add(UpgradeAccount(email ?? ''));
            },
            borderRadius: 5,
          );
        },
      );

  Widget _getOnfidoToken() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomTextButton(
            buttonText: 'Open Verification',
            isLoading: state.status == GetAccountStatus.fetchingOnfidoToken,
            disable: state.status == GetAccountStatus.fetchingOnfidoToken,
            onClick: () => context.read<AccountBloc>().add(GetSdkToken()),
            borderRadius: 5,
          );
        },
      );

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SignInSuccessScreen()));
}
