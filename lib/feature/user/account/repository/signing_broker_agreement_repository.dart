import 'package:url_launcher/url_launcher.dart';

class SigningBrokerAgreementRepository {
  SigningBrokerAgreementRepository();

  Future<bool> openAlpacaCustomerAgreement(
      signingBrokerAgreementRepository) async {
    try {
      await launchUrl(Uri.parse(signingBrokerAgreementRepository));
      return true;
    } catch (e) {
      return false;
    }
  }
}
