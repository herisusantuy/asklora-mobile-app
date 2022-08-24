import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/storage/secure_storage.dart';
import '../../bloc/account_bloc.dart';
import '../../repository/account_repository.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText('User Profile', type: FontType.h4SemiBold)),
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
          String firstName = state.account!.identity!.givenName;
          String middleName = state.account!.identity!.middleName;
          String familyName = state.account!.identity!.familyName;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 32,
                          backgroundColor: randomColor(),
                          child: CustomText(
                            '${familyName[0].toUpperCase()} ${familyName[0].toUpperCase()}',
                            type: FontType.h4SemiBold,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      if (state.account!.identity != null)
                        Column(
                          children: [
                            CustomText('$firstName $middleName $familyName'),
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
