part of '../home_screen_form.dart';

class HomeHorizontalPadding extends StatelessWidget {
  final Widget child;

  const HomeHorizontalPadding({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      );
}
