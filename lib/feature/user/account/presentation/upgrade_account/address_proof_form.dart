import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../bloc/account_bloc.dart';

class AddressProofForm extends StatelessWidget {
  final PageController controller;
  const AddressProofForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
              key: const Key('account_residential_address_input'),
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
                key: const Key('account_city_input'),
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
              key: const Key('account_country_input'),
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
          return Column(
            children: [
              QuestionWidget(
                key: const Key('account_is_same_mailing_address_input'),
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
                key: const Key('account_mail_unit_number_input'),
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
                key: const Key('account_mail_residential_address_input'),
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
                key: const Key('account_city_input'),
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
                key: const Key('account_country_input'),
                labelText: 'Country',
                onChanged: (mailCountry) => context
                    .read<AccountBloc>()
                    .add(AccountMailCountryChanged(mailCountry)),
                hintText: 'Enter your Country'),
          );
        },
      );

  bool _validateAddressProofStep(AccountState state) {
    if (state.unitNumber.isEmpty ||
        state.residentialAddress.isEmpty ||
        state.city.isEmpty ||
        state.country.isEmpty ||
        state.mailUnitNumber.isEmpty ||
        state.mailResidentialAddress.isEmpty ||
        state.mailCity.isEmpty ||
        state.mailCountry.isEmpty) {
      return true;
    }
    return false;
  }

  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            return CustomTextButton(
                disable: _validateAddressProofStep(state),
                buttonText: 'Next',
                borderRadius: 30,
                onClick: () {
                  context
                      .read<AccountBloc>()
                      .add(const AccountCurrentStepChanged('next'));
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                });
          },
        ),
      );
}
