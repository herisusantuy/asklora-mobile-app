import 'package:flutter/material.dart';

import '../../styles/asklora_colors.dart';
import '../../utils/app_icons.dart';

class DotWidget extends StatefulWidget {
  const DotWidget() : super(key: const Key('ad'));

  @override
  DotWidgetState createState() => DotWidgetState();
}

class DotWidgetState extends State<DotWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animatable<Color?> background = TweenSequence<Color?>([
    TweenSequenceItem(
        weight: 0.1,
        tween: ColorTween(
          begin: AskLoraColors.primaryGreen,
          end: AskLoraColors.primaryMagenta,
        )),
    TweenSequenceItem(
        weight: 0.10,
        tween: ColorTween(
          begin: AskLoraColors.primaryMagenta,
          end: AskLoraColors.primaryBlue,
        ))
  ]);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
              child: getSvgIcon('asklora_dot_green',
                  color: background
                      .evaluate(AlwaysStoppedAnimation(_controller.value))));
        });
  }
}

/// Jumping Dot.
///
/// [numberOfDots] number of dots,
/// [color] color of dots.
/// [radius] radius of dots.
/// [animationDuration] animation duration in milliseconds
class JumpingDotsWidget extends StatefulWidget {
  final int numberOfDots;
  final Color color;
  final double radius;
  final double innerPadding;
  final Duration animationDuration;

  /// Defines how much the animation will offset negatively in the `y` axis.
  /// Can be either positive or negative, as it'll later be converted into its
  /// negative value.
  ///
  /// Non-finite or zero (0) values are not accepted.
  final double verticalOffset;

  JumpingDotsWidget({
    Key? key,
    this.numberOfDots = 3,
    this.radius = 10,
    this.innerPadding = 8,
    this.animationDuration = const Duration(milliseconds: 200),
    this.color = const Color(0xfff2c300),
    this.verticalOffset = -20,
  })  : assert(verticalOffset.isFinite,
            'Non-finite values cannot be set as an animation offset.'),
        assert(verticalOffset != 0,
            'Zero values (0) cannot be set as an animation offset.'),
        super(key: key);

  @override
  _JumpingDotsWidgetState createState() => _JumpingDotsWidgetState();
}

class _JumpingDotsWidgetState extends State<JumpingDotsWidget>
    with TickerProviderStateMixin {
  List<AnimationController>? _animationControllers;

  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers!) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initAnimation() {
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
            vsync: this, duration: widget.animationDuration);
      },
    ).toList();

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animations.add(Tween<double>(
              begin: 0,
              end:
                  -widget.verticalOffset.abs() // Ensure the offset is negative.
              )
          .animate(_animationControllers![i]));
    }

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animationControllers![i].addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationControllers![i].reverse();
          if (i != widget.numberOfDots - 1) {
            _animationControllers![i + 1].forward();
          }
        }
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers![0].forward();
        }
      });
    }
    _animationControllers!.first.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.numberOfDots, (index) {
            return AnimatedBuilder(
              animation: _animationControllers![index],
              builder: (context, child) {
                return Container(
                  padding: EdgeInsets.all(widget.innerPadding),
                  child: Transform.translate(
                    offset: Offset(0, _animations[index].value),
                    child: const DotWidget(),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
