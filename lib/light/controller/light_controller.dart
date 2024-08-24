import 'dart:developer';

import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/models/widget_options.dart';
import 'package:app/core/ui/button_box.dart';
import 'package:app/core/utils/app_utils.dart';
import 'package:app/light/models/light_info.dart';
import 'package:app/light/stores/light_store.dart';
import 'package:flutter/material.dart';

class LightController {
  LightStore store = LightStore();
  late LightInfo info;
  final AppColors _colors = AppCore.infra.colors;

  setup() {
    store.setup((homeInfo) {
      info = homeInfo;
    });
  }

  List<Widget> buildButtonList() {
    if (info.buttonList.isNotEmpty) {
      List<Widget> widgetList = [];
      for (final buttonInfo in info.buttonList) {
        widgetList.add(ButtonBox(
          onTap: () => _openLink(buttonInfo.routePath),
          options: WidgetOptions(
              borderColor: _colors.fromHex(info.buttonStyle.borderColor),
              backgroundColor:
                  _colors.fromHex(info.buttonStyle.backgroundColor),
              textColor: _colors.fromHex(info.buttonStyle.textColor),
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

  _openLink(String url) {
    log("open link -> $url");
    AppUtils.openUrl(url);
  }

  String getTitle() {
    return info.toolbarTitle;
  }
}
