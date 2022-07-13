import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/address_proof/bloc/address_proof_bloc.dart';
import '../../bloc/basic_information/bloc/basic_information_bloc.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import '../../bloc/financial_profile/bloc/financial_profile_bloc.dart';
import '../../bloc/risk_disclosure/risk_disclosure_bloc.dart';
import '../../bloc/signing_agreement_tax/signing_agreement_tax_bloc.dart';

class ReviewInformationScreen extends StatelessWidget {
  final PageController controller;

  const ReviewInformationScreen({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _basicInformation(),
              _addressProof(),
              _financialProfile(),
              _disclosuresAffiliations(),
              _signingTaskAgreement(),
              _riskDisclosure()
            ],
          ),
        )),
        _nextButton()
      ],
    );
  }

  Widget _basicInformation() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Basic Information'),
                  children: [
                    _customCard('First Name', state.firstName),
                    _customCard('Middle Name', state.middleName),
                    _customCard('Last Name', state.lastName),
                    _customCard('Chinese Name', state.chineseName),
                    _customCard('Gender', state.gender),
                    _customCard('Date of Birth', state.dateOfBirth),
                    _customCard('Phone Number',
                        '${state.countryCode}${state.phoneNumber}'),
                    _customCard(
                        'Country of Citizenship', state.countryOfCitizenship),
                    _customCard('Hongkong Permanent Resident',
                        _stringOfYesOrNo(state.isHongKongPermanentResident)),
                    _customCard('US Resident Check',
                        _stringOfYesOrNo(state.isUnitedStateResident)),
                  ],
                )),
      );

  Widget _addressProof() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<AddressProofBloc, AddressProofState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Address Proof'),
                  children: [
                    _customCard('Unit/Apartment No.', state.unitNumber),
                    _customCard(
                        'Residential Address', state.residentialAddress),
                    _customCard('City', state.city),
                    _customCard('Country', state.country),
                    _customCard('Same Mailing Address and Residential Address',
                        _stringOfYesOrNo(state.isSameMailingAddress)),
                  ],
                )),
      );

  Widget _financialProfile() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Employment & Financial Profile'),
                  children: [
                    _customCard(
                        'Annual Household Income', state.annualHouseholdIncome),
                    _customCard('Investible Liquid Assets',
                        state.investibleLiquidAssets),
                    _customCard(
                        'Account Funding Source', state.fundingSource.name),
                    _customCard(
                        'Employmen Status', state.employmentStatus.name),
                  ],
                )),
      );

  Widget _disclosuresAffiliations() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child:
            BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
                builder: (context, state) => ExpansionTile(
                      title: const CustomText('Disclosures & Affiliations'),
                      children: [
                        _customCard(
                            'Affiliated or work with a US registered broker-dealer or FINRA?',
                            _stringOfYesOrNo(state.isAffiliated)),
                        _customCard(
                            'Senior executive at or a 10% or greater shareholder of a publicly traded company?',
                            _stringOfYesOrNo(state.isSeniorExecutive)),
                        _customCard('I am a senior political figure',
                            _stringOfYesOrNo(state.isSeniorPolitical)),
                        _customCard(
                            'I am a family member or relative of senior political figure?',
                            _stringOfYesOrNo(state.isFamilyMember)),
                        _customCard(
                            'I am affiliated with any director, officer, or employee of LORA Technologies Limited or its associates?',
                            _stringOfYesOrNo(state.isAssociates)),
                        _customCard(
                            'I am the sole beneficial owner of the account?',
                            _stringOfYesOrNo(state.isOwner)),
                        _customCard(
                            'I am a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission?',
                            _stringOfYesOrNo(state.isEmployee)),
                      ],
                    )),
      );

  Widget _signingTaskAgreement() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<SigningAgreementTaxBloc, SigningAgreementTaxState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Signing Task Agreement'),
                  children: [
                    CustomCheckbox(
                      padding: const EdgeInsets.only(top: 10),
                      text:
                          'I certify that I am not a US citizen, US resident alien or other US person for US tax purposes, and I am submitting the applicable Form W-8 BEN with this form to certify my foreign status and, if applicable, claim tax treaty benefits.',
                      isChecked: state.isCheckedCertify,
                      disabled: true,
                      textAlign: TextAlign.justify,
                      onChanged: (_) {},
                    ),
                    CustomCheckbox(
                      padding: const EdgeInsets.only(top: 10),
                      text:
                          'I declare that I have examined the information on this form and to the best of my knowledge and belief it is true, correct, and complete',
                      isChecked: state.isCheckedDeclare,
                      disabled: true,
                      onChanged: (_) {},
                      textAlign: TextAlign.justify,
                    )
                  ],
                )),
      );

  Widget _riskDisclosure() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<RiskDisclosureBloc, BaseResponse<bool>>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Risk Disclosure'),
                  children: [
                    const CustomText(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
                    _spaceHeight(),
                    CustomCheckbox(
                      onChanged: (_) {},
                      isChecked: state.data!,
                      disabled: true,
                      text: 'Company Disclosure Agreement',
                    ),
                  ],
                )),
      );

  String _stringOfYesOrNo(bool? condition) {
    switch (condition) {
      case true:
        return 'Yes';
      case false:
        return 'No';
      default:
        return '-';
    }
  }

  Widget _customCard(String title, String value) => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title,
              type: FontType.bodyTextBold,
            ),
            CustomText(value),
          ],
        ),
      );

  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextButton(
            borderRadius: 30,
            buttonText: 'Next',
            disable: true,
            onClick: () => controller.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease)),
      );

  SizedBox _spaceHeight() => const SizedBox(
        height: 10,
      );
}
