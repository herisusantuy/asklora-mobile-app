import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/repository/token_repository.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../get_account/bloc/get_account_bloc.dart';
import '../../get_account/repository/get_account_repository.dart';

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
            GetAccountBloc(getAccountRepository: GetAccountRepository()),
        child: BlocListener<GetAccountBloc, GetAccountState>(
          listener: (context, state) {
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
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getAccountButton(),
                _padding(),
                _upgradeAccount(),
                _padding(),
                _getSdkToken()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getAccountButton() => BlocBuilder<GetAccountBloc, GetAccountState>(
        builder: (context, state) {
          return CustomTextButton(
            buttonText: 'Get Account',
            isLoading: state.status == GetAccountStatus.loading,
            disable: state.status == GetAccountStatus.loading,
            onClick: () =>
                context.read<GetAccountBloc>().add(GetAccountSubmitted()),
            borderRadius: 5,
          );
        },
      );

  Widget _upgradeAccount() => CustomTextButton(
      buttonText: 'Upgrade Account',
      onClick: () => {
            _getAuthToken(),
          });

  Widget _getSdkToken() =>
      CustomTextButton(buttonText: 'Get SDK Token', onClick: () => {});

  void _getAuthToken() async {
    var accessToken = TokenRepository();
    debugPrint('Krishna access ${await accessToken.getAccessToken()}');
    debugPrint('Krishna detail ${await accessToken.getDetailToken()}');
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SignInSuccessScreen()));
}
