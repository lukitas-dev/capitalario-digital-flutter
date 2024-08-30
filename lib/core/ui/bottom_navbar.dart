import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/models/menu_item.dart';

class BottomNavbar extends StatefulWidget {
  final int selectedIndex;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final String? homeTitle;
  final List<MenuItem> menuItens;

  const BottomNavbar({
    Key? key,
    required this.selectedIndex,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.homeTitle,
    required this.menuItens,
  }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<BottomNavigationBarItem> navbarItemList = [];

  @override
  void initState() {
    _prepare();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: navbarItemList,
      currentIndex: widget.selectedIndex,
      showUnselectedLabels: true,
      backgroundColor: widget.backgroundColor,
      selectedItemColor: widget.selectedItemColor,
      unselectedItemColor: widget.unselectedItemColor,
      onTap: _onItemTapped,
    );
  }

  _prepare() {
    log("creating itens on bottom navigation...");
    navbarItemList.add(BottomNavigationBarItem(
        icon: const Icon(Icons.home), label: widget.homeTitle ?? "Home"));
    for (var item in widget.menuItens) {
      navbarItemList.add(
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: item.title));
      log("add -> ${item.title}");
    }
  }

  void _onItemTapped(int index) {
    log("selected index -> $index");
    if (index == 0) {
      Modular.to.navigate(AppRoutes.home.path);
    } else {
      Modular.to.navigate(widget.menuItens[index].routePath);
    }
    dispose();
  }
}
