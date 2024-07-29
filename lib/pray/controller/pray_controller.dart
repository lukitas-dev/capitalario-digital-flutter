import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/pray/models/pray_info.dart';
import 'package:app/pray/stores/pray_store.dart';
import 'package:flutter/material.dart';

class PrayController {
  PrayStore store = PrayStore();
  late PrayInfo info;

  setup() {
    store.setup((homeInfo) {
      info = homeInfo;
    });
  }

  Widget buildHeader() {
    if (info.headerImagePath.isNotEmpty) {
      return Header(
          backgroundImage: AssetImage(info.headerImagePath),
          backgroundGradientColor: AppColors.black,
          title: info.title,
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold));
    }
    return Container();
  }

  Widget buildTitle() {
    if (info.title.isNotEmpty) {
      return Text(
        info.title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
    }
    return Container();
  }

  Widget buildText() {
    if (info.text.isNotEmpty) {
      return Text(
        info.text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      );
    }
    return Container();
  }

  AppState getState() {
    return store.state;
  }
}
