import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../domain/chart_models.dart';

class UiWidget extends StatefulWidget {
  final UiData uiData;
  final Function() onClick;
  final Function(OptionModel) onOptionClick;
  final Duration animationDuration;
  final Duration delayDuration;

  const UiWidget(
      {required this.uiData,
      required this.onClick,
      required this.onOptionClick,
      this.animationDuration = const Duration(milliseconds: 500),
      this.delayDuration = const Duration(milliseconds: 100),
      Key? key})
      : super(key: key);

  @override
  State<UiWidget> createState() => _UiWidgetState();
}

class _UiWidgetState extends State<UiWidget> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    animateFadeIn();
  }

  void animateFadeIn() async {
    await Future.delayed(widget.delayDuration);
    if (mounted) {
      setState(() {
        show = true;
      });
    }
  }

  void animateFadeOut() async {
    await Future.delayed(widget.delayDuration);
    if (mounted) {
      setState(() {
        show = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: widget.animationDuration,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: UnconstrainedBox(
          constrainedAxis: Axis.horizontal,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 64, bottom: 32),
                  margin: const EdgeInsets.only(top: 50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0XFFF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      CustomTextNew(
                        widget.uiData.text ?? '-',
                        style: AskLoraTextStyles.h6,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      if (widget.uiData.options != null)
                        ...widget.uiData.options!.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: PrimaryButton(
                              buttonPrimaryType:
                                  ButtonPrimaryType.ghostCharcoal,
                              label: e.text ?? '-',
                              onTap: () async {
                                animateFadeOut();
                                await Future.delayed(widget.animationDuration);
                                widget.onOptionClick(e);
                              },
                            ),
                          ),
                        ),
                      if (widget.uiData.options!.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: PrimaryButton(
                            label: widget.uiData.buttonLabel ?? '-',
                            onTap: () async {
                              animateFadeOut();
                              await Future.delayed(widget.animationDuration);
                              widget.onClick();
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.topCenter,
                  child: LoraMemojiWidget(
                    height: 100,
                    width: 100,
                    loraMemojiType: LoraMemojiType.lora1,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
