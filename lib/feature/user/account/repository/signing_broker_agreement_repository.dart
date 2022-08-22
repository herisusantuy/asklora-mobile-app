import 'package:url_launcher/url_launcher.dart';

class SigningBrokerAgreementRepository {
  SigningBrokerAgreementRepository();

  Future<bool> openAlpacaCustomerAgreement(String filePath) async {
    try {
      await launchUrl(Uri.parse(filePath),
          mode: LaunchMode.externalApplication);
      return true;
    } catch (e) {
      return false;
    }
  }
}
