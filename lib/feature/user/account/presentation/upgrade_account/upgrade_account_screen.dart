import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/account_bloc.dart';
import '../../repository/account_repository.dart';
import 'address_proof_form.dart';
import 'financial_profile_form.dart';
import 'basic_information_form.dart';

class UpgradeAccountScreen extends StatelessWidget {
  const UpgradeAccountScreen({Key? key, required this.initialPage})
      : super(key: key);

  final int initialPage;

  @override
  Widget build(BuildContext context) {
    final PageController _pageViewController =
        PageController(initialPage: initialPage);

    List<Widget> _pages = [
      BasicInformationForm(
        key: const Key('basic_information_step'),
        controller: _pageViewController,
      ),
      AddressProofForm(
        key: const Key('address_proof_step'),
        controller: _pageViewController,
      ),
      FinancialProfileForm(controller: _pageViewController),
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
            _headerUpgradeAccount(_pageViewController),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PageView(
                  key: const Key('upgrade_account_page_view'),
                  controller: _pageViewController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _pages,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _headerUpgradeAccount(PageController controller) => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<AccountBloc>()
                        .add(const AccountCurrentStepChanged('back'));
                    controller.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
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
                    state.currentStepIndex == 0
                        ? 'Basic Information'
                        : state.currentStepIndex == 1
                            ? 'Address Proof'
                            : state.currentStepIndex == 2
                                ? 'Employment, Financial Profile'
                                : '',
                  ),
                )
              ],
            );
          },
        ),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const UpgradeAccountScreen(
                initialPage: 0,
              )));
}
