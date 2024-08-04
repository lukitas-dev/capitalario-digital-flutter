import 'package:app/core/config/models/menu_item_info.dart';
import 'package:app/core/models/menu_item.dart';

class AppMenu {
  List<MenuItem> load(List<MenuItemInfo> itemList) {
    List<MenuItem> list = [];
    for (var item in itemList) {
      if (item.isEnabled) {
        list.add(MenuItem(title: item.title, routePath: item.routePath));
      }
    }
    return list;
  }
}
