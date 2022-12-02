import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/basic_information/basic_information_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';

class ResidentCheckScreen extends StatelessWidget {
  final double progress;

  const ResidentCheckScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BasicInformationBloc, BasicInformationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == ResponseState.error) {
          context
              .read<NavigationBloc<KycPageStep>>()
              .add(const PageChanged(KycPageStep.personalInfoRejected));
        } else if (state.status == ResponseState.success) {
          context
              .read<NavigationBloc<KycPageStep>>()
              .add(const PageChanged(KycPageStep.basicInformation));
        }
      },
      child: KycBaseForm(
        onTapBack: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        title: 'Set Up Personal Info',
        content: SingleChildScrollView(
          child: Column(
            children: [_isUnitedStatesResident, _isHongKongResident],
          ),
        ),
        bottomButton: _bottomButton,
        progress: progress,
      ),
    );
  }

  Widget get _isUnitedStatesResident => BlocBuilder<BasicInformationBloc,
          BasicInformationState>(
    key: const Key('is_united_states_resident'),
      buildWhen: (previous, current) =>
          previous.isUnitedStateResident != current.isUnitedStateResident,
      builder: (context, state) => CustomToggleButton(
            title:
                'Are you a United States tax resident, green card holder or citizens ?',
            onSelected: (value) => context.read<BasicInformationBloc>().add(
                BasicInformationIsUnitedStateResidentChanged(value == 'Yes')),
            initialValue: state.isUnitedStateResident != null
                ? state.isUnitedStateResident!
                    ? 'Yes'
                    : 'No'
                : null,
            choices: Pair('Yes', 'No'),
            padding: const EdgeInsets.only(top: 38, left: 14, right: 14),
          ));

  Widget get _isHongKongResident =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          key: const Key('is_hong_kong_resident'),
          buildWhen: (previous, current) =>
              previous.isHongKongPermanentResident !=
              current.isHongKongPermanentResident,
          builder: (context, state) => CustomToggleButton(
                title: 'Are you a Hong Kong citizen or resident ?',
                onSelected: (value) => context.read<BasicInformationBloc>().add(
                    BasicInformationIsHongKongPermanentResidentChanged(
                        value == 'Yes')),
                initialValue: state.isHongKongPermanentResident != null
                    ? state.isHongKongPermanentResident!
                        ? 'Yes'
                        : 'No'
                    : null,
                padding: const EdgeInsets.only(top: 38, left: 14, right: 14),
                choices: Pair('Yes', 'No'),
              ));

  Widget get _bottomButton =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (previous, current) =>
              previous.isHongKongPermanentResident !=
                  current.isHongKongPermanentResident ||
              previous.isUnitedStateResident != current.isUnitedStateResident,
          builder: (context, state) => KycButtonPair(
                disablePrimaryButton: state.isUnitedStateResident == null ||
                    state.isHongKongPermanentResident == null,
                primaryButtonOnClick: () => context
                    .read<BasicInformationBloc>()
                    .add(const BasicInformationNext()),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                primaryButtonLabel: 'NEXT',
                secondaryButtonLabel: 'SAVE FOR LATER',
              ));
}
