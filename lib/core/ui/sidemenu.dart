import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SideMenu extends StatelessWidget {
  final Widget? header;
  final List<MenuItem> menuItens;
  const SideMenu({super.key, required this.menuItens, this.header});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.grey,
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
      title: const Text(
        "Home",
        style: TextStyle(color: AppColors.browLight, fontSize: 20),
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
