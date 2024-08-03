import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/models/menu_item.dart';

class AppMenu {
  final _constants = AppCore.constants.menu;

  List<MenuItem> load() {
    return [
      MenuItem(title: _constants.pray, routePath: AppRoutes.pray.path),
      MenuItem(title: _constants.given, routePath: AppRoutes.given.path),
      MenuItem(title: _constants.viewer, routePath: AppRoutes.viewer.path),
    ];
  }
}
