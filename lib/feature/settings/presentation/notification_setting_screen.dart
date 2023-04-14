import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../generated/l10n.dart';

class NotificationSettingScreen extends StatelessWidget {
  static const route = '/notification_settings_screen';
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: CustomStretchedLayout(
            header: CustomHeader(title: S.of(context).notificationSetting),
            content: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) =>
                          previous.isAllowInAppNotification !=
                          current.isAllowInAppNotification,
                      builder: (context, state) {
                        return _toggleButton(
                            key: const Key('in_app_toggle'),
                            label: S.of(context).inApp,
                            value: state.isAllowInAppNotification,
                            onChanged: (value) => context
                                .read<AppBloc>()
                                .add(AllowInAppNotification(value)));
                      },
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) =>
                          previous.isAllowPushNotification !=
                          current.isAllowPushNotification,
                      builder: (context, state) {
                        return _toggleButton(
                            label: S.of(context).pushNotification,
                            value: state.isAllowPushNotification,
                            onChanged: (value) => context
                                .read<AppBloc>()
                                .add(AllowPushNotification(value)));
                      },
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) =>
                          previous.isAllowEmailNotification !=
                          current.isAllowEmailNotification,
                      builder: (context, state) {
                        return _toggleButton(
                            label: S.of(context).email,
                            value: state.isAllowEmailNotification,
                            onChanged: (value) => context
                                .read<AppBloc>()
                                .add(AllowEmailNotification(value)));
                      },
                    ),
                  ],
                );
              },
            )));
  }

  Widget _toggleButton(
      {Key? key,
      required String label,
      required void Function(bool) onChanged,
      required bool value}) {
    return Row(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextNew(
            label,
            style: AskLoraTextStyles.h6,
          ),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: AskLoraColors.primaryGreen,
        )
      ],
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
