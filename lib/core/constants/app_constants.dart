import 'package:app/core/config/models/menu_item_info.dart';
import 'package:app/core/config/models/navbar_info.dart';
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
  String get homeInfo => "homeInfoJufemENJ24";
  String get prayInfo => "prayInfoJufemENJ24";
  String get givenInfo => "givenInfoJufemENJ24";
  String get viewerInfo => "viewerInfoJufemENJ24";

  //settings
  String get settingsInfo => "settingsInfo";
  String get settingsDefaults => SettingsInfo(
          name: "ENJ 2024",
          backgroundColor: "#FFFFFF",
          toolbarBackgroundColor: "#910909",
          isSideMenuEnabled: true,
          sideMenuInfo: SideMenuInfo(
              backgroundColor: "#910909",
              showLogo: true,
              homeTitle: "Início",
              textColor: "#FFFFFF",
              textSize: 24),
          navbarInfo: NavbarInfo(
              titleTextSize: 30,
              titleTextColor: "#910909",
              titleOnHoverColor: "#da9c3b",
              dividerColor: "#910909",
              textSize: 24,
              textColor: "#910909",
              onHoverColor: "#da9c3b",
              indicationColor: "#da9c3b"),
          menuItemList: [
            MenuItemInfo(title: "Oração", routePath: "/pray", isEnabled: true),
            MenuItemInfo(
                title: "Entrega", routePath: "/given", isEnabled: true),
            MenuItemInfo(
                title: "Visualizar", routePath: "/viewer", isEnabled: true),
          ]).toJson();
}

class MenuConstants {
  String get pray => "Oração";
  String get given => "Entrega";
  String get viewer => "Visualizar";
}

class CollectionConstants {
  String get main => "CapitalarioDigitalJufemENJ24";
  String get given => "GivenCapitalJufemENJ24";
}

class DocumentConstants {
  String get status => "status";
}

class FieldConstants {
  String get numberOfCapitalOfGrace => "numberOfCapitalOfGrace";
  String get numberOfSendedCapitalOfGrace => "numberOfSendedCapitalOfGrace";
}
