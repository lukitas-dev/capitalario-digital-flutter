import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/config/models/bottom_navbar_info.dart';
import 'package:app/core/config/models/menu_item_info.dart';
import 'package:app/core/config/models/navbar_info.dart';
import 'package:app/core/config/models/sidemenu_info.dart';

class SettingsInfo {
  final String name;
  final String backgroundColor;
  final bool isToolbarEnabled;
  final String toolbarBackgroundColor;
  final bool isSideMenuEnabled;
  final SideMenuInfo sideMenuInfo;
  final NavbarInfo navbarInfo;
  final bool isBottomNavbarEnabled;
  final BottomNavbarInfo bottomNavbarInfo;
  final List<MenuItemInfo> menuItemList;
  SettingsInfo({
    required this.name,
    required this.backgroundColor,
    required this.isToolbarEnabled,
    required this.toolbarBackgroundColor,
    required this.isSideMenuEnabled,
    required this.sideMenuInfo,
    required this.navbarInfo,
    required this.isBottomNavbarEnabled,
    required this.bottomNavbarInfo,
    required this.menuItemList,
  });

  SettingsInfo copyWith({
    String? name,
    String? backgroundColor,
    bool? isToolbarEnabled,
    String? toolbarBackgroundColor,
    bool? isSideMenuEnabled,
    SideMenuInfo? sideMenuInfo,
    NavbarInfo? navbarInfo,
    bool? isBottomNavbarEnabled,
    BottomNavbarInfo? bottomNavbarInfo,
    List<MenuItemInfo>? menuItemList,
  }) {
    return SettingsInfo(
      name: name ?? this.name,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isToolbarEnabled: isToolbarEnabled ?? this.isToolbarEnabled,
      toolbarBackgroundColor: toolbarBackgroundColor ?? this.toolbarBackgroundColor,
      isSideMenuEnabled: isSideMenuEnabled ?? this.isSideMenuEnabled,
      sideMenuInfo: sideMenuInfo ?? this.sideMenuInfo,
      navbarInfo: navbarInfo ?? this.navbarInfo,
      isBottomNavbarEnabled: isBottomNavbarEnabled ?? this.isBottomNavbarEnabled,
      bottomNavbarInfo: bottomNavbarInfo ?? this.bottomNavbarInfo,
      menuItemList: menuItemList ?? this.menuItemList,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'isToolbarEnabled': isToolbarEnabled});
    result.addAll({'toolbarBackgroundColor': toolbarBackgroundColor});
    result.addAll({'isSideMenuEnabled': isSideMenuEnabled});
    result.addAll({'sideMenuInfo': sideMenuInfo.toMap()});
    result.addAll({'navbarInfo': navbarInfo.toMap()});
    result.addAll({'isBottomNavbarEnabled': isBottomNavbarEnabled});
    result.addAll({'bottomNavbarInfo': bottomNavbarInfo.toMap()});
    result.addAll({'menuItemList': menuItemList.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory SettingsInfo.fromMap(Map<String, dynamic> map) {
    return SettingsInfo(
      name: map['name'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      isToolbarEnabled: map['isToolbarEnabled'] ?? false,
      toolbarBackgroundColor: map['toolbarBackgroundColor'] ?? '',
      isSideMenuEnabled: map['isSideMenuEnabled'] ?? false,
      sideMenuInfo: SideMenuInfo.fromMap(map['sideMenuInfo']),
      navbarInfo: NavbarInfo.fromMap(map['navbarInfo']),
      isBottomNavbarEnabled: map['isBottomNavbarEnabled'] ?? false,
      bottomNavbarInfo: BottomNavbarInfo.fromMap(map['bottomNavbarInfo']),
      menuItemList: List<MenuItemInfo>.from(map['menuItemList']?.map((x) => MenuItemInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsInfo.fromJson(String source) =>
      SettingsInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SettingsInfo(name: $name, backgroundColor: $backgroundColor, isToolbarEnabled: $isToolbarEnabled, toolbarBackgroundColor: $toolbarBackgroundColor, isSideMenuEnabled: $isSideMenuEnabled, sideMenuInfo: $sideMenuInfo, navbarInfo: $navbarInfo, isBottomNavbarEnabled: $isBottomNavbarEnabled, bottomNavbarInfo: $bottomNavbarInfo, menuItemList: $menuItemList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SettingsInfo &&
      other.name == name &&
      other.backgroundColor == backgroundColor &&
      other.isToolbarEnabled == isToolbarEnabled &&
      other.toolbarBackgroundColor == toolbarBackgroundColor &&
      other.isSideMenuEnabled == isSideMenuEnabled &&
      other.sideMenuInfo == sideMenuInfo &&
      other.navbarInfo == navbarInfo &&
      other.isBottomNavbarEnabled == isBottomNavbarEnabled &&
      other.bottomNavbarInfo == bottomNavbarInfo &&
      listEquals(other.menuItemList, menuItemList);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      backgroundColor.hashCode ^
      isToolbarEnabled.hashCode ^
      toolbarBackgroundColor.hashCode ^
      isSideMenuEnabled.hashCode ^
      sideMenuInfo.hashCode ^
      navbarInfo.hashCode ^
      isBottomNavbarEnabled.hashCode ^
      bottomNavbarInfo.hashCode ^
      menuItemList.hashCode;
  }
}
