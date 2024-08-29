import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LayoutGuard extends RouteGuard {
  LayoutGuard() : super(redirectTo: "${AppRoutes.homeV2.path}/");

  @override
  bool canActivate(String path, ModularRoute route) {
    return AppCore.getSettings().isBottomNavbarEnabled;
  }
}