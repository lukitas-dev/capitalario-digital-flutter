import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/layout/layout_guard.dart';
import 'package:app/given/views/given_page.dart';
import 'package:app/home/home_module.dart';
import 'package:app/home/views/home_page.dart';
import 'package:app/pray/views/pray_page.dart';
import 'package:app/viewer/views/viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCore.startup();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppCore.getSettings().name,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.home.path,
        child: (context) => HomePage(),
        transition: TransitionType.fadeIn,
        guards: [LayoutGuard()]);
    r.module(AppRoutes.homeV2.path,
        module: HomeModule(), transition: TransitionType.fadeIn);
    r.child(AppRoutes.pray.path,
        child: (context) => const PrayPage(),
        transition: TransitionType.fadeIn);
    r.child(AppRoutes.given.path,
        child: (context) => const GivenPage(),
        transition: TransitionType.fadeIn);
    r.child(AppRoutes.viewer.path,
        child: (context) => const ViewerPage(),
        transition: TransitionType.fadeIn);
  }
}
