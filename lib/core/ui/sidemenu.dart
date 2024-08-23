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
      child: ListView(
        children: _getItens(context),
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
    list.add(Padding(padding: const EdgeInsets.only(left: 16, top: 8), child: ListTile(
      title: Text(
        homeTitle ?? "Home",
        style: TextStyle(
            color: textColor ?? Colors.amber,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () => Modular.to.navigate(AppRoutes.home.path),
    )));
    for (var item in menuItens) {
      list.add(Padding(padding: const EdgeInsets.only(left: 16, top: 8), child:  ListTile(
        title: Text(
          item.title,
          style: TextStyle(
              color: textColor ?? Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: () => Modular.to.navigate(item.routePath),
      )));
    }
    return list;
  }
}
