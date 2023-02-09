import 'package:flutter/material.dart';
import '../../widgets/kyc_sub_title.dart';
import '../../widgets/summary_text_info.dart';

class SignAgreementSummaryContent extends StatelessWidget {
  final String title;

  const SignAgreementSummaryContent({Key? key, required this.title})
      : super(key: key);

  static const double _spaceHeightDouble = 20;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KycSubTitle(
            subTitle: title,
          ),
          _spaceHeight,
          const SummaryTextInfo(
              title: 'Asklora Customer Agreement',
              subTitle: '(Agreed & Signed)'),
          _spaceHeight,
          const SummaryTextInfo(
            title: 'Risk Disclosure Statement',
            subTitle: '(Agreed)',
          ),
          _spaceHeight,
          const SummaryTextInfo(title: 'US Tax Form', subTitle: '(Agreed)'),
        ],
      );
}
