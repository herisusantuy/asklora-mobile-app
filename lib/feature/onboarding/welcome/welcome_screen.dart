import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/animated_text.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/rotate_animated_text.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../auth/sign_in/presentation/sign_in_screen.dart';
import 'ask_name/presentation/ask_name_screen.dart';

part 'pages/welcome_page.dart';

part 'pages/carousel_page.dart';

enum WelcomePages { carousel, welcome }

class WelcomeScreen extends StatelessWidget {
  static const route = '/carousel_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: BlocProvider(
        create: (_) => NavigationBloc<WelcomePages>(WelcomePages.carousel),
        child: BlocBuilder<NavigationBloc<WelcomePages>,
                NavigationState<WelcomePages>>(
            builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _localisationToggle,
                    _content(state),
                    _bottomButton(context, state),
                  ],
                )),
      ),
    );
  }

  Widget get _localisationToggle => Padding(
        padding:
            AppValues.screenHorizontalPadding.copyWith(top: 15, bottom: 30),
        child: const LocalizationToggleButton(),
      );

  Widget _content(NavigationState<WelcomePages> state) => Expanded(
      child: state.page == WelcomePages.carousel
          ? const CarouselPage()
          : const WelcomePage());

  Widget _bottomButton(
          BuildContext context, NavigationState<WelcomePages> state) =>
      Padding(
        padding: AppValues.screenHorizontalPadding,
        child: ButtonPair(
            key: const Key('button_pair'),
            primaryButtonOnClick: () {
              if (state.page == WelcomePages.carousel) {
                context
                    .read<NavigationBloc<WelcomePages>>()
                    .add(const PageChanged(WelcomePages.welcome));
              } else {
                AskNameScreen.open(context);
              }
            },
            secondaryButtonOnClick: () => SignInScreen.open(context),
            primaryButtonLabel: S.of(context).buttonLetsBegin,
            secondaryButtonLabel: S.of(context).buttonHaveAnAccount),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);

  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}
