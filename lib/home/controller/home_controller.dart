import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/models/widget_options.dart';
import 'package:app/core/ui/button_box.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/home/models/home_info.dart';
import 'package:app/home/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController {
  HomeStore store = HomeStore();
  late HomeInfo info;
  final AppColors _colors = AppCore.infra.colors;

  setup() {
    store.setup((homeInfo) {
      info = homeInfo;
    });
  }

  Widget buildHeader() {
    if (info.headerImagePath.isNotEmpty) {
      return Header(
          backgroundImage: AssetImage(info.headerImagePath),
          backgroundGradientColor: Colors.black,
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
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _colors.fromHex(info.textColor)),
      );
    }
    return Container();
  }

  Widget buildSubtitle() {
    if (info.subtitle.isNotEmpty) {
      return Text(
        info.subtitle,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: _colors.fromHex(info.textColor)),
      );
    }
    return Container();
  }

  List<Widget> buildButtonList() {
    if (info.buttonList.isNotEmpty) {
      List<Widget> widgetList = [];
      for (final buttonInfo in info.buttonList) {
        widgetList.add(ButtonBox(
          onTap: () => Modular.to.navigate(buttonInfo.routePath),
          options: WidgetOptions(
              borderColor:
                  AppCore.infra.colors.fromHex(info.buttonStyle.borderColor),
              backgroundColor: AppCore.infra.colors
                  .fromHex(info.buttonStyle.backgroundColor),
              textColor:
                  AppCore.infra.colors.fromHex(info.buttonStyle.textColor),
              height: info.buttonStyle.height,
              borderRadius: info.buttonStyle.borderRadius,
              textFontSize: info.buttonStyle.textFontSize),
          text: buttonInfo.title,
        ));
        widgetList.add(AppCore.infra.dimens.spaceHeigh16);
      }
      return widgetList;
    }
    return [Container()];
  }

  String getBackgroundImage() {
    return info.backgroundImagePath;
  }

  AppState getState() {
    return store.state;
  }
}
