import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  static String barChart = 'assets/icons/bar_chart.png';
  static String stop = 'assets/icons/stop.png';
  static String saveMoney = 'assets/icons/save_money.png';
  static String route = 'assets/icons/route.png';
  static String financial = 'assets/icons/financial.png';
  static String appleLogo = 'assets/icons/apple_logo.png';
}

Widget getSvgIcon(String iconName,
        {Color? color, double? height, double? width}) =>
    SvgPicture.asset('assets/icons/$iconName.svg',
        color: color, height: height, width: width);

Widget getPngIcon(String iconName, {double? height, double? width}) =>
    Image.asset(
      'assets/icons/$iconName.png',
      height: height,
      width: width,
    );

Widget getPngImage(String imageName,
        {double? height, double? width, Color? color}) =>
    Image.asset('assets/images/$imageName.png',
        height: height, width: width, color: color);

Widget getSvgImage(String assetName,
        {Color? color, double? height, double? width}) =>
    SvgPicture.asset('assets/images/$assetName.svg',
        color: color, height: height, width: width);
