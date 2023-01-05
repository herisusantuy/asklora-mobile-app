import 'package:flutter/material.dart';

import '../styles/asklora_colors.dart';

class CustomScaffold extends Scaffold {
  CustomScaffold(
      {super.key,
      required Widget body,
      bool enableBackNavigation = true,
      super.bottomNavigationBar})
      : super(
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: Stack(
              children: [
                SafeArea(child: body),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 10),
                  child: enableBackNavigation
                      ? Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: AskLoraColors.charcoal,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                        )
                      : null,
                )),
              ],
            ));
}
