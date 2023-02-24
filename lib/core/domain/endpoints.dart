const v1 = '/api/v1/';
const v2 = '/api/v2/';
const accounts = 'accounts/';
const transactions = 'transactions/';
const orders = 'orders/';
const activities = 'activities/';

const String endpointSignIn = '${v2}auth/';
const String endpointSignOut = '${v1}auth/revoke/';
const String endpointSignUp = '$v1$accounts';
const String endpointResetPassword = '$v1$accounts/reset-password/';
const String endpointGetOtp = '$v1${accounts}otp/';
const String endpointGetSmsOtp = '$v2${accounts}request-sms-otp/';
const String endpointValidateEmail = '$v2${accounts}validate-email/';
const String endpointVerifyEmail = '$v1${accounts}verify-email/';
const String endpointUpgradeAccount = '$v1${accounts}upgrade/';
const String endpointGetAccount = '$v1$accounts';
const String endpointGetOnfidoToken = '$v1${accounts}onfido/sdk/token/';
const String endpointOnfidoOutcome = '$v1${accounts}onfido/sdk/outcome/';
const String endpointTokenVerify = '${v1}auth/verify/';
const String endpointTokenRefresh = '${v1}auth/refresh/';
const String endpointTaxInfo = '$v1${accounts}tax-info/';
const String endpointBankAccount = '$v1${accounts}bank-account-related/';
const String endpointWithdrawal = '$v1${transactions}withdraw/';
const String endpointProofOfRemittance = '$v1${transactions}remitance/';
const String endpointOrders = '$v1$orders';
const String endpointUserJourney = '$v2${activities}user-journey/';

/// PPI related

const endpointQuestion = 'questions';
const String endpointUser = 'user';
const String endpointAddAnswer = 'user/add-answer';
const String endpointAddBotChoice = 'user/add-choices';
const String endpointLinkedUser = '/linked';

///
/// URLS
///
const String depositGuideUrl = 'https://asklora.ai/faq/deposit-guide';
