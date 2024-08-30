import 'package:app/home/controller/home_controller.dart';
import 'package:app/home/views/home_page.dart';
import 'package:app/home/views/home_v2_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrayModule extends Module {
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child("/",
        child: (context) => const HomeV2Page(),
        transition: TransitionType.fadeIn);
  }
}
