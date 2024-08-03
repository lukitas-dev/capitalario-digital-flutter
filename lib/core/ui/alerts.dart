import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AppAlerts {
  static void showSendCapitalAlert(BuildContext context, String title, String description, String buttonLabel) {
    Alert(
      context: context,
      title: title,
      desc: description,
      image: Image.asset(AppAssets.giveSuccess.path, height: 200),
      closeFunction: () {
        Navigator.pop(context);
        Modular.to.navigate(AppRoutes.home.path);
      },
      buttons: [
        DialogButton(
          color: AppColors.yellow,
          onPressed: () {
            Navigator.pop(context);
            Modular.to.navigate(AppRoutes.home.path);
          },
          width: 120,
          child: Text(
            buttonLabel,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
