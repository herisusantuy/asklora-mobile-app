import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'extensions.dart';

class AppIcons {
  static String barChart = 'assets/icons/bar_chart.png';
  static String stop = 'assets/icons/stop.png';
  static String saveMoney = 'assets/icons/save_money.png';
  static String route = 'assets/icons/route.png';
  static String financial = 'assets/icons/financial.png';
  static String appleLogo = 'assets/icons/apple_logo.png';
}

Widget getSvgIcon(String iconName) => SvgPicture.asset(iconName.svgIconPath);
