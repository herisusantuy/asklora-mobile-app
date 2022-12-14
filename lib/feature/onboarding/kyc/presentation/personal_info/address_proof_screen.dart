import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_image_picker.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/address_proof/address_proof_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';

class AddressProofScreen extends StatelessWidget {
  final double progress;

  const AddressProofScreen({required this.progress, Key? key})
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
      content: Listener(
        onPointerDown: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            CustomTextNew(
              'Please provide your permanent residential address.',
              key: const Key('sub_title'),
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _textInput(
              key: const Key('address_line_1'),
              label: 'Address Line 1',
              onChanged: (value) => context
                  .read<AddressProofBloc>()
                  .add(AddressLine1Changed(value)),
              hintText: 'Address Line 1',
            ),
            _spaceHeight,
            _textInput(
              key: const Key('address_line_2'),
              label: 'Address Line 2',
              onChanged: (value) => context
                  .read<AddressProofBloc>()
                  .add(AddressLine2Changed(value)),
              hintText: 'Address Line 2',
            ),
            _spaceHeight,
            _district,
            _spaceHeight,
            _region,
            _spaceHeight,
            _addressImageProof
          ],
        ),
      ),
      bottomButton: _bottomButton,
    );
  }

  Widget get _addressImageProof =>
      BlocBuilder<AddressProofBloc, AddressProofState>(
          buildWhen: (previous, current) =>
              previous.addressProofImages != current.addressProofImages,
          builder: (context, state) => CustomImagePicker(
                key: const Key('address_proof_image_picker'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                title: 'Upload Address Proof',
                initialValue: state.addressProofImages,
                additionalText:
                    'Address Proof can be lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                onImageDeleted: (image) =>
                    context.read<AddressProofBloc>().add(ImageDeleted(image)),
                onImagePicked: (images) =>
                    context.read<AddressProofBloc>().add(ImagesChanged(images)),
              ));

  final districts = const ['Southern', 'Western', 'Eastern', 'Northern'];
  final region = const ['Hong Kong Island'];

  Widget get _district => BlocBuilder<AddressProofBloc, AddressProofState>(
      builder: (context, state) => CustomDropdown(
          key: const Key('district_picker'),
          padding: const EdgeInsets.only(top: 10),
          isDense: false,
          label: 'District',
          hintName: 'District',
          value: state.district,
          itemsList: districts,
          border: const OutlineInputBorder(),
          onChanged: (value) => context
              .read<AddressProofBloc>()
              .add(DistrictChanged(value ?? ''))));

  Widget get _region => BlocBuilder<AddressProofBloc, AddressProofState>(
      builder: (context, state) => CustomDropdown(
          key: const Key('region_picker'),
          padding: const EdgeInsets.only(top: 10),
          isDense: false,
          label: 'Region',
          hintName: 'Region',
          value: state.region,
          itemsList: region,
          border: const OutlineInputBorder(),
          onChanged: (value) => context
              .read<AddressProofBloc>()
              .add(RegionChanged(value ?? ''))));

  Widget _textInput(
          {required String label,
          required Function(String) onChanged,
          String hintText = '',
          required Key key}) =>
      CustomTextInput(
        key: key,
        onChanged: onChanged,
        labelText: label,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      );

  Widget get _bottomButton => BlocBuilder<AddressProofBloc, AddressProofState>(
      buildWhen: (previous, current) =>
          previous.enableNextButton() != current.enableNextButton(),
      builder: (context, state) => KycButtonPair(
            disablePrimaryButton: !state.enableNextButton(),
            primaryButtonOnClick: () => context
                .read<NavigationBloc<KycPageStep>>()
                .add(const PageChanged(KycPageStep.personalInfoSummary)),
            secondaryButtonOnClick: () => CarouselScreen.open(context),
            primaryButtonLabel: 'NEXT',
            secondaryButtonLabel: 'SAVE FOR LATER',
          ));
}
