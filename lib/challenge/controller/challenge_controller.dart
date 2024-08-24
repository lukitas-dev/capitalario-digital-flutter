import 'dart:developer';

import 'package:app/challenge/models/challenge_info.dart';
import 'package:app/challenge/store/challenge_store.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/models/widget_options.dart';
import 'package:app/core/ui/button_box.dart';
import 'package:app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChallengeController {
  ChallengeStore store = ChallengeStore();
  late ChallengeInfo info;
  final AppColors _colors = AppCore.infra.colors;

  setup() {
    store.setup((homeInfo) {
      info = homeInfo;
    });
  }

  List<Widget> buildButtonList(bool isDetail) {
    var list = isDetail ? info.buttonDetailList : info.buttonList;
    if (list.isNotEmpty) {
      List<Widget> widgetList = [];
      for (final buttonInfo in list) {
        widgetList.add(ButtonBox(
          onTap: () {
            if (isDetail) {
              _openLink(buttonInfo.routePath);
            } else {
              _openRoute(buttonInfo.routePath);
            }
          },
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

  _openRoute(String route) {
    log("open route -> $route");
    Modular.to.navigate(route);
  }

  _openLink(String url) {
    log("open link -> $url");
    AppUtils.openUrl(url);
  }

  String getTitle() {
    return info.toolbarTitle;
  }

  String getBackgroundImage() {
    return info.backgroundImagePath;
  }
}
