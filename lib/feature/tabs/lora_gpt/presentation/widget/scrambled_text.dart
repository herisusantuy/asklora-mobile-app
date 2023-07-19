import 'dart:math';

import 'package:flutter/material.dart';

class Source {
  static const digits = '0123456789';
  static const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const lowercase = 'abcdefghijklmnopqrstuvwxyz';
  static const alphabets = '$uppercase$lowercase';
  static const specialCharacters = '`~!@#\$%^&*()_+-=[]{}\\|;:\'".>/?';
  static const all = '$digits$alphabets$specialCharacters';
}

class ScrambledText extends StatefulWidget {
  /// The text to display after animation is finished.
  final String text;

  /// Initial random text that you want to display
  final String? initialText;

  /// Boolean flag to auto play animation on start
  final bool shouldPlayOnStart;

  /// The text from which random characters will be displayed before
  /// the actual character
  final String randomString;

  /// The length of time this animation should last.
  final Duration duration;

  /// A function which will be triggered at the end of animation
  final VoidCallback? onFinished;

  /// A collection of common animation curves.
  final Curve curve;

  /// The style of the text with specified color, fontWeight, fontSize
  final TextStyle? style;

  /// Represents directionality of text.
  final TextDirection? textDirection;

  /// The Locale used for multiple language support
  final Locale? locale;

  /// The maximum number of lines of the text to be displayed before cropping
  final int? maxLines;

  /// The type of overflow in text
  final TextOverflow? overflow;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// An alternative semantics label for this text.
  final String? semanticsLabel;

  final int numLetters;

  const ScrambledText({
    Key? key,
    required this.text,
    this.initialText,
    this.shouldPlayOnStart = true,
    this.style,
    this.randomString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
    required this.duration,
    this.onFinished,
    this.curve = Curves.easeIn,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textAlign,
    this.semanticsLabel,
    this.numLetters = 3, 
  }) : super(key: key);
  
  @override
  State<ScrambledText> createState() => ScrambledTextState();
}

class ScrambledTextState extends State<ScrambledText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.text.length.toDouble(),
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    if (widget.shouldPlayOnStart) {
      play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animatedText(
        text: widget.text,
        value: _animation.value.toInt(),
      ),
      style: widget.style,
      textDirection: widget.textDirection,
      locale: widget.locale,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      softWrap: widget.softWrap,
      textAlign: widget.textAlign,
      semanticsLabel: widget.semanticsLabel,
    );
  }

  String _animatedText({required String text, required int value}) {
    if (!_controller.isAnimating && !_controller.isCompleted) {
      return widget.initialText ?? '';
    }

    if (value == text.length) {
      widget.onFinished?.call();
      return text;
    }

    int len = min(widget.numLetters, text.length - value);
    String scrambledPart = _getScrambledPart(len);
    String revealedPart = text.substring(0, value);

    return '$revealedPart$scrambledPart';
  }

  String _getScrambledPart(int len) {
    final random = Random();
    final randomString = StringBuffer();

    for (int i = 0; i < len; i++) {
      int index = random.nextInt(widget.randomString.length);
      randomString.writeCharCode(
        widget.randomString.codeUnitAt(index),
      );
    }

    return randomString.toString();
  }

  void play({double from = 0}) {
    _controller.forward(from: from);
  }
}
