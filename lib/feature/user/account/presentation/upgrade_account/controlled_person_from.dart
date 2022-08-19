import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';

class ControlledPersonForm extends StatelessWidget {
  const ControlledPersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _controlledPersonCompanyNameInput(context),
        _controlledPersonCompanyAddressInput(context),
        _controlledPersonCompanyCityInput(context),
        _controlledPersonCompanyStateInput(context),
        _controlledPersonCompanyCountryInput(context),
        _controlledPersonCompanyEmailInput(context),
      ],
    );
  }

  Widget _controlledPersonCompanyNameInput(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          buildWhen: (_, __) => false,
          builder: (context, state) => CustomTextInput(
              initialValue: state.controlledPersonCompanyName,
              key: const Key('controlled_person_company_name_input'),
              labelText: 'Company Name',
              onChanged: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(ControlledPersonCompanyNameChanged(value)),
              hintText: 'Enter Company Name'),
        ));
  }

  Widget _controlledPersonCompanyAddressInput(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          buildWhen: (_, __) => false,
          builder: (context, state) => CustomTextInput(
              initialValue: state.controlledPersonCompanyAddress,
              key: const Key('controlled_person_company_address_input'),
              labelText: 'Company Street Address',
              onChanged: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(ControlledPersonCompanyAddressChanged(value)),
              hintText: 'Enter Company Street Address'),
        ));
  }

  Widget _controlledPersonCompanyCityInput(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          buildWhen: (_, __) => false,
          builder: (context, state) => CustomTextInput(
              initialValue: state.controlledPersonCompanyCity,
              key: const Key('controlled_person_company_city_input'),
              labelText: 'Company City',
              onChanged: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(ControlledPersonCompanyCityChanged(value)),
              hintText: 'Enter Company City'),
        ));
  }

  Widget _controlledPersonCompanyStateInput(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          buildWhen: (_, __) => false,
          builder: (context, state) => CustomTextInput(
              initialValue: state.controlledPersonCompanyState,
              key: const Key('controlled_person_company_state_input'),
              labelText: 'Company State',
              onChanged: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(ControlledPersonCompanyStateChanged(value)),
              hintText: 'Enter Company State'),
        ));
  }

  Widget _controlledPersonCompanyCountryInput(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          builder: (context, state) => CustomCountryPicker(
            key: const Key('controlled_person_company_country_input'),
            title: 'Company Country',
            initialValue: state.controlledPersonCompanyCountry,
            onSelect: (Country country) => context
                .read<DisclosureAffiliationBloc>()
                .add(ControlledPersonCompanyCountryChanged(
                    country.countryCodeIso3)),
          ),
        ));
  }

  Widget _controlledPersonCompanyEmailInput(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          buildWhen: (previous, current) =>
              previous.controlledPersonCompanyEmail !=
              current.controlledPersonCompanyEmail,
          builder: (context, state) => CustomTextInput(
              initialValue: state.controlledPersonCompanyEmail,
              key: const Key('controlled_person_company_email_input'),
              labelText: 'Company Compliance Email',
              onChanged: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(ControlledPersonCompanyEmailChanged(value)),
              hintText: 'Enter Company Compliance Email'),
        ));
  }
}
