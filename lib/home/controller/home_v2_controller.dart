import 'package:mobx/mobx.dart';
part 'home_v2_controller.g.dart';

class HomeV2Controller = _HomeV2ControllerBase with _$HomeV2Controller;

abstract class _HomeV2ControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void updateCurrentIndex(int index) => currentIndex = index;
}