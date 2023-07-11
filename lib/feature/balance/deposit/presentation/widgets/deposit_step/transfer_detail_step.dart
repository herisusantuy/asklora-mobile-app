part of '../../deposit_screen.dart';

class TransferDetailStep extends StatelessWidget {
  final DepositType depositType;
  final String loraFPSId = '123455679';

  const TransferDetailStep({required this.depositType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DepositBaseStep(
      contents: [
        CustomTextNew(
          depositType == DepositType.firstTime
              ? S.of(context).transferInitialFundToAsklora
              : S.of(context).transferFundToAsklora,
          style: AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextNew(
          depositType.minDeposit != 0
              ? S
                  .of(context)
                  .firstTimeCopyAskloraBankDetails(depositType.minDepositString)
              : S.of(context).copyAskloraBankDetails,
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
                    onTap: () => Clipboard.setData(
                            ClipboardData(text: loraFPSId))
                        .then((value) => CustomInAppNotification.show(context,
                            "Asklora's FPS ID has been copied to the clipboard")),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const String label = 'VIEW DETAILS';
                  return SizedBox(
                    height: label.textHeight(AskLoraTextStyles.button2, 60),
                    child: PrimaryButton(
                      expandableHeight: true,
                      label: label,
                      onTap: () => _showWireDetails(context),
                      buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
                      buttonPrimarySize: ButtonPrimarySize.small,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _wireDetail(
          {required BuildContext context,
          required String title,
          required String value,
          bool useDivider = true}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            title,
            style:
                AskLoraTextStyles.body2.copyWith(color: AskLoraColors.darkGray),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextNew(
                value,
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.charcoal),
              )),
              GestureDetector(
                  onTap: () async =>
                      Clipboard.setData(ClipboardData(text: value)).then(
                        (value) => CustomInAppNotification.show(
                            context, '$title has been copied to the clipboard'),
                      ),
                  child: const Icon(
                    Icons.copy_rounded,
                    color: AskLoraColors.darkGray,
                  )),
            ],
          ),
          if (useDivider)
            const Divider(
              height: 32,
              thickness: 1,
            )
        ],
      );

  void _showWireDetails(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding:
              AppValues.screenHorizontalPadding.copyWith(top: 20, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: CustomTextNew(
                        'Wire Transfer',
                        style: AskLoraTextStyles.h6
                            .copyWith(color: AskLoraColors.charcoal),
                      )),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.close,
                          color: AskLoraColors.darkGray,
                        )),
                  )
                ],
              ),
              _wireDetail(context: context, title: 'Bank Number', value: '016'),
              _wireDetail(
                  context: context,
                  title: 'Account Number',
                  value: '1234567890'),
              _wireDetail(
                  context: context,
                  title: 'Bank Name',
                  value: 'DBS Bank (Hong Kong) Limited'),
              _wireDetail(
                  context: context, title: 'Swift Code', value: 'DHBKHKHH'),
              _wireDetail(
                  context: context,
                  title: 'Account Name',
                  value: 'LORA Advisors Limited'),
              _wireDetail(
                  context: context,
                  title: 'Company Address',
                  value: "G/F, The Center, 99 Queen's Road Central, Hong Kong"),
            ],
          ),
        ),
      );
}
