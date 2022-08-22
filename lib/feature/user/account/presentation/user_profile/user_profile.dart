import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/utils/storage/secure_storage.dart';
import '../../bloc/account_bloc.dart';
import '../../repository/account_repository.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CustomText('User Profile'),
      ),
      body: BlocProvider(
        create: (context) => AccountBloc(
            getAccountRepository: AccountRepository(),
            secureStorage: SecureStorage())
          ..add(GetAccount()),
        child: _userProfile(),
      ),
    );
  }

  Widget _userProfile() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state.status == AccountStatus.unknown ||
            state.status == AccountStatus.fetchingAccount) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == AccountStatus.success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: CustomText('Ava'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (state.account!.identity != null)
                        Column(
                          children: [
                            CustomText(
                              '${state.account!.identity!.givenName} ${state.account!.identity!.middleName} ${state.account!.identity!.familyName}',
                            ),
                            CustomText(state.account!.identity!.chineseName),
                          ],
                        )
                      else
                        const SizedBox()
                    ],
                  ),
                ),
              ),
              _customRowText('Email', state.account!.email),
              _customRowText('Phone Number',
                  '${state.account!.contact?.countryCode ?? ''}${state.account!.contact?.phoneNumber ?? ''}'),
              _customRowText('Street Address',
                  state.account!.contact?.streetAddress ?? ''),
              _customRowText('City', state.account!.contact?.city ?? ''),
              _customRowText('Unit', state.account!.contact?.unit ?? ''),
              _customRowText('State', state.account!.contact?.state ?? ''),
              _customRowText('Country', state.account!.contact?.country ?? ''),
            ],
          );
        } else {
          return const Center(child: CustomText('Failed to Load data'));
        }
      },
    );
  }

  Widget _customRowText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: CustomText(
                label,
                type: FontType.bodyTextBold,
              )),
          Expanded(flex: 3, child: CustomText(value)),
        ],
      ),
    );
  }

  static void open(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const UserProfileScreen()));
}
