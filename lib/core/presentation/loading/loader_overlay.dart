import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/asklora_colors.dart';
import '../custom_in_app_notification.dart';
import 'overlay_controller_widget.dart';
import 'overlay_controller_widget_extension.dart';

class LoaderOverlay extends StatefulWidget {
  const LoaderOverlay({
    Key? key,
    this.overlayWidget,
    this.overlayOpacity,
    this.disableBackButton = true,
    this.overlayWholeScreen = true,
    this.overlayHeight,
    this.overlayWidth,
    this.closeOnBackButton = false,
    this.duration = Duration.zero,
    this.reverseDuration = Duration.zero,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    required this.child,
  }) : super(key: key);

  /// The widget of the overlay. This is great if you want to insert your own widget to serve as
  /// an overlay.
  final Widget? overlayWidget;

  /// The opacity of the overlay
  final double? overlayOpacity;

  /// Whether or not to disable the back button while loading.
  final bool disableBackButton;

  //Hide the loader when back button pressed
  final bool closeOnBackButton;

  /// This should be false if you want to have full control of the size of the overlay.
  /// This is generaly used in conjunction with [overlayHeight] and [overlayWidth] to
  /// define the desired size of the overlay.
  final bool overlayWholeScreen;

  /// The desired height of the overlay
  final double? overlayHeight;

  /// The desired width of the overlay
  final double? overlayWidth;

  /// The child that will have the overlay upon
  final Widget child;

  /// The duration when the overlay enters
  final Duration duration;

  /// The duration when the overlay exits
  final Duration? reverseDuration;

  /// The curve for the overlay to transition in
  final Curve switchInCurve;

  /// The curve for the overlay to transition out
  final Curve switchOutCurve;

  /// The transition builder for the overlay
  final Widget Function(Widget, Animation<double>) transitionBuilder;

  /// The layout builder for the overlay
  final Widget Function(Widget?, List<Widget>) layoutBuilder;

  static const _prefix = '@loader-overlay';

  static const defaultOverlayWidgetKey = Key('$_prefix/default-widget');

  static const opacityWidgetKey = Key('$_prefix/opacity-widget');

  static const defaultOpacityValue = 0.5;

  static const defaultOverlayColor = Colors.white;

  static const containerForOverlayColorKey =
      Key('$_prefix/container-for-overlay-color');

  static const useDefaultLoadingValue = true;

  @override
  _LoaderOverlayState createState() => _LoaderOverlayState();
}

class _LoaderOverlayState extends State<LoaderOverlay> {
  OverlayControllerWidget? _overlayControllerWidget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _overlayControllerWidget = OverlayControllerWidget.of(context);
    });
  }

  @override
  void dispose() {
    _overlayControllerWidget?.dispose();
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (context.loaderOverlay.visible && widget.closeOnBackButton) {
      context.loaderOverlay.hide();
    }
    return widget.disableBackButton;
  }

  @override
  Widget build(BuildContext context) {
    return OverlayControllerWidget(
      child: Builder(
        builder: (innerContext) => StreamBuilder<Map<String, dynamic>>(
          stream: innerContext.loaderOverlay.overlayController.visibilityStream,
          initialData: const <String, dynamic>{
            'loading': false,
            'inAppNotification': false,
            'widget': null,
            'message': ''
          },
          builder: (_, snapshot) {
            final visibilityStream =
                innerContext.loaderOverlay.overlayController.visibilityStream;

            final isLoading = snapshot.data!['loading'] as bool;
            final inAppNotification =
                snapshot.data!['inAppNotification'] as bool;
            final message = snapshot.data!['message'] as String;
            final widgetOverlay = snapshot.data!['widget'] as Widget?;

            if (isLoading) {
              BackButtonInterceptor.add(myInterceptor);
            } else {
              BackButtonInterceptor.remove(myInterceptor);
            }

            return Stack(
              children: <Widget>[
                widget.child,
                AnimatedSwitcher(
                  duration: widget.duration,
                  reverseDuration: widget.reverseDuration,
                  switchInCurve: widget.switchInCurve,
                  switchOutCurve: widget.switchOutCurve,
                  transitionBuilder: widget.transitionBuilder,
                  layoutBuilder: widget.layoutBuilder,
                  child: Stack(
                    children: [
                      inAppNotification
                          ? CustomInAppNotification(message: message)
                          : const SizedBox.shrink(),
                      isLoading
                          ? Stack(
                              children: _getLoadingWidget(
                              isLoading,
                            ))
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getLoadingWidget(bool isLoading) => [
        WillPopScope(
          onWillPop: () async => !widget.disableBackButton,
          child: Opacity(
            key: LoaderOverlay.opacityWidgetKey,
            opacity: isLoading
                ? (widget.overlayOpacity ?? LoaderOverlay.defaultOpacityValue)
                : 0,
            child: widget.overlayWholeScreen
                ? Container(
                    key: LoaderOverlay.containerForOverlayColorKey,
                    color: LoaderOverlay.defaultOverlayColor,
                  )
                : Center(
                    child: Container(
                      height: widget.overlayHeight,
                      width: widget.overlayWidth,
                      key: LoaderOverlay.containerForOverlayColorKey,
                      color: LoaderOverlay.defaultOverlayColor,
                    ),
                  ),
          ),
        ),
        _getDefaultLoadingWidget()
      ];

  Widget _getDefaultLoadingWidget() => Center(
          child: JumpingDots(
        color: Colors.yellow,
        radius: 30,
        numberOfDots: 3,
        animationDuration: const Duration(milliseconds: 300),
      ));
}

class DotWidget extends StatefulWidget {
  const DotWidget() : super(key: const Key('ad'));

  @override
  _DotWidgetState createState() => _DotWidgetState();
}

class _DotWidgetState extends State<DotWidget>
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
              child: SvgPicture.asset('assets/icons/asklora_dot_green.svg',
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
class JumpingDots extends StatefulWidget {
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

  JumpingDots({
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
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
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
