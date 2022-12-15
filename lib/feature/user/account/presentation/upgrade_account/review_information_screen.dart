import 'dart:convert';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/onfido/start_onfido.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../../kyc/domain/onfido_result_request.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/address_proof/bloc/address_proof_bloc.dart';
import '../../bloc/basic_information/bloc/basic_information_bloc.dart';
import '../../bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import '../../bloc/financial_profile/bloc/financial_profile_bloc.dart';
import '../../bloc/review_information/review_information_bloc.dart';
import '../../bloc/risk_disclosure/risk_disclosure_bloc.dart';
import '../../bloc/signing_agreement_tax/signing_agreement_tax_bloc.dart';
import '../../bloc/signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import '../../bloc/trusted_contact/bloc/trusted_contact_bloc.dart';
import 'widgets/upgrade_account_button.dart';

class ReviewInformationScreen extends StatelessWidget {
  const ReviewInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) async {
        if (state is OnfidoSdkToken) {
          try {
            await startOnfido(state.token).then((value) => context
                .read<AccountBloc>()
                .add(UpdateOnfidoResult(
                    Reason.userCompleted.value, 'Onfido SDK', state.token)));
          } on PlatformException {
            context.read<AccountBloc>().add(UpdateOnfidoResult(
                Reason.userExited.value, 'Onfido SDK', state.token));
          } catch (e) {
            context.read<AccountBloc>().add(UpdateOnfidoResult(
                Reason.sdkError.value, 'Onfido SDK', state.token));
          }
        } else if (state is OnfidoResultUpdated) {
          SignInSuccessScreen.openAndRemoveAllRoute(context);
        } else {
          switch (state.status) {
            case AccountStatus.failure:
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: CustomText(
                      state.responseMessage,
                    )));
              break;
            case AccountStatus.success:
              context.read<AccountBloc>().add(GetSdkToken());
              break;
            default:
              break;
          }
        }
      },
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _basicInformation(),
                _countryOfTaxResidence(),
                _addressProof(),
                _financialProfile(),
                _disclosuresAffiliations(),
                _signingTaskAgreement(),
                _signingBrokerAgreement(),
                _trustedContact(),
                _riskDisclosure(),
              ],
            ),
          )),
          _reviewInformationAgreement(),
          _submitButton(context)
        ],
      ),
    );
  }

  Widget _basicInformation() => Padding(
        key: const Key('basic_information'),
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Basic Information'),
                  children: [
                    _customCard('First Name', state.firstName),
                    _customCard('Middle Name', state.middleName ?? ''),
                    _customCard('Last Name', state.lastName),
                    _customCard('Chinese Name', state.chineseName ?? ''),
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
        key: const Key('address_proof'),
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
        key: const Key('financial_profile'),
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
                        'Employment Status', state.employmentStatus.name),
                  ],
                )),
      );

  Widget _disclosuresAffiliations() => Padding(
        key: const Key('disclosure_affiliations'),
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
        key: const Key('signing_agreement'),
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

  Widget _signingBrokerAgreement() => Padding(
        key: const Key('signing_broker_agreement'),
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<SigningBrokerAgreementBloc,
                SigningBrokerAgreementState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Signing Broker Agreement'),
                  children: [
                    CustomCheckbox(
                      padding: const EdgeInsets.only(top: 10),
                      text:
                          'I have read, understood, and agree to be bound by Alpaca Securities LLC and LORA Technologies, Limited account terms, and all other terms, disclosures and disclaimers applicable to me, as referenced in the Alpaca Customer Agreement. I also acknowledge that the Alpaca Customer Agreement contains a pre-dispute arbitration clause in Section 42.',
                      disabled: true,
                      isChecked: state.isUnderstoodAlpacaCustomAgreementChecked,
                      onChanged: (_) {},
                    ),
                    _spaceHeight(),
                    CustomCheckbox(
                        padding: const EdgeInsets.only(top: 10),
                        text:
                            'I understand I am signing this agreement electronically, and that my electronic signature will have the same effect as physically signing and returning the Application Agreement.',
                        disabled: true,
                        isChecked: state.isSigningAgreementChecked,
                        onChanged: (_) {}),
                    _spaceHeight(),
                    if (state.customerSignature.isEmpty)
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                              base64Decode(state.customerSignature),
                              height: 200)),
                  ],
                )),
      );

  Widget _trustedContact() => Padding(
        key: const Key('trusted_contract'),
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<TrustedContactBloc, TrustedContactState>(
            builder: (context, state) => ExpansionTile(
                  title: const CustomText('Trusted Contact'),
                  children: [
                    _customCard('First Name', state.firstName),
                    _customCard('Last Name', state.lastName),
                    _customCard('Email Address', state.emailAddress),
                    _customCard('Phone Number', state.phoneNumber),
                  ],
                )),
      );

  Widget _riskDisclosure() => Padding(
        key: const Key('risk_disclosure'),
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

  Widget _countryOfTaxResidence() => Padding(
        key: const Key('country_of_tax_residence'),
        padding: const EdgeInsets.only(bottom: 10),
        child:
            BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
                builder: (context, state) => ExpansionTile(
                      title: const CustomText('Country of Tax Residence'),
                      children: [
                        _customCard(
                            'Tax Residence', state.countryNameOfTaxResidence),
                        _customCard('Country of Tax Residence',
                            state.countryOfTaxResidence),
                        _customCard('TIN Number', state.tinNumber),
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

  Widget _reviewInformationAgreement() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: BlocBuilder<ReviewInformationBloc, BaseResponse<bool>>(
          builder: (context, state) => CustomCheckbox(
            checkboxKey: const Key('review_information_checkbox'),
            onChanged: (value) => context
                .read<ReviewInformationBloc>()
                .add(ReviewInformationAgreementChanged(value!)),
            isChecked: state.data!,
            text:
                'Given I am with all the information that I already filled in the previous page',
          ),
        ),
      );

  Widget _submitButton(BuildContext context) =>
      BlocBuilder<ReviewInformationBloc, BaseResponse<bool>>(
          builder: (context, stateReviewInformation) =>
              BlocBuilder<AccountBloc, AccountState>(
                  buildWhen: (prev, current) => prev.status != current.status,
                  builder: (context, state) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: UpgradeAccountButton(
                            key: const Key('submit_button'),
                            isLoading:
                                state.status == AccountStatus.upgradingAccount,
                            disable: !stateReviewInformation.data!,
                            onClick: () async => context
                                .read<AccountBloc>()
                                .add(UpgradeAccount(await Ipify.ipv4()))),
                      )));

  SizedBox _spaceHeight() => const SizedBox(
        height: 10,
      );
}
