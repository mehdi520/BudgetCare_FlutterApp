import 'package:flutter/material.dart';

import '../../../core/core_exports.dart';

Future<bool?> showConfirmationDialog(
    BuildContext context, {
      required String title,
      required String content,
      String confirmButtonText = 'Yes',
      String cancelButtonText = 'No',
    }) async {
  return showDialog<bool>(
    context: context,

    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: AppColors.white,
        actions: <Widget>[
          TextButton(
            child: Text(cancelButtonText),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text(confirmButtonText,style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
