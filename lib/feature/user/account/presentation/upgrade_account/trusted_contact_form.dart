import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/trusted_contact/bloc/trusted_contact_bloc.dart';

class TrustedContactForm extends StatelessWidget {
  final PageController controller;

  const TrustedContactForm({
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _firstNameInput(),
                _lastNameInput(),
                _emailInput(),
                _phoneNumberInput(),
              ],
            ),
          ),
        ),
        _nextButton()
      ],
    );
  }

  Widget _firstNameInput() =>
      BlocBuilder<TrustedContactBloc, TrustedContactState>(
        buildWhen: (previous, current) =>
            previous.firstName != current.firstName,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomTextInput(
              initialValue: state.firstName,
              key: const Key('trusted_contact_first_name_input'),
              labelText: 'First Name',
              hintText: 'Enter First Name',
              errorText: state.firstNameErrorText,
              onChanged: (value) => context
                  .read<TrustedContactBloc>()
                  .add(FirstNameChanged(value)),
            ),
          );
        },
      );

  Widget _lastNameInput() =>
      BlocBuilder<TrustedContactBloc, TrustedContactState>(
        buildWhen: (previous, current) => previous.lastName != current.lastName,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              initialValue: state.lastName,
              key: const Key('trusted_contact_last_name_input'),
              labelText: 'Last Name',
              errorText: state.lastNameErrorText,
              hintText: 'Enter Last Name',
              onChanged: (value) => context
                  .read<TrustedContactBloc>()
                  .add(LastNameChanged(value)),
            ),
          );
        },
      );

  Widget _emailInput() => BlocBuilder<TrustedContactBloc, TrustedContactState>(
        buildWhen: (previous, current) =>
            previous.emailAddress != current.emailAddress,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              initialValue: state.emailAddress,
              key: const Key('trusted_contact_email_address_input'),
              labelText: 'Email Address',
              hintText: 'Enter Email Address',
              errorText: state.emailErrorText,
              textInputType: TextInputType.emailAddress,
              onChanged: (value) => context
                  .read<TrustedContactBloc>()
                  .add(EmailAddressChanged(value)),
            ),
          );
        },
      );

  Widget _phoneNumberInput() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<TrustedContactBloc, TrustedContactState>(
            buildWhen: (previous, current) =>
                previous.countryCode != current.countryCode ||
                previous.phoneNumber != current.phoneNumber,
            builder: (context, state) => CustomPhoneNumberInput(
                  key: const Key('trusted_contact_phone_number_input'),
                  initialValueOfCodeArea: state.countryCode,
                  initialValueOfPhoneNumber: state.phoneNumber,
                  onChangedCodeArea: (country) => context
                      .read<TrustedContactBloc>()
                      .add(CountryCodeChanged(country.phoneCode)),
                  onChangePhoneNumber: (phoneNumber) => context
                      .read<TrustedContactBloc>()
                      .add(PhoneNumberChanged(phoneNumber)),
                )),
      );

  Widget _nextButton() => BlocBuilder<TrustedContactBloc, TrustedContactState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: CustomTextButton(
              key: const Key('trusted_contact_next_button'),
              borderRadius: 30,
              buttonText: 'Next',
              disable: state.disableNextButton(),
              onClick: () {
                FocusManager.instance.primaryFocus?.unfocus();
                context
                    .read<AccountBloc>()
                    .add(const AccountCurrentStepChanged('next'));
                context.read<TrustedContactBloc>().add(
                      const TrustedContactSubmitted(),
                    );
                controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              },
            ),
          );
        },
      );
}
