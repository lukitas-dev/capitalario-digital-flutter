import 'package:app/core/config/models/menu_item_info.dart';
import 'package:app/core/config/models/settings_info.dart';
import 'package:app/core/config/models/sidemenu_info.dart';

class AppConstants {
  ConfigConstants get config => ConfigConstants();
  MenuConstants get menu => MenuConstants();
  CollectionConstants get collections => CollectionConstants();
  DocumentConstants get documents => DocumentConstants();
  FieldConstants get fields => FieldConstants();
}

class ConfigConstants {
  String get homeInfo => "homeInfo";
  String get prayInfo => "prayInfo";
  String get givenInfo => "givenInfo";
  String get viewerInfo => "viewerInfo";

  //settings
  String get settingsInfo => "settingsInfo";
  String get settingsDefaults => SettingsInfo(
      name: "Capitalario Digital",
      backgroundColor: "#FFFFFF",
      toolbarBackgroundColor: "#1F2549",
      isSideMenuEnabled: true,
      sideMenuInfo: SideMenuInfo(backgroundColor: "#1F2549", showLogo: true, homeTitle: "Início"),
      menuItemList: [
        MenuItemInfo(title: "Oração", routePath: "/pray", isEnabled: true),
        MenuItemInfo(title: "Entrega", routePath: "/given", isEnabled: true),
        MenuItemInfo(title: "Visualizar", routePath: "/viewer", isEnabled: true),
      ]).toJson();
}

class MenuConstants {
  String get pray => "Oração";
  String get given => "Entrega";
  String get viewer => "Visualizar";
}

class CollectionConstants {
  String get main => "CapitalarioDigital";
  String get given => "GivenCapital";
}

class DocumentConstants {
  String get status => "status";
}

class FieldConstants {
  String get numberOfCapitalOfGrace => "numberOfCapitalOfGrace";
  String get numberOfSendedCapitalOfGrace => "numberOfSendedCapitalOfGrace";
}
