const v1 = '/api/v1/';
const accounts = 'accounts/';

const String endpointSignIn = '${v1}auth/';
const String endpointSignOut = '${v1}auth/revoke/';
const String endpointSignUp = '$v1$accounts';
const String endpointResetPassword = '$v1$accounts/reset-password/';
const String endpointGetOtp = '$v1${accounts}otp/';
const String endpointVerifyEmail = '$v1${accounts}verify-email/';
const String endpointUpgradeAccount = '$v1${accounts}upgrade/';
const String endpointGetAccount = '$v1$accounts';
const String endpointGetOnfidoToken = '$v1${accounts}onfido/sdk/token';
const String endpointTokenVerify = '${v1}auth/verify/';
const String endpointTokenRefresh = '${v1}auth/refresh/';
