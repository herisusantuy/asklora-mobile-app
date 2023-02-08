import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../utils/numerical_range_formatter.dart';

class NumberCounterInput extends StatefulWidget {
  final String label;
  final String initialValue;
  final bool active;
  final VoidCallback onTap;
  final Function(String?) onAmountChanged;
  const NumberCounterInput({
    required this.label,
    this.active = false,
    this.initialValue = '',
    required this.onAmountChanged,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<NumberCounterInput> createState() => _NumberCounterInputState();
}

class _NumberCounterInputState extends State<NumberCounterInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
    _controller.addListener(() {
      widget.onAmountChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.active) {
      _controller.text = '';
    }
    return _cardButton(children: [
      _counterButton(
          label: '-',
          onTap: () {
            int incrementAmount = int.parse(
                    _controller.text.isNotEmpty ? _controller.text : '0') -
                10;
            if (incrementAmount >= 0) {
              _controller.text = incrementAmount.toString();
            }
          }),
      _numberInput(),
      _counterButton(
          label: '+',
          onTap: () {
            int decrementAmount = int.parse(
                    _controller.text.isNotEmpty ? _controller.text : '0') +
                10;
            if (decrementAmount <= 100) {
              _controller.text = decrementAmount.toString();
            }
          }),
    ]);
  }

  Widget _cardButton({required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: widget.active ? 3 : 1,
            color:
                widget.active ? AskLoraColors.primaryGreen : AskLoraColors.gray,
          ),
        ),
        color: widget.active ? AskLoraColors.lightGreen : AskLoraColors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          focusColor: AskLoraColors.lightGreen,
          splashColor: AskLoraColors.lightGreen,
          highlightColor: AskLoraColors.lightGreen,
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: widget.active ? 10 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextNew(
                  widget.label,
                  style: AskLoraTextStyles.subtitle2,
                ),
                widget.active
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: children,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _counterButton({required String label, required VoidCallback onTap}) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: AskLoraColors.black,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 30,
          width: 30,
          child: CustomTextNew(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: AskLoraColors.primaryGreen),
          ),
        ),
      ),
    );
  }

  Widget _numberInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: 82,
        height: 40,
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            NumericalRangeFormatter(min: 0, max: 100)
          ],
          maxLengthEnforcement: MaxLengthEnforcement.none,
          controller: _controller,
          style: const TextStyle(
            fontSize: 15,
            fontFamilyFallback: ['Mulish'],
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: '0',
            filled: true,
            fillColor: AskLoraColors.white,
            contentPadding: const EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: AskLoraColors.darkGray)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: AskLoraColors.darkGray)),
            suffixText: '%',
          ),
        ),
      ),
    );
  }
}
