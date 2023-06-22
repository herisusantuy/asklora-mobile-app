import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tab_screen_bloc.dart';
import '../../lora_gpt/presentation/lora_ai_screen.dart';

class AiOverlay extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;

  const AiOverlay({required this.maxHeight, required this.maxWidth, super.key});

  @override
  State<AiOverlay> createState() => _AiOverlayState();
}

class _AiOverlayState extends State<AiOverlay> with TickerProviderStateMixin {
  double _drawerBottom = double.infinity;
  late Animation<double> animation;
  late AnimationController controller;
  final Duration openAndCloseAnimationDuration =
      const Duration(milliseconds: 250);
  final Duration dragAnimationDuration = const Duration(milliseconds: 100);

  @override
  void dispose() {
    animation.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _drawerBottom = widget.maxHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<TabScreenBloc, TabScreenState>(
        listenWhen: (previous, current) =>
            previous.aiPageSelected != current.aiPageSelected,
        listener: (context, state) =>
            state.aiPageSelected ? _openAiOverlay() : _closeAiOverlay(),
        child: Positioned(
          width: widget.maxWidth,
          height: widget.maxHeight,
          top: _drawerBottom,
          child: GestureDetector(
            onPanEnd: _onPanEnd,
            onPanUpdate: _onPanUpdate,
            child: const LoraAiScreen(),
          ),
        ),
      );

  void _openAiOverlay() {
    controller = AnimationController(
        duration: openAndCloseAnimationDuration, vsync: this);
    animation = animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          _drawerBottom = widget.maxHeight - animation.value * widget.maxHeight;
        });
      });
    controller.forward();
  }

  void _closeAiOverlay() {
    final double startingPoint = _drawerBottom;
    controller = AnimationController(
        duration: openAndCloseAnimationDuration, vsync: this);
    animation = Tween<double>(begin: 1, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          _drawerBottom = widget.maxHeight -
              animation.value * (widget.maxHeight - startingPoint);
        });

        ///do something on close animation ends
        if (animation.value == 0) {
          _onClosed();
        }
      });
    controller.forward();
  }

  void _onDragExceedHalfOfScreen() {
    ///animation will pull down to bottom (close)
    final double startingPoint = _drawerBottom;
    controller =
        AnimationController(duration: dragAnimationDuration, vsync: this);
    animation = Tween<double>(begin: 1, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          _drawerBottom = widget.maxHeight -
              animation.value * (widget.maxHeight - startingPoint);
        });

        ///do something on close animation ends
        if (animation.value == 0) {
          _onClosed();
        }
      });
    controller.forward();
  }

  void _onDragBelowHalfOfScreen() {
    ///animation will pull up to top
    final double startingPoint = _drawerBottom;
    controller =
        AnimationController(duration: dragAnimationDuration, vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          _drawerBottom = startingPoint - startingPoint * animation.value;
        });
      });
    controller.forward();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    ///update position on drag
    setState(() {
      _drawerBottom += details.delta.dy;
    });
  }

  void _onPanEnd(DragEndDetails dragEndDetails) {
    ///do animation on drag release based on current position
    if (_drawerBottom >= widget.maxHeight / 2) {
      _onDragExceedHalfOfScreen();
    } else {
      _onDragBelowHalfOfScreen();
    }
  }

  void _onClosed() {
    ///update current tab highlight back to previous state
    final TabScreenBloc tabScreenBloc = context.read<TabScreenBloc>();
    tabScreenBloc.add(TabChanged(tabScreenBloc.state.currentTabPage));
  }
}
