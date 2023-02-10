import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/source_of_wealth/source_of_wealth_bloc.dart';
import '../../utils/source_of_wealth_enum.dart';
import '../widgets/kyc_base_form.dart';
import 'widgets/number_counter_input.dart';

class FinancialProfileSourceOfWealthScreen extends StatelessWidget {
  final double progress;

  const FinancialProfileSourceOfWealthScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      key: const Key('financial_profile_source_of_wealth'),
      progress: progress,
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            'Source Of Wealth',
            style: AskLoraTextStyles.h4,
          ),
          const SizedBox(height: 23),
          CustomTextNew(
            'Please select all sources of wealth and declare the percentages of each. Please put 0% in the sources of wealth that you won’t invest with Asklora',
            style: AskLoraTextStyles.body1,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: BlocBuilder<SourceOfWealthBloc, SourceOfWealthState>(
              buildWhen: (previous, current) =>
                  previous.totalOfSourceOFWealthAmount !=
                  current.totalOfSourceOFWealthAmount,
              builder: (context, state) {
                return CustomTextNew(
                  '${state.totalOfSourceOFWealthAmount}%',
                  style: AskLoraTextStyles.h1,
                );
              },
            ),
          ),
          ...SourceOfWealthType.values
              .map(
                (source) =>
                    BlocBuilder<SourceOfWealthBloc, SourceOfWealthState>(
                  buildWhen: (previous, current) =>
                      previous.sourceOfWealthAnswers !=
                      current.sourceOfWealthAnswers,
                  builder: (context, state) {
                    SourceOfWealthModel? sourceOfWealthModel =
                        state.sourceOfWealthAnswers.firstWhereOrNull(
                            (type) => type.sourceOfWealthType == source);

                    return Column(
                      children: [
                        NumberCounterInput(
                          key: Key(source.name),
                          label: source.value,
                          initialValue: sourceOfWealthModel != null
                              ? sourceOfWealthModel.amount.toString()
                              : '0',
                          active: sourceOfWealthModel != null,
                          onTap: () => context
                              .read<SourceOfWealthBloc>()
                              .add(SourceOfWealthSelected(source)),
                          onAmountChanged: (value) => context
                              .read<SourceOfWealthBloc>()
                              .add(SourceOfWealthAmountChanged(
                                  value!.isNotEmpty ? value : '0', source)),
                        ),
                        if (sourceOfWealthModel != null &&
                            (source == SourceOfWealthType.other))
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: MasterTextField(
                              maxLine: 2,
                              hintText:
                                  'Use this space to provide more detailed information',
                              onChanged: (value) {
                                context.read<SourceOfWealthBloc>().add(
                                    SourceOfWealthOtherIncomeChanged(
                                        source, value));
                              },
                            ),
                          ),
                      ],
                    );
                  },
                ),
              )
              .toList(),
        ],
      ),
      bottomButton: BlocBuilder<SourceOfWealthBloc, SourceOfWealthState>(
        buildWhen: (previous, current) =>
            previous.enableNextButton() != current.enableNextButton() ||
            previous.totalOfSourceOFWealthAmount !=
                current.totalOfSourceOFWealthAmount,
        builder: (context, state) {
          return ButtonPair(
              disablePrimaryButton: state.enableNextButton(),
              primaryButtonOnClick: () {
                print('total>> ${state.totalOfSourceOFWealthAmount}');
                if (state.totalOfSourceOFWealthAmount == 100) {
                  context.read<NavigationBloc<KycPageStep>>().add(
                      const PageChanged(KycPageStep.financialProfileSummary));
                } else {
                  CustomInAppNotification.show(
                      context, 'Your sources of wealth must add up to 100%');
                }
              },
              secondaryButtonOnClick: () => CarouselScreen.open(context),
              primaryButtonLabel: 'NEXT',
              secondaryButtonLabel: 'SAFE FOR LATER');
        },
      ),
    );
  }
}
