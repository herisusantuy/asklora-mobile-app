import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_input.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';

class FamilyMemberForm extends StatelessWidget {
  const FamilyMemberForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _firstNameInput(),
        _lastNameInput(),
      ],
    );
  }

  Widget _firstNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.firstNameOfFamilyMember !=
                current.firstNameOfFamilyMember ||
            previous.isFamilyMember != current.isFamilyMember,
        builder: (context, state) {
          return CustomTextInput(
            labelText: 'First Name',
            onChanged: (value) => context
                .read<DisclosureAffiliationBloc>()
                .add(FirstNameOfFamilyMemberChanged(value)),
            hintText: 'Enter First Name',
          );
        },
      ),
    );
  }

  Widget _lastNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.lastNameOfFamilyMember != current.lastNameOfFamilyMember ||
            previous.isFamilyMember != current.isFamilyMember,
        builder: (context, state) {
          return CustomTextInput(
            labelText: 'Last Name',
            onChanged: (value) => context
                .read<DisclosureAffiliationBloc>()
                .add(LastNameOfFamilyMemberChanged(value)),
            hintText: 'Enter Last Name',
          );
        },
      ),
    );
  }
}
