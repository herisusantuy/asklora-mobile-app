import 'package:flutter/material.dart';
import '../../../../../../core/values/app_values.dart';
import '../../widgets/kyc_sub_title.dart';
import '../../widgets/summary_text_info.dart';

class SignAgreementSummaryContent extends StatelessWidget {
  final String title;

  const SignAgreementSummaryContent({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KycSubTitle(
            subTitle: title,
            padding: AppValues.screenHorizontalPadding.copyWith(bottom: 6),
          ),
          const SummaryTextInfo(
              title: 'Alpaca Customer Agreement',
              subTitle: '(Agreed & Signed)'),
          const SummaryTextInfo(
              title: 'Asklora Customer Agreement',
              subTitle: '(Agreed & Signed)'),
          const SummaryTextInfo(
            title: 'Risk Disclosure Statement',
            subTitle: '(Agreed)',
          ),
          const SummaryTextInfo(title: 'US Tax Form', subTitle: '(Agreed)'),
        ],
      );
}
