import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/utils/storage/cache/json_cache_shared_preferences.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/values/app_values.dart';
import '../../../onboarding/ppi/bloc/response/user_response_bloc.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/investment_style_welcome_screen.dart';
import '../../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../../../onboarding/welcome/ask_name/bloc/lora_ask_name_bloc.dart';
import '../../../onboarding/welcome/ask_name/repository/add_user_name_repository.dart';
import '../../sign_up/repository/sign_up_repository.dart';
import '../email_activation_bloc.dart';

class EmailActivationScreen extends StatelessWidget {
  static const route = '/email_activation_screen';

  const EmailActivationScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => UserResponseBloc(
                sharedPreference: SharedPreference(),
                ppiResponseRepository: PpiResponseRepository(),
                jsonCacheSharedPreferences: JsonCacheSharedPreferences())),
        BlocProvider(
            create: (_) => LoraAskNameBloc(
                addUserNameRepository: AddUserNameRepository(),
                sharedPreference: SharedPreference())),
        BlocProvider(
            create: (_) => EmailActivationBloc(SignUpRepository(),
                TokenRepository(), SharedPreference(), PpiResponseRepository())
              ..add(const StartListenOnDeeplink())),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<EmailActivationBloc, EmailActivationState>(
            listener: (context, state) {
              CustomLoadingOverlay.of(context).show(state.response.state);
              if (state.deeplinkStatus == DeeplinkStatus.success) {
                context
                    .read<AppBloc>()
                    .add(const SaveUserJourney(UserJourney.investmentStyle));
                InvestmentStyleWelcomeScreen.open(context);
              }
              switch (state.response.state) {
                case ResponseState.error:
                case ResponseState.success:
                  CustomInAppNotification.show(context, state.response.message);
                  break;
                default:
                  break;
              }
            },
          ),
          BlocListener<LoraAskNameBloc, LoraAskNameState>(
              listenWhen: (previous, current) =>
                  previous.response.state != current.response.state,
              listener: (context, state) {
                CustomLoadingOverlay.of(context).show(state.response.state);
                if (ResponseState.success == state.response.state) {
                  context.read<UserResponseBloc>().add(const ReSendResponse());
                }
              }),
          BlocListener<UserResponseBloc, UserResponseState>(
              listener: (context, state) {
            CustomLoadingOverlay.of(context).show(state.responseState);
            if (state.responseState == ResponseState.success) {
              Navigator.pop(context);
            }
          }),
        ],
        child: BlocBuilder<EmailActivationBloc, EmailActivationState>(
          builder: (context, state) {
            final headerWidget = state.deeplinkStatus == DeeplinkStatus.failed
                ? const LoraMemojiHeader(
                    text:
                        'Sorry! Your request has been timed out. Let’s try and activate your account again.',
                    loraMemojiType: LoraMemojiType.lora6)
                : LoraMemojiHeader(
                    loraMemojiType: LoraMemojiType.lora7,
                    text:
                        "We've sent an email to $userName Please use your phone to click on the activation link!");
            return WillPopScope(onWillPop: () {
              return Future.value(false);
            }, child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CustomScaffold(
                  enableBackNavigation: false,
                  body: Padding(
                    padding: AppValues.screenHorizontalPadding,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: constraint.maxHeight),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headerWidget,
                              ButtonPair(
                                  primaryButtonOnClick: () => context
                                      .read<EmailActivationBloc>()
                                      .add(ResendEmailActivationLink(userName)),
                                  secondaryButtonOnClick: () => context
                                      .read<LoraAskNameBloc>()
                                      .add(const ReSubmitUserName()),
                                  primaryButtonLabel: 'RESEND ACTIVATION LINK',
                                  secondaryButtonLabel: 'SIGN UP AGAIN')
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ));
          },
        ),
      ),
    );
  }

  static void open(BuildContext context, String userName) {
    Navigator.of(context).pushNamed(route, arguments: userName);
  }
}
