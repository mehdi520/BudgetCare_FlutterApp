import 'package:flutter/material.dart';

class AppBottomsheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        context: context,
        builder: (_) {
          return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: widget,
              ));
        });
  }
}
