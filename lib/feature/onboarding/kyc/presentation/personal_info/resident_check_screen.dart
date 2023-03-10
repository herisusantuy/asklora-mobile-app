import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/personal_info/personal_info_bloc.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';

class ResidentCheckScreen extends StatelessWidget {
  final double progress;

  const ResidentCheckScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonalInfoBloc, PersonalInfoState>(
      listenWhen: (previous, current) =>
          previous.response.state != current.response.state,
      listener: (context, state) {
        if (state.response.state == ResponseState.error) {
          context
              .read<NavigationBloc<KycPageStep>>()
              .add(const PageChanged(KycPageStep.personalInfoRejected));
        } else if (state.response.state == ResponseState.success) {
          context
              .read<NavigationBloc<KycPageStep>>()
              .add(const PageChanged(KycPageStep.personalInfo));
        }
      },
      child: KycBaseForm(
        onTapBack: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        title: 'Set Up Personal Info',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            _isUnitedStatesResident,
            const SizedBox(
              height: 38,
            ),
            _isHongKongResident
          ],
        ),
        bottomButton: _bottomButton,
        progress: progress,
      ),
    );
  }

  Widget get _isUnitedStatesResident =>
      BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
          key: const Key('is_united_states_resident'),
          buildWhen: (previous, current) =>
              previous.isUnitedStateResident != current.isUnitedStateResident,
          builder: (context, state) => CustomToggleButton(
                title:
                    'Are you a United States tax resident, green card holder, or citizen?',
                onSelected: (value) => context.read<PersonalInfoBloc>().add(
                    PersonalInfoIsUnitedStateResidentChanged(value == 'Yes')),
                initialValue: state.isUnitedStateResident != null
                    ? state.isUnitedStateResident!
                        ? 'Yes'
                        : 'No'
                    : null,
                choices: const Pair('Yes', 'No'),
              ));

  Widget get _isHongKongResident => BlocBuilder<PersonalInfoBloc,
          PersonalInfoState>(
      key: const Key('is_hong_kong_resident'),
      buildWhen: (previous, current) =>
          previous.isHongKongPermanentResident !=
          current.isHongKongPermanentResident,
      builder: (context, state) => CustomToggleButton(
            title:
                'Are you a Hong Kong resident? By clicking yes, you acknowledge that you are also a Hong Kong tax resident',
            onSelected: (value) => context.read<PersonalInfoBloc>().add(
                PersonalInfoIsHongKongPermanentResidentChanged(value == 'Yes')),
            initialValue: state.isHongKongPermanentResident != null
                ? state.isHongKongPermanentResident!
                    ? 'Yes'
                    : 'No'
                : null,
            choices: const Pair('Yes', 'No'),
          ));

  Widget get _bottomButton => BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
      buildWhen: (previous, current) =>
          previous.isHongKongPermanentResident !=
              current.isHongKongPermanentResident ||
          previous.isUnitedStateResident != current.isUnitedStateResident,
      builder: (context, state) => ButtonPair(
            disablePrimaryButton: state.isUnitedStateResident == null ||
                state.isHongKongPermanentResident == null,
            primaryButtonOnClick: () =>
                context.read<PersonalInfoBloc>().add(const PersonalInfoNext()),
            secondaryButtonOnClick: () =>
                TabsScreen.openAndRemoveAllRoute(context),
            primaryButtonLabel: 'NEXT',
            secondaryButtonLabel: 'SAVE FOR LATER',
          ));
}
