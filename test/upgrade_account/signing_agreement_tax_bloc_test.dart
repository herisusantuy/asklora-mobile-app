import 'package:asklora_mobile_app/feature/user/account/bloc/signing_agreement_tax/signing_agreement_tax_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('*Signing Agreement Tax Bloc Test*', () {
    late SigningAgreementTaxBloc signingAgreementTaxBloc;

    setUp(() async {
      signingAgreementTaxBloc = SigningAgreementTaxBloc();
    });

    test('init state data should be "false"', () {
      expect(
          signingAgreementTaxBloc.state,
          const SigningAgreementTaxState(
            isCheckedCertify: false,
            isCheckedDeclare: false,
            isFormW8BenOpened: false,
          ));
    });

    blocTest<SigningAgreementTaxBloc, SigningAgreementTaxState>(
        'emits "isCheckedCertify = true" WHEN checked first checkbox',
        build: () => signingAgreementTaxBloc,
        act: (bloc) => {
              bloc.add(const CertifyNotUsCitizenChecked(true)),
            },
        expect: () => {
              const SigningAgreementTaxState(
                isCheckedCertify: true,
                isCheckedDeclare: false,
                isFormW8BenOpened: false,
              )
            });
    blocTest<SigningAgreementTaxBloc, SigningAgreementTaxState>(
        'emits "isCheckedDeclare = true" WHEN checked second checkbox',
        build: () => signingAgreementTaxBloc,
        act: (bloc) => {
              bloc.add(const DeclareCorrectInformationChecked(true)),
            },
        expect: () => {
              const SigningAgreementTaxState(
                isCheckedCertify: false,
                isCheckedDeclare: true,
                isFormW8BenOpened: false,
              )
            });
    blocTest<SigningAgreementTaxBloc, SigningAgreementTaxState>(
        'emits "isFormW8BenOpened = true" WHEN clicked button "US TAX Form W-8BEN"',
        build: () => signingAgreementTaxBloc,
        act: (bloc) => {
              bloc.add(const FormW8BenOpened(true)),
            },
        expect: () => {
              const SigningAgreementTaxState(
                isCheckedCertify: false,
                isCheckedDeclare: false,
                isFormW8BenOpened: true,
              )
            });
    blocTest<SigningAgreementTaxBloc, SigningAgreementTaxState>(
        'emits "isCheckedCertify && isFormW8BenOpened = true"',
        build: () => signingAgreementTaxBloc,
        act: (bloc) => {
              bloc.add(const CertifyNotUsCitizenChecked(true)),
              bloc.add(const FormW8BenOpened(true)),
            },
        expect: () => {
              const SigningAgreementTaxState(
                isCheckedCertify: true,
                isCheckedDeclare: false,
                isFormW8BenOpened: false,
              ),
              const SigningAgreementTaxState(
                isCheckedCertify: true,
                isCheckedDeclare: false,
                isFormW8BenOpened: true,
              ),
            });
    blocTest<SigningAgreementTaxBloc, SigningAgreementTaxState>(
        'emits "isCheckedCertify && isFormW8BenOpened && isCheckedDeclare = true"',
        build: () => signingAgreementTaxBloc,
        act: (bloc) => {
              bloc.add(const CertifyNotUsCitizenChecked(true)),
              bloc.add(const FormW8BenOpened(true)),
              bloc.add(const DeclareCorrectInformationChecked(true)),
            },
        expect: () => {
              const SigningAgreementTaxState(
                isCheckedCertify: true,
                isCheckedDeclare: false,
                isFormW8BenOpened: false,
              ),
              const SigningAgreementTaxState(
                isCheckedCertify: true,
                isCheckedDeclare: false,
                isFormW8BenOpened: true,
              ),
              const SigningAgreementTaxState(
                isCheckedCertify: true,
                isCheckedDeclare: true,
                isFormW8BenOpened: true,
              ),
            });

    tearDown(() => signingAgreementTaxBloc.close());
  });
}
