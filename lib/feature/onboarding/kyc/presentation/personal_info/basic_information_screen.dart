import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_date_picker.dart';
import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/basic_information/basic_information_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';

class BasicInformationScreen extends StatelessWidget {
  final double progress;

  const BasicInformationScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      progress: progress,
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Personal Info',
      content: Listener(
        onPointerDown: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            const CustomText(
              'Please make sure your name is exactly the same as the information on identification document.',
              type: FontType.smallText,
              padding: AppValues.screenHorizontalPadding,
            ),
            _textInput(
                label: 'English First Name',
                onChanged: (value) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationFirstNameChanged(value)),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 38)),
            _textInput(
                label: 'English Last Name',
                onChanged: (value) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationLastNameChanged(value)),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 28)),
            _selectGender,
            _nationality,
            _dateOfBirth,
            _countryCodeAndPhoneNumber
          ],
        ),
      ),
      bottomButton: _bottomButton,
    );
  }

  Widget get _dateOfBirth => Padding(
        padding: AppValues.screenHorizontalPadding.copyWith(top: 12),
        child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: ((previous, current) =>
              previous.dateOfBirth != current.dateOfBirth),
          builder: (context, state) {
            final DateTime dateTimeNow = DateTime.now();
            return CustomDatePicker(
              key: const Key('account_date_of_birth_picker'),
              padding: const EdgeInsets.only(top: 10),
              label: 'Date of Birth',
              selectedDate: DateTime.parse(state.dateOfBirth),
              initialDateTime: dateTimeNow,
              maximumDate: dateTimeNow,
              onDateTimeChanged: (date) =>
                  context.read<BasicInformationBloc>().add(
                        BasicInformationDateOfBirthChanged(date.toString()),
                      ),
            );
          },
        ),
      );

  Widget get _nationality => Padding(
      padding: AppValues.screenHorizontalPadding.copyWith(top: 28),
      child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
        buildWhen: (previous, current) =>
            previous.countryOfCitizenship != current.countryOfCitizenship,
        builder: (context, state) => CustomCountryPicker(
          height: 46,
          key: const Key('account_country_of_citizenship_input'),
          title: 'Nationality',
          initialValue: state.countryNameOfCitizenship,
          onSelect: (Country country) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationCountryOfCitizenshipChanged(
                  country.countryCodeIso3, country.name)),
        ),
      ));

  Widget get _countryCodeAndPhoneNumber => Padding(
        padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
        child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
            buildWhen: (previous, current) =>
                previous.countryCode != current.countryCode ||
                previous.phoneNumber != current.phoneNumber,
            builder: (context, state) => CustomPhoneNumberInput(
                  key: const Key('account_country_code_phone_number_input'),
                  initialValueOfCodeArea: state.countryCode,
                  initialValueOfPhoneNumber: state.phoneNumber,
                  onChangedCodeArea: (country) => context
                      .read<BasicInformationBloc>()
                      .add(BasicInformationCountryCodeChanged(
                          country.phoneCode)),
                  onChangePhoneNumber: (phoneNumber) => context
                      .read<BasicInformationBloc>()
                      .add(BasicInformationPhoneNumberChanged(phoneNumber)),
                )),
      );

  Widget get _selectGender =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (previous, current) => previous.gender != current.gender,
          builder: (context, state) => CustomToggleButton(
                onSelected: (value) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationGenderChanged(value)),
                initialValue: state.gender,
                padding: AppValues.screenHorizontalPadding.copyWith(top: 28),
                choices: Pair('Male', 'Female'),
              ));

  Widget _textInput(
          {required String label,
          EdgeInsets padding = EdgeInsets.zero,
          required Function(String) onChanged}) =>
      Padding(
        padding: padding,
        child: CustomTextInput(
          textCapitalization: TextCapitalization.words,
          onChanged: onChanged,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          textInputFormatterList: [fullEnglishNameFormatter()],
          textInputType: TextInputType.text,
        ),
      );

  Widget get _bottomButton =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (previous, current) =>
              _disablePrimaryButton(previous) != _disablePrimaryButton(current),
          builder: (context, state) => KycButtonPair(
                disablePrimaryButton: _disablePrimaryButton(state),
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(KycPageStep.otp)),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                primaryButtonLabel: 'NEXT',
                secondaryButtonLabel: 'SAVE FOR LATER',
              ));

  bool _disablePrimaryButton(BasicInformationState state) {
    if (state.firstName.isEmpty ||
        state.lastName.isEmpty ||
        state.gender.isEmpty ||
        state.countryNameOfCitizenship.isEmpty ||
        state.dateOfBirth.isEmpty ||
        state.countryCode.isEmpty ||
        state.phoneNumber.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
