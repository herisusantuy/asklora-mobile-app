import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
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
    ScrollController _scrollController = ScrollController();
    return BlocListener<AddressProofBloc, AddressProofState>(
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
          // _nextButton(),
        ],
      ),
    );
  }

  Widget _unitNumberInput() => BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
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
        },
      );

  Widget _residentialAddressInput() =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              key: const Key('address_proof_residential_address_input'),
              labelText: 'Residential Address',
              hintText: 'Enter your Residential Address',
              onChanged: (residentialAddress) => context
                  .read<AddressProofBloc>()
                  .add(AddressProofResidentialChanged(residentialAddress)),
            ),
          );
        },
      );

  Widget _cityInput() => BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
                key: const Key('address_proof_city_input'),
                labelText: 'City',
                onChanged: (city) => context
                    .read<AddressProofBloc>()
                    .add(AddressProofCityChanged(city)),
                hintText: 'Enter your City'),
          );
        },
      );

  Widget _countryInput() => BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              key: const Key('address_proof_country_input'),
              labelText: 'Country',
              hintText: 'Enter your Country',
              onChanged: (country) => context
                  .read<AddressProofBloc>()
                  .add(AddressProofCountryChanged(country)),
            ),
          );
        },
      );

  Widget _mailAddressCheck(ScrollController controller) =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (BuildContext context, state) {
          return Column(
            children: [
              QuestionWidget(
                key: const Key('address_proof_is_same_mailing_address_select'),
                padding: const EdgeInsets.only(top: 10),
                questionText:
                    'My mailing address and residential address is the same',
                options: const ['Yes', 'No'],
                selectedAnswer: state.isSameMailingAddress ? 'Yes' : 'No',
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

  Widget _mailApartmentNumberInput() =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomTextInput(
                key: const Key('address_proof_mailing_unit_number_input'),
                labelText: 'Unit/Apartment No.',
                onChanged: (mailUnitNumber) => context
                    .read<AddressProofBloc>()
                    .add(AddressProofMailUnitNumberChanged(mailUnitNumber)),
                hintText: 'Enter your Unit/Apartment No.'),
          );
        },
      );

  Widget _mailResidentAddressInput() =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
                key: const Key(
                    'address_proof_mailing_residential_address_input'),
                labelText: 'Residential Address',
                onChanged: (mailResidentialAddress) => context
                    .read<AddressProofBloc>()
                    .add(AddressProofMailResidentialAddressChanged(
                        mailResidentialAddress)),
                hintText: 'Enter your Residential Address'),
          );
        },
      );

  Widget _mailCityInput() => BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
                key: const Key('address_proof_mailing_city_input'),
                labelText: 'City',
                onChanged: (mailCity) => context
                    .read<AddressProofBloc>()
                    .add(AddressProofMailCityChanged(mailCity)),
                hintText: 'Enter your City'),
          );
        },
      );

  Widget _mailCountryInput() =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: CustomTextInput(
                key: const Key('address_proof_mailing_country_input'),
                labelText: 'Country',
                onChanged: (mailCountry) => context
                    .read<AddressProofBloc>()
                    .add(AddressProofMailCountryChanged(mailCountry)),
                hintText: 'Enter your Country'),
          );
        },
      );

  bool _validateAddressProofStep(AddressProofState state) {
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
        child: BlocBuilder<AddressProofBloc, AddressProofState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            return CustomTextButton(
                key: const Key('address_proof_next_step_button'),
                // disable: _validateAddressProofStep(state),
                buttonText: 'Next',
                borderRadius: 30,
                onClick: () {
                  // context
                  //     .read<AddressProofBloc>()
                  //     .add(const AccountCurrentStepChanged('next'));
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                });
          },
        ),
      );
}
