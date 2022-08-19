import 'package:flutter/material.dart';

class RCIWBottomSheet {
  static showSheet(List<Widget> items, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: items,
          );
        });
  }
}
