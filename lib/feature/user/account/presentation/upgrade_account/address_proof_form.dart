import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../../../../question_bloc.dart';
import '../../bloc/account_bloc.dart';

class AddressProofForm extends StatelessWidget {
  const AddressProofForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _unitNumberInput(),
                  _residentialAddressInput(),
                  _cityInput(),
                  _countryInput(),
                  _mailAddressCheck(_scrollController),
                ],
              ),
            ),
          ),
          _nextButton(),
        ],
      ),
    );
  }

  Widget _unitNumberInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomTextInput(
              labelText: 'Unit/Apartment No.',
              hintText: 'Enter your Unit/Apartment No.',
              onChanged: (unitNumber) => context
                  .read<AccountBloc>()
                  .add(AccountUnitNumberChanged(unitNumber)),
            ),
          );
        },
      );

  Widget _residentialAddressInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              labelText: 'Residential Address',
              hintText: 'Enter your Residential Address',
              onChanged: (residentialAddress) => context
                  .read<AccountBloc>()
                  .add(AccountResidentialChanged(residentialAddress)),
            ),
          );
        },
      );

  Widget _cityInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
                labelText: 'City',
                onChanged: (city) =>
                    context.read<AccountBloc>().add(AccountCityChanged(city)),
                hintText: 'Enter your City'),
          );
        },
      );

  Widget _countryInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              labelText: 'Country',
              hintText: 'Enter your Country',
              onChanged: (country) => context
                  .read<AccountBloc>()
                  .add(AccountCountryChanged(country)),
            ),
          );
        },
      );

  Widget _mailAddressCheck(ScrollController controller) =>
      BlocBuilder<AccountBloc, AccountState>(
        builder: (BuildContext context, state) {
          print('state select options: ${state.isSameMailingAddress}');
          return Column(
            children: [
              QuestionWidget(
                padding: const EdgeInsets.only(top: 10),
                questionText:
                    'My mailing address and residential address is the same',
                options: const ['Yes', 'No'],
                selectedAnswer: state.isSameMailingAddress ? 'Yes' : 'No',
                onSelected: (value) async {
                  context.read<AccountBloc>().add(
                        AccountIsSameMailingAddressChanged(
                            value == 'Yes' ? true : false),
                      );
                  Future.delayed(
                      const Duration(milliseconds: 200),
                      () => controller.animateTo(
                            controller.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          ));
                },
              ),
              if (!state.isSameMailingAddress)
                Column(
                  children: [
                    _mailApartmentNumberInput(),
                    _mailResidentAddressInput(),
                    _mailCityInput(),
                    _mailCountryInput(),
                  ],
                ),
            ],
          );
        },
      );

  Widget _mailApartmentNumberInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomTextInput(
                labelText: 'Unit/Apartment No.',
                onChanged: (mailUnitNumber) => context
                    .read<AccountBloc>()
                    .add(AccountMailUnitNumberChanged(mailUnitNumber)),
                hintText: 'Enter your Unit/Apartment No.'),
          );
        },
      );

  Widget _mailResidentAddressInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
                labelText: 'Residential Address',
                onChanged: (mailResidentialAddress) => context
                    .read<AccountBloc>()
                    .add(AccountMailResidentialAddressChanged(
                        mailResidentialAddress)),
                hintText: 'Enter your Residential Address'),
          );
        },
      );

  Widget _mailCityInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
                labelText: 'City',
                onChanged: (mailCity) => context
                    .read<AccountBloc>()
                    .add(AccountMailCityChanged(mailCity)),
                hintText: 'Enter your City'),
          );
        },
      );

  Widget _mailCountryInput() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: CustomTextInput(
                labelText: 'Country',
                onChanged: (mailCountry) => context
                    .read<AccountBloc>()
                    .add(AccountMailCountryChanged(mailCountry)),
                hintText: 'Enter your Country'),
          );
        },
      );

  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextButton(
            buttonText: 'Next', borderRadius: 30, onClick: () => ''),
      );
}
