import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar.transparent({super.key})
      : super(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
}
