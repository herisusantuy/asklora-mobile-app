import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_date_picker.dart';
import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
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

  static const double _spaceHeightDouble = 36;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      progress: progress,
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Personal Info',
      content: GestureDetector(
        onTap: () {
          FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
            focus.focusedChild?.unfocus();
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            CustomTextNew(
              'Please make sure your name is exactly the same as the information on identification document.',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            _textInput(
                initialValue:
                    context.read<BasicInformationBloc>().state.firstName,
                key: const Key('first_name'),
                label: 'English First Name',
                onChanged: (value) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationFirstNameChanged(value))),
            _spaceHeight,
            _textInput(
                initialValue:
                    context.read<BasicInformationBloc>().state.lastName,
                key: const Key('last_name'),
                label: 'English Last Name',
                onChanged: (value) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationLastNameChanged(value))),
            _spaceHeight,
            _selectGender,
            _spaceHeight,
            _nationality,
            _spaceHeight,
            _dateOfBirth,
            _spaceHeight,
            _countryCodeAndPhoneNumber
          ],
        ),
      ),
      bottomButton: _bottomButton,
    );
  }

  Widget get _dateOfBirth =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
        buildWhen: ((previous, current) =>
            previous.dateOfBirth != current.dateOfBirth),
        builder: (context, state) {
          final DateTime dateTimeNow = DateTime.now();
          return CustomDatePicker(
            key: const Key('date_of_birth'),
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
      );

  Widget get _nationality =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
        buildWhen: (previous, current) =>
            previous.countryOfCitizenship != current.countryOfCitizenship,
        builder: (context, state) => CustomCountryPicker(
          key: const Key('nationality'),
          label: 'Nationality',
          initialValue: state.countryNameOfCitizenship,
          onSelect: (Country country) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationCountryOfCitizenshipChanged(
                  country.countryCodeIso3, country.name)),
        ),
      );

  Widget get _countryCodeAndPhoneNumber =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (previous, current) =>
              previous.countryCode != current.countryCode ||
              previous.phoneNumber != current.phoneNumber,
          builder: (context, state) => CustomPhoneNumberInput(
                key: const Key('phone_number'),
                initialValueOfCodeArea: state.countryCode,
                initialValueOfPhoneNumber: state.phoneNumber,
                onChangedCodeArea: (country) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationCountryCodeChanged(country.phoneCode)),
                onChangePhoneNumber: (phoneNumber) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationPhoneNumberChanged(phoneNumber)),
              ));

  Widget get _selectGender =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (previous, current) => previous.gender != current.gender,
          builder: (context, state) => CustomToggleButton(
                onSelected: (value) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationGenderChanged(value)),
                initialValue: state.gender,
                choices: Pair('Male', 'Female'),
              ));

  Widget _textInput(
          {required String initialValue,
          required String label,
          required Function(String) onChanged,
          required Key key}) =>
      MasterTextField(
        key: key,
        initialValue: initialValue,
        textCapitalization: TextCapitalization.words,
        onChanged: onChanged,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        textInputFormatterList: [fullEnglishNameFormatter()],
        textInputType: TextInputType.text,
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
