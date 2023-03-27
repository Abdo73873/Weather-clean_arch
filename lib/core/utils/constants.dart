import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppConstants{
  static const String baseUrl="https://api.openweathermap.org/data/2.5";
  static const String appId="565ec54f7441e31deff1c9c20f4a431d";
}

class Constants {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('OK',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          )),
        ],
      ),
    );
  }

  static void showToast({
    required BuildContext context,
    required String message,
    MaterialColor? color,
}){}
}
