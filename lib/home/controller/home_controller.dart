import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/models/widget_options.dart';
import 'package:app/core/ui/button_box.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/home/models/home_info.dart';
import 'package:app/home/stores/home_store.dart';
import 'package:app/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
    }
    return Container();
  }

  Widget buildSubtitle() {
    if (info.subtitle.isNotEmpty) {
      return Text(
        info.subtitle,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      );
    }
    return Container();
  }

  List<Widget> buildButtonList(OnSwitchItemMenu? onSwitchItemMenu) {
    if (info.buttonList.isNotEmpty) {
      List<Widget> widgetList = [];
      for (final buttonInfo in info.buttonList) {
        widgetList.add(ButtonBox(
          onTap: () {
            if (onSwitchItemMenu == null) {
              Modular.to.navigate(buttonInfo.routePath);
            } else {
              onSwitchItemMenu(buttonInfo.menuIndex);
            }
          },
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
      }
      return widgetList;
    }
    return [Container()];
  }

  AppState getState() {
    return store.state;
  }
}
