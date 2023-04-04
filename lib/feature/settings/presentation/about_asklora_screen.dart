import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/domain/endpoints.dart';
import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_expanded_row.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/utils/utils.dart';
import '../../../generated/l10n.dart';
import '../widget/menu_button.dart';
import 'privacy_policy_screen.dart';
import 'terms_condition_screen.dart';

class AboutAskloraScreen extends StatelessWidget {
  static const route = '/about_asklora_screen';
  const AboutAskloraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomStretchedLayout(
        contentPadding: const EdgeInsets.only(top: 0, bottom: 43),
        header: CustomHeader(title: S.of(context).aboutAsklora),
        content: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 1),
              const SizedBox(height: 20),
              const Center(
                  child:
                      SizedBox(width: 210, height: 100, child: Placeholder())),
              _getAppVersion(),
              const SizedBox(height: 48),
              GestureDetector(
                onTap: () =>
                    openUrl(askloraSite, mode: LaunchMode.externalApplication),
                child: CustomExpandedRow(
                  S.of(context).website,
                  flex2: 2,
                  text: askloraSite,
                ),
              ),
              const SizedBox(height: 20),
              MenuButtonWidget(
                  onTap: () => PrivacyPolicyScreen.open(context),
                  title: S.of(context).privacyPolicy),
              MenuButtonWidget(
                  onTap: () => TermsAndConditionScreen.open(context),
                  title: S.of(context).termsAndConditions),
            ],
          ),
        ),
        bottomButton: _contactUsButton,
      ),
    );
  }

  Widget _getAppVersion() => FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23.5),
                  child: CustomTextNew(
                    'Asklora Version ${snapshot.data!.version} ${snapshot.data!.buildNumber}',
                    style: AskLoraTextStyles.body1,
                  ),
                ),
              );
            default:
              return const SizedBox();
          }
        },
      );

  Widget get _contactUsButton => Builder(builder: (context) {
        return PrimaryButton(
            label: S.of(context).contactUs,
            onTap: () =>
                openUrl(mailToLoraCare, mode: LaunchMode.externalApplication));
      });

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
