import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_date_picker.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../core/utils/formatters/upper_case_text_formatter.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/personal_info/personal_info_bloc.dart';
import '../../domain/upgrade_account/personal_info_request.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';

class PersonalInfoScreen extends StatelessWidget {
  final double progress;

  const PersonalInfoScreen({required this.progress, Key? key})
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
        child: Column(
          children: [
            CustomTextNew(
              'Please make sure your name is exactly the same as the information on identification document.',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            _textInput(
                initialValue: context.read<PersonalInfoBloc>().state.firstName,
                key: const Key('first_name'),
                label: 'Legal English First Name',
                onChanged: (value) => context
                    .read<PersonalInfoBloc>()
                    .add(PersonalInfoFirstNameChanged(value))),
            _spaceHeight,
            _textInput(
                initialValue: context.read<PersonalInfoBloc>().state.lastName,
                key: const Key('last_name'),
                label: 'Legal English Last Name',
                onChanged: (value) => context
                    .read<PersonalInfoBloc>()
                    .add(PersonalInfoLastNameChanged(value))),
            _spaceHeight,
            _selectGender,
            _spaceHeight,
            _hkIdNumberInput,
            _spaceHeight,
            _nationality,
            _spaceHeight,
            _dateOfBirth,
            _spaceHeight,
            _countryOfBirth,
            _spaceHeight,
            _countryCodeAndPhoneNumber
          ],
        ),
      ),
      bottomButton: _bottomButton,
    );
  }

  Widget get _dateOfBirth => BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        buildWhen: ((previous, current) =>
            previous.dateOfBirth != current.dateOfBirth),
        builder: (context, state) {
          DateTime dateOfBirth = DateTime.parse(state.dateOfBirth);
          return CustomDatePicker(
            key: const Key('date_of_birth'),
            label: 'Date of Birth',
            selectedDate: dateOfBirth,
            initialDateTime: dateOfBirth,
            maximumDate: DateTime.now(),
            onDateTimeChanged: (date) => context.read<PersonalInfoBloc>().add(
                  PersonalInfoDateOfBirthChanged(date.toString()),
                ),
          );
        },
      );

  Widget get _nationality => BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        buildWhen: (previous, current) =>
            previous.nationalityCode != current.nationalityCode,
        builder: (context, state) => CustomCountryPicker(
          key: const Key('nationality'),
          label: 'Nationality',
          hintText: 'Select Nationality',
          initialValue: state.nationalityName,
          onSelect: (Country country) => context.read<PersonalInfoBloc>().add(
              PersonalInfoNationalityChanged(
                  country.countryCodeIso3, country.name)),
        ),
      );

  Widget get _countryOfBirth =>
      BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        buildWhen: (previous, current) =>
            previous.countryCodeOfBirth != current.countryCodeOfBirth,
        builder: (context, state) => CustomCountryPicker(
          key: const Key('country_of_birth'),
          label: 'Country Of Birth',
          initialValue: state.countryNameOfBirth,
          onSelect: (Country country) => context.read<PersonalInfoBloc>().add(
              PersonalInfoCountryOfBirthChanged(
                  country.countryCodeIso3, country.name)),
        ),
      );

  Widget get _countryCodeAndPhoneNumber =>
      BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
          buildWhen: (previous, current) =>
              previous.phoneCountryCode != current.phoneCountryCode ||
              previous.phoneNumber != current.phoneNumber,
          builder: (context, state) => CustomPhoneNumberInput(
                key: const Key('phone_number'),
                initialValueOfCodeArea: state.phoneCountryCode,
                initialValueOfPhoneNumber: state.phoneNumber,
                onChangedCodeArea: (country) => context
                    .read<PersonalInfoBloc>()
                    .add(
                        PersonalInfoPhoneCountryCodeChanged(country.phoneCode)),
                onChangePhoneNumber: (phoneNumber) => context
                    .read<PersonalInfoBloc>()
                    .add(PersonalInfoPhoneNumberChanged(phoneNumber)),
              ));

  Widget get _selectGender => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextNew('Gender'),
          const SizedBox(height: 5),
          BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
              buildWhen: (previous, current) =>
                  previous.gender != current.gender,
              builder: (context, state) => CustomToggleButton(
                    onSelected: (value) => context
                        .read<PersonalInfoBloc>()
                        .add(PersonalInfoGenderChanged(value)),
                    initialValue: state.gender,
                    choices: Pair('Male', 'Female'),
                  ))
        ],
      );

  Widget get _hkIdNumberInput =>
      BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        buildWhen: (previous, current) =>
            previous.hkIdNumber != current.hkIdNumber ||
            previous.nationalityName != current.nationalityName,
        builder: (context, state) {
          return MasterTextField(
            key: const Key('hk_id_number'),
            labelText: 'HKID NUmber',
            hintText: 'A1234567',
            initialValue: state.hkIdNumber,
            textCapitalization: TextCapitalization.words,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            textInputFormatterList: [
              lettersAndNumberFormatter(),
              UpperCaseTextFormatter(),
              LengthLimitingTextInputFormatter(9)
            ],
            errorText: state.isHkIdValid || state.hkIdNumber.isEmpty
                ? ''
                : 'Please enter a valid HKID Number',
            textInputType: TextInputType.text,
            onChanged: (value) => context
                .read<PersonalInfoBloc>()
                .add(PersonalInfoHkIdNumberChanged(value)),
          );
        },
      );

  Widget _textInput({
    required String initialValue,
    required String label,
    required Function(String) onChanged,
    required Key key,
    List<TextInputFormatter>? textInputFormatterList,
    String? hintText,
  }) =>
      MasterTextField(
        key: key,
        initialValue: initialValue,
        textCapitalization: TextCapitalization.words,
        onChanged: onChanged,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        textInputFormatterList:
            textInputFormatterList ?? [fullEnglishNameFormatter()],
        textInputType: TextInputType.text,
        hintText: hintText ?? '',
      );

  Widget get _bottomButton => BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      buildWhen: (previous, current) =>
          _disablePrimaryButton(previous) != _disablePrimaryButton(current),
      builder: (context, state) =>
          BlocListener<PersonalInfoBloc, PersonalInfoState>(
            listenWhen: (previous, current) =>
                previous.response.state != current.response.state,
            listener: (context, state) {
              switch (state.response.state) {
                case ResponseState.error:
                  CustomInAppNotification.show(context, state.response.message);
                  break;
                case ResponseState.success:
                  context
                      .read<NavigationBloc<KycPageStep>>()
                      .add(const PageChanged(KycPageStep.otp));
                  break;
                default:
                  break;
              }
            },
            child: ButtonPair(
              disablePrimaryButton: _disablePrimaryButton(state),
              primaryButtonOnClick: () {
                final state = context.read<PersonalInfoBloc>().state;
                context
                    .read<PersonalInfoBloc>()
                    .add(PersonalInfoSubmitted(PersonalInfoRequest(
                      firstName: state.firstName,
                      lastName: state.lastName,
                      gender: state.gender,
                      hkIdNumber: state.hkIdNumber,
                      nationality: context
                          .read<PersonalInfoBloc>()
                          .state
                          .nationalityCode,
                      dateOfBirth: state.dateOfBirth,
                      countryOfBirth: context
                          .read<PersonalInfoBloc>()
                          .state
                          .countryCodeOfBirth,
                      phoneCountryCode: context
                          .read<PersonalInfoBloc>()
                          .state
                          .phoneCountryCode,
                      phoneNumber: state.phoneNumber,
                    )));
              },
              secondaryButtonOnClick: () => CarouselScreen.open(context),
              primaryButtonLabel: 'NEXT',
              secondaryButtonLabel: 'SAVE FOR LATER',
            ),
          ));

  bool _disablePrimaryButton(PersonalInfoState state) {
    if (state.firstName.isEmpty ||
        state.lastName.isEmpty ||
        state.gender.isEmpty ||
        state.nationalityName.isEmpty ||
        state.dateOfBirth.isEmpty ||
        state.phoneCountryCode.isEmpty ||
        state.phoneNumber.isEmpty ||
        state.countryNameOfBirth.isEmpty ||
        !state.isHkIdValid) {
      return true;
    } else {
      return false;
    }
  }
}
