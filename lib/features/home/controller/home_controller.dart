import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/models/button_info.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/features/home/models/home_info.dart';
import 'package:app/features/home/stores/home_store.dart';
import 'package:flutter/material.dart';

class HomeController {
  HomeStore store = HomeStore();
  late HomeInfo info;

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

  Widget buildSubtitle() {
    if (info.title.isNotEmpty) {
      return Text(
        info.subtitle,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      );
    }
    return Container();
  }

  List<Widget> buildButtonList() {
    if (info.buttonList.isNotEmpty) {
      List<Widget> widgetList = [];
      for (final buttonInfo in info.buttonList) {
      }
    }
    return [Container()];
  }

  AppState getState() {
    return store.state;
  }
}
