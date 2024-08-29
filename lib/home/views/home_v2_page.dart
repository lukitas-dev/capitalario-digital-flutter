import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:app/core/core.dart';
import 'package:app/given/views/given_page.dart';
import 'package:app/home/controller/home_v2_controller.dart';
import 'package:app/home/views/home_page.dart';
import 'package:app/pray/views/pray_page.dart';
import 'package:app/viewer/views/viewer_page.dart';

class HomeV2Page extends StatefulWidget {
  const HomeV2Page({Key? key}) : super(key: key);

  @override
  State<HomeV2Page> createState() => _HomeV2PageState();
}

class _HomeV2PageState extends State<HomeV2Page> {
  final _settings = AppCore.getSettings();
  final _controller = HomeV2Controller();

  @override
  Widget build(BuildContext context) {
    List widgetOptins = [
      HomePage(onSwitchItemMenu: (index) {
        log("BT: index -> $index");
        _controller.currentIndex = index;
      }),
      const PrayPage(),
      const GivenPage(),
      const ViewerPage(),
    ];
    return Scaffold(
      body: Observer(
        builder: (_) {
          return widgetOptins.elementAt(_controller.currentIndex);
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    final colors = AppCore.infra.colors;
    var info = _settings.bottomNavbarInfo;
    return Observer(builder: (_) {
      return BottomNavigationBar(
          backgroundColor: colors.fromHex(info.backgroundColor),
          selectedItemColor: colors.fromHex(info.selectedItemColor),
          unselectedItemColor: colors.fromHex(info.unselectedItemColor),
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _controller.currentIndex,
          onTap: (index) {
            log("index -> $index");
            _controller.updateCurrentIndex(index);
          },
          items: _buildItens());
    });
  }

  List<BottomNavigationBarItem> _buildItens() {
    List<BottomNavigationBarItem> navbarItemList = [];
    var menuItens = AppCore.infra.menu.load(_settings.menuItemList);
    log("creating itens on bottom navigation...");
    for (var item in menuItens) {
      navbarItemList
          .add(BottomNavigationBarItem(icon: item.icon, label: item.title));
      log("add -> ${item.title}");
    }
    return navbarItemList;
  }
}
