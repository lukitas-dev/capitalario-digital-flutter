import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/infrastructure/app_settings.dart';
import 'package:app/home/views/home_page.dart';
import 'package:app/pray/views/pray_page.dart';
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
      title: AppSettings.name,
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
    r.child(AppRoutes.home.path, child: (context) => const HomePage());
    r.child(AppRoutes.pray.path, child: (context) => const PrayPage());
  }
}
