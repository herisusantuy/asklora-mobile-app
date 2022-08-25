import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/utils/app_icons.dart';
import '../../bloc/order_bloc.dart';
import 'order_screen.dart';
import 'order_type_screen.dart';
import 'regular_order_symbol_details_screen.dart';

class RegularOrderHomeScreen extends StatelessWidget {
  final OrderPageStep initialOrderPageStep;
  static const String route = '/order_regular';

  const RegularOrderHomeScreen(
      {this.initialOrderPageStep = OrderPageStep.symbolDetails, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => NavigationBloc<OrderPageStep>(initialOrderPageStep)),
        BlocProvider(create: (_) => OrderBloc()),
      ],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: BlocConsumer<NavigationBloc<OrderPageStep>,
              NavigationState<OrderPageStep>>(
            listenWhen: (_, current) => current.lastPage == true,
            listener: (context, state) {
              Navigator.pop(context);
            },
            builder: (context, state) => _pages(context, state),
          )),
    );
  }

  Widget _pages(BuildContext context, NavigationState navigationState) {
    OrderState orderState = context.read<OrderBloc>().state;
    switch (navigationState.page) {
      case OrderPageStep.symbolDetails:
        return const RegularOrderSymbolDetailsScreen();
      case OrderPageStep.order:
        return OrderScreen(
            symbolDetail: SymbolDetail('AAPL.O', '100', AppIcons.appleLogo));
      case OrderPageStep.orderType:
        return OrderTypeScreen(
          transactionType: orderState.transactionType,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
