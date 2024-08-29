import 'package:app/home/controller/home_controller.dart';
import 'package:app/home/views/home_page.dart';
import 'package:app/home/views/home_v2_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addInstance(HomeController.new);
  }

  @override
  void routes(r) {
    r.child("/",
        child: (context) => const HomeV2Page(),
        transition: TransitionType.fadeIn);
  }
}
