import 'package:app/core/constants/constants.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/models/menu_item.dart';

class AppMenu {
  static List<MenuItem> list() {
    return [
      MenuItem(title: AppConstants.prayMenu, routePath: AppRoutes.pray.path),
      MenuItem(title: AppConstants.givenMenu, routePath: AppRoutes.given.path),
      MenuItem(title: AppConstants.viewerMenu, routePath: AppRoutes.viewer.path),
    ];
  }
}
