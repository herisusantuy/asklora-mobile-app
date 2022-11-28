import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../../bloc/kyc_bloc.dart';
import '../../widgets/kyc_button_pair.dart';
import 'disclosure_affiliation_base_input_screen.dart';

class DisclosureAffiliationAssociatesInputScreen extends StatelessWidget {
  final double progress;

  const DisclosureAffiliationAssociatesInputScreen(
      {required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => DisclosureAffiliationBaseInputScreen(
      progress: progress,
      onFirstNameChanged: (value) => context
          .read<DisclosureAffiliationBloc>()
          .add(AffiliateAssociatesFirstNameChanged(value)),
      onLastNameChanged: (value) => context
          .read<DisclosureAffiliationBloc>()
          .add(AffiliateAssociatesLastNameChanged(value)),
      bottomButton: _bottomButton);

  Widget get _bottomButton =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
          buildWhen: (previous, current) =>
              previous.affiliatedAssociatesFirstName !=
                  current.affiliatedAssociatesFirstName ||
              previous.affiliatedAssociatesLastName !=
                  current.affiliatedAssociatesLastName,
          builder: (context, state) => KycButtonPair(
                disablePrimaryButton:
                    state.affiliatedAssociatesFirstName.isEmpty ||
                        state.affiliatedAssociatesLastName.isEmpty,
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(
                        KycPageStep.disclosureAffiliationCommissions)),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                primaryButtonLabel: 'NEXT',
                secondaryButtonLabel: 'SAVE FOR LATER',
              ));
}
