import 'package:flutter/material.dart';

class BreathingGlowingButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? buttonBackgroundColor;
  final Color? glowColor;
  final VoidCallback? onTap;
  final Widget child;

  const BreathingGlowingButton({
    super.key,
    this.width,
    this.height,
    this.buttonBackgroundColor,
    this.glowColor,
    this.onTap,
    required this.child,
  });

  @override
  BreathingGlowingButtonState createState() => BreathingGlowingButtonState();
}

class BreathingGlowingButtonState extends State<BreathingGlowingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    tenet();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.removeListener(() {});
    super.dispose();
  }

  /// Core animation control is done here.
  /// Animation completes in 2 seconds then repeat by reversing.
  void tenet() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 13.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final double width = widget.width ?? 60;
    final double height = widget.height ?? 60;
    final Color buttonBackgroundColor =
        widget.buttonBackgroundColor ?? const Color(0xFF373A49);
    final Color glowColor = widget.glowColor ?? const Color(0xFF777AF9);
    final Function onTap = widget.onTap ?? () {};

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: glowColor,
              blurRadius: _animation.value,
              spreadRadius: _animation.value,
            ),
          ],
        ),
        child: widget.child,
      ),
      onTap: () => onTap(),
    );
  }
}
