const v1 = '/api/v1/';
const v2 = '/api/v2/';
const accounts = 'accounts/';
const bots = 'bots/';
const transactions = 'transactions/';
const orders = 'orders/';
const activities = 'activities/';
const user = 'user/';

const String endpointSignIn = '${v2}auth/';
const String endpointSignOut = '${v1}auth/revoke/';
const String endpointSignUp = '$v1$accounts';
const String endpointResetPassword = '$v1$accounts/reset-password/';
const String endpointForgotPassword = '$v2${accounts}request-reset-password/';
const String endpointConfirmPassword = '$v2${accounts}confirm-password';
const String endpointGetOtp = '$v1${accounts}otp/';
const String endpointGetSmsOtp = '$v2${accounts}request-sms-otp/';
const String endpointValidateEmail = '$v2${accounts}validate-email/';
const String endpointVerifyEmail = '$v1${accounts}verify-email/';
const String endpointPersonalInfo = '$v2${accounts}upgrade/personal-info/';
const String endpointUpgradeAccount = '$v2${accounts}upgrade/ibkr/';
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
const String endpointLinkedUser = '$endpointUser/linked';

///
/// URLS
///
const String depositGuideUrl = 'https://asklora.ai/faq/deposit-guide';

const String endpointBotRecommendation = '${user}recomendation_bots/';
const String endpointBotDetail = '$v1${bots}bot_detail/';
