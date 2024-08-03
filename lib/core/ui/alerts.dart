import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AppAlerts {
  static void showSendCapitalAlert(BuildContext context, String title,
      String description, String buttonLabel, VoidCallback onClose,
      [Image? image,
      Color buttonColor = Colors.blueGrey,
      TextStyle buttonTextStyle =
          const TextStyle(color: Colors.white, fontSize: 20)]) {
    Alert(
      context: context,
      title: title,
      desc: description,
      image: image,
      closeFunction: () {
        Navigator.pop(context);
        onClose();
      },
      buttons: [
        DialogButton(
          color: buttonColor,
          onPressed: () {
            Navigator.pop(context);
            onClose();
          },
          width: 120,
          child: Text(
            buttonLabel,
            style: buttonTextStyle,
          ),
        )
      ],
    ).show();
  }
}
