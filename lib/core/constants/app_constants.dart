import 'package:app/core/config/models/bottom_navbar_info.dart';
import 'package:app/core/config/models/menu_item_info.dart';
import 'package:app/core/config/models/navbar_info.dart';
import 'package:app/core/config/models/settings_info.dart';
import 'package:app/core/config/models/sidemenu_info.dart';
import 'package:app/core/infrastructure/app_assets.dart';

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
          isToolbarEnabled: true,
          toolbarBackgroundColor: "#1F2549",
          isSideMenuEnabled: true,
          sideMenuInfo: SideMenuInfo(
              backgroundColor: "#1F2549",
              showLogo: true,
              homeTitle: "Início",
              textColor: "#F6A44D",
              textSize: 24),
          navbarInfo: NavbarInfo(
              titleTextSize: 30,
              titleTextColor: "#1F2549",
              titleOnHoverColor: "#F6A44D",
              dividerColor: "#000000",
              textSize: 24,
              textColor: "#000000",
              onHoverColor: "#F6A44D",
              indicationColor: "#F6A44D"),
          isBottomNavbarEnabled: true,
          bottomNavbarInfo: BottomNavbarInfo(
              homeTitle: "Início",
              backgroundColor: "#1F2549",
              selectedItemColor: "#F6A44D",
              unselectedItemColor: "#FFFFFF"),
          menuItemList: [
            MenuItemInfo(
                iconPath: AppAssets.menuPray.path,
                title: "Início",
                routePath: "/",
                isEnabled: true),
            MenuItemInfo(
                iconPath: AppAssets.menuPray.path,
                title: "Oração",
                routePath: "/pray",
                isEnabled: true),
            MenuItemInfo(
                iconPath: AppAssets.menuGiven.path,
                title: "Entrega",
                routePath: "/given",
                isEnabled: true),
            MenuItemInfo(
                iconPath: AppAssets.menuViewer.path,
                title: "Visualizar",
                routePath: "/viewer",
                isEnabled: true),
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
