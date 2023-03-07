import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/presentation/we_create/custom_centered_text_input.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../greeting/greeting_screen.dart';
import '../bloc/lora_ask_name_bloc.dart';
import '../repository/add_user_name_repository.dart';

class AskNameScreen extends StatelessWidget {
  static const route = '/lora_ask_name_screen';

  const AskNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: true,
      body: BlocProvider(
        create: (_) => LoraAskNameBloc(
            addUserNameRepository: AddUserNameRepository(),
            sharedPreference: SharedPreference()),
        child: BlocListener<LoraAskNameBloc, LoraAskNameState>(
          listener: (context, state) {
            if (state.response.state == ResponseState.loading) {
              CustomLoadingOverlay.of().show(context);
            } else {
              CustomLoadingOverlay.of().dismiss(context);
            }
            switch (state.response.state) {
              case ResponseState.error:
                CustomInAppNotification.show(context, state.response.message);
                break;
              case ResponseState.success:
                GreetingScreen.open(context, state.name);
                break;
              default:
                break;
            }
          },
          child: Builder(
            builder: (context) => CustomStretchedLayout(
              padding: AppValues.screenHorizontalPadding,
              contentPadding: EdgeInsets.zero,
              content: Column(
                children: [
                  LoraMemojiHeader(
                      text: S.of(context).askNameScreenPlaceholder),
                  CustomCenteredTextInput(
                      key: const Key('name_input'),
                      onChanged: (value) => context
                          .read<LoraAskNameBloc>()
                          .add(NameChanged(value)),
                      hintText: S.of(context).askNameScreenTextFieldHint,
                      textInputFormatterList: [fullEnglishNameFormatter()],
                      textCapitalization: TextCapitalization.words,
                      textInputType: TextInputType.text),
                ],
              ),
              bottomButton: _nextButton,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _nextButton => BlocBuilder<LoraAskNameBloc, LoraAskNameState>(
      builder: (context, state) => Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 35),
          child: PrimaryButton(
            key: const Key('next_button'),
            label: S.of(context).buttonNext,
            disabled: state.name.isEmpty || state.name.length < 3,
            onTap: () =>
                context.read<LoraAskNameBloc>().add(const SubmitUserName()),
          )));

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
