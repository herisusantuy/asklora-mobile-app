import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/account_bloc.dart';
import '../../repository/account_repository.dart';
import 'address_proof_form.dart';
import 'basic_information.dart';

class UpgradeAccountScreen extends StatelessWidget {
  const UpgradeAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageViewController = PageController(initialPage: 0);
    int _currentPageIndex = 0;

    List<Widget> _pages = [
      // BasicInformationForm(
      //   controller: _pageViewController,
      // ),
      AddressProofForm(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        title: const CustomText('Upgrade Account'),
      ),
      body: BlocProvider(
        create: (context) =>
            AccountBloc(getAccountRepository: AccountRepository()),
        child: SafeArea(
            child: Column(
          children: [
            _headerUpgradeAccount(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PageView(
                  controller: _pageViewController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) {
                    _currentPageIndex = page;
                  },
                  children: _pages,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _headerUpgradeAccount() => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () => '',
              child: Container(
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  Icons.chevron_left_rounded,
                  size: 35,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                'Step',
              ),
            )
          ],
        ),
      );

  static void open(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const UpgradeAccountScreen()));
}
