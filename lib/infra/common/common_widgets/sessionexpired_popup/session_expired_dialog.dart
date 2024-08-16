import 'package:flutter/material.dart';

class SessionExpiredDialog extends StatelessWidget {
  BuildContext mcontext;
  VoidCallback callback;
  SessionExpiredDialog({required this.mcontext,required this.callback});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Session Expired'),
      content:const Text('Your session has expired. Please log in again.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            callback();
            // AppNavigator.pushReplacement(context, LoginScreen());
          },
          child: const Text('Log In'),
        ),
      ],
    );
  }
}

void showSessionExpiredDialog(BuildContext mcontext,VoidCallback callback) {
  showDialog(
    context: mcontext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SessionExpiredDialog(mcontext: mcontext,callback: callback,);
    },
  );
}