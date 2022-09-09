part of '../order_screen.dart';

class OrderConfirmationButton<T extends StateStreamableSource<Object?>>
    extends StatelessWidget {
  final OrderState orderState;
  final Function onConfirmedTap;
  final SymbolDetail symbolDetail;
  final bool isLoading;
  final String errorText;
  final bool disable;

  const OrderConfirmationButton(
      {required this.orderState,
      required this.onConfirmedTap,
      required this.symbolDetail,
      this.errorText = '',
      this.disable = false,
      this.isLoading = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (errorText.isNotEmpty)
          CustomText(
            errorText,
            color: Colors.red,
          ),
        CustomTextButton(
          key: const Key('order_confirmation_button'),
          disable: disable,
          borderRadius: 5,
          isLoading: isLoading,
          padding: const EdgeInsets.all(10),
          buttonText: orderState.transactionType.name,
          onClick: () => showModalBottomSheet(
              context: context,
              builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<T>(context),
                    child: OrderConfirmationWidget(
                      onConfirmedTap: onConfirmedTap,
                      orderState: orderState,
                      symbolDetail: symbolDetail,
                    ),
                  )),
        ),
      ],
    );
  }
}
