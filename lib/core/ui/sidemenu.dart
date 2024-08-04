import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/models/menu_item.dart';

class SideMenu extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? header;
  final String? homeTitle;
  final List<MenuItem> menuItens;
  const SideMenu({
    Key? key,
    this.backgroundColor,
    this.textColor,
    this.header,
    this.homeTitle,
    required this.menuItens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor ?? Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: _getItens(context),
        ),
      ),
    );
  }

  List<Widget> _getItens(BuildContext context) {
    List<Widget> list = [];
    if (header != null) {
      list.add(header!);
      list.add(const Divider(
        height: 2,
      ));
    }
    list.add(ListTile(
      title: Text(
        homeTitle ?? "Home",
        style: TextStyle(color: textColor ?? Colors.amber, fontSize: 20),
      ),
      onTap: () => Modular.to.navigate(AppRoutes.home.path),
    ));
    for (var item in menuItens) {
      list.add(ListTile(
        title: Text(
          item.title,
          style: TextStyle(color: item.textColor, fontSize: item.textSize),
        ),
        onTap: () => Modular.to.navigate(item.routePath),
      ));
    }
    return list;
  }
}
