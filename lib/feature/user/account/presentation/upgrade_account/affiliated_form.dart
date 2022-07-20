import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_input.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';

class AffiliateForm extends StatelessWidget {
  const AffiliateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _affiliateCompanyNameInput(context),
        _affiliateCompanyAddressInput(context),
        _affiliateCompanyCityInput(context),
        _affiliateCompanyStateInput(context),
        _affiliateCompanyCountryInput(context),
        _affiliateCompanyEmailInput(context),
      ],
    );
  }

  Widget _affiliateCompanyNameInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomTextInput(
          key: const Key('affiliate_company_name_input'),
          labelText: 'Company Name',
          onChanged: (value) => context
              .read<DisclosureAffiliationBloc>()
              .add(AffiliateCompanyNameChanged(value)),
          hintText: 'Enter Company Name'),
    );
  }

  Widget _affiliateCompanyAddressInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('affiliate_company_address_input'),
          labelText: 'Company Street Address',
          onChanged: (value) => context
              .read<DisclosureAffiliationBloc>()
              .add(AffiliateCompanyAddressChanged(value)),
          hintText: 'Enter Company Street Address'),
    );
  }

  Widget _affiliateCompanyCityInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('affiliate_company_city_input'),
          labelText: 'Company City',
          onChanged: (value) => context
              .read<DisclosureAffiliationBloc>()
              .add(AffiliateCompanyCityChanged(value)),
          hintText: 'Enter Company City'),
    );
  }

  Widget _affiliateCompanyStateInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('affiliate_company_state_input'),
          labelText: 'Company State',
          onChanged: (value) => context
              .read<DisclosureAffiliationBloc>()
              .add(AffiliateCompanyStateChanged(value)),
          hintText: 'Enter Company State'),
    );
  }

  Widget _affiliateCompanyCountryInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('affiliate_company_country_input'),
          labelText: 'Company Country',
          onChanged: (value) => context
              .read<DisclosureAffiliationBloc>()
              .add(AffiliateCompanyCountryChanged(value)),
          hintText: 'Enter Company Country'),
    );
  }

  Widget _affiliateCompanyEmailInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('affiliate_company_email_input'),
          labelText: 'Company Compliance Email',
          onChanged: (value) => context
              .read<DisclosureAffiliationBloc>()
              .add(AffiliateCompanyEmailChanged(value)),
          hintText: 'Enter Company Compliance Email'),
    );
  }
}
