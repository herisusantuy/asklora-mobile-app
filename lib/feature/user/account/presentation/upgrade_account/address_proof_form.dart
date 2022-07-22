import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/address_proof/bloc/address_proof_bloc.dart';

class AddressProofForm extends StatelessWidget {
  final PageController controller;

  final _scrollController = ScrollController();

  AddressProofForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _unitNumberInput(context),
                _residentialAddressInput(context),
                _cityInput(context),
                _countryInput(context),
                _mailAddressCheck(_scrollController),
              ],
            ),
          ),
        ),
        _nextButton(),
      ],
    );
  }

  Widget _unitNumberInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomTextInput(
          key: const Key('account_unit_number_input'),
          labelText: 'Unit/Apartment No.',
          hintText: 'Enter your Unit/Apartment No.',
          onChanged: (unitNumber) => context
              .read<AddressProofBloc>()
              .add(AddressProofUnitNumberChanged(unitNumber)),
        ),
      );

  Widget _residentialAddressInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
          key: const Key('account_residential_address_input'),
          labelText: 'Residential Address',
          hintText: 'Enter your Residential Address',
          onChanged: (residentialAddress) => context
              .read<AddressProofBloc>()
              .add(AddressProofResidentialChanged(residentialAddress)),
        ),
      );

  Widget _cityInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
            key: const Key('account_city_input'),
            labelText: 'City',
            onChanged: (city) => context
                .read<AddressProofBloc>()
                .add(AddressProofCityChanged(city)),
            hintText: 'Enter your City'),
      );

  Widget _countryInput(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlocBuilder<AddressProofBloc, AddressProofState>(
        builder: (context, state) => CustomCountryPicker(
          key: const Key('account_country_input'),
          title: 'Country',
          initialValue: state.countryName,
          onSelect: (Country country) => context.read<AddressProofBloc>().add(
              AddressProofCountryChanged(
                  country.countryCodeIso3, country.name)),
        ),
      ));

  Widget _mailAddressCheck(ScrollController controller) =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) =>
            previous.isSameMailingAddress != current.isSameMailingAddress,
        builder: (BuildContext context, state) {
          const String key = 'account_is_same_mailing_address_select';
          return Column(
            children: [
              QuestionWidget(
                keyOption: key,
                key: const Key(key),
                padding: const EdgeInsets.only(top: 10),
                questionText:
                    'My mailing address and residential address is the same',
                options: const ['Yes', 'No'],
                selectedAnswer: state.isSameMailingAddress != null
                    ? (state.isSameMailingAddress! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) async {
                  context.read<AddressProofBloc>().add(
                        AddressProofIsSameMailingAddressChanged(
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
              if (state.isSameMailingAddress != null &&
                  !state.isSameMailingAddress!)
                Column(
                  children: [
                    _mailApartmentNumberInput(context),
                    _mailResidentAddressInput(context),
                    _mailCityInput(context),
                    _mailCountryInput(context),
                  ],
                ),
            ],
          );
        },
      );

  Widget _mailApartmentNumberInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomTextInput(
            key: const Key('account_mailing_unit_number_input'),
            labelText: 'Unit/Apartment No.',
            onChanged: (mailUnitNumber) => context
                .read<AddressProofBloc>()
                .add(AddressProofMailUnitNumberChanged(mailUnitNumber)),
            hintText: 'Enter your Unit/Apartment No.'),
      );

  Widget _mailResidentAddressInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
            key: const Key('account_mailing_residential_address_input'),
            labelText: 'Residential Address',
            onChanged: (mailResidentialAddress) => context
                .read<AddressProofBloc>()
                .add(AddressProofMailResidentialAddressChanged(
                    mailResidentialAddress)),
            hintText: 'Enter your Residential Address'),
      );

  Widget _mailCityInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
            key: const Key('account_mailing_city_input'),
            labelText: 'City',
            onChanged: (mailCity) => context
                .read<AddressProofBloc>()
                .add(AddressProofMailCityChanged(mailCity)),
            hintText: 'Enter your City'),
      );

  Widget _mailCountryInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20),
        child: CustomTextInput(
            key: const Key('account_mailing_country_input'),
            labelText: 'Country',
            onChanged: (mailCountry) => context
                .read<AddressProofBloc>()
                .add(AddressProofMailCountryChanged(mailCountry)),
            hintText: 'Enter your Country'),
      );

  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<AddressProofBloc, AddressProofState>(
          buildWhen: (previous, current) =>
              previous.enableNextButton() != current.enableNextButton(),
          builder: (context, state) {
            return CustomTextButton(
                key: const Key('account_address_proof_next_step_button'),
                disable: !state.enableNextButton(),
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
