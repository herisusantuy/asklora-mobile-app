part of '../../deposit_screen.dart';

class TransferDetailStep extends StatelessWidget {
  final String loraFPSId = '123455679';

  const TransferDetailStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DepositBaseStep(
      contents: [
        CustomTextNew(
          'Transfer HK\$10,000 to LORA',
          style: AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextNew(
          "Copy LORA's bank details and transfer at less HK\$10,000 from your bank account via FPS or Wire transfer.",
          style:
              AskLoraTextStyles.body2.copyWith(color: AskLoraColors.charcoal),
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextNew(
                "LORA'S FPS ID",
                style: AskLoraTextStyles.subtitleAllCap1
                    .copyWith(color: AskLoraColors.charcoal),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CustomTextNew(
                    loraFPSId,
                    style: AskLoraTextStyles.subtitleAllCap1
                        .copyWith(color: AskLoraColors.charcoal),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Clipboard.setData(ClipboardData(text: loraFPSId)).then(
                            (value) => CustomSnackBar(context)
                                .setMessage('Copied to clipboard')
                                .show()),
                    child: const Icon(
                      Icons.copy_rounded,
                      color: AskLoraColors.charcoal,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextNew(
                "LORA'S WIRE DETAILS",
                style: AskLoraTextStyles.subtitleAllCap1
                    .copyWith(color: AskLoraColors.charcoal),
              ),
            ),
            Flexible(
                child: PrimaryButton(
              label: 'VIEW DETAILS',
              onTap: () {},
              buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
              buttonPrimarySize: ButtonPrimarySize.small,
            ))
          ],
        ),
      ],
    );
  }
}
